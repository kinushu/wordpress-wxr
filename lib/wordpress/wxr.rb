require 'nokogiri'

require 'wordpress/wxr/attachments'
require 'wordpress/wxr/authors'
require 'wordpress/wxr/categories'
require 'wordpress/wxr/pages'
require 'wordpress/wxr/posts'
require 'wordpress/wxr/tags'
require 'wordpress/wxr/directory_listings'
require 'wordpress/wxr/version'

module Wordpress
  class WXR
    def self.parse(path_to_xml)
      file = File.open(path_to_xml)
      new(::Nokogiri::XML(file.read.delete("\u0004")))
    end

    attr_reader :document
    private :document

    def initialize(document)
      @document = document
      freeze
    end

    def attachments
      Attachments.new(document, self)
    end

    def authors
      Authors.new(document, self)
    end

    def categories
      Categories.new(document, self)
    end

    def pages
      Pages.new(document, self)
    end

    def posts(type = 'post')
      Posts.new(document, type, self)
    end

    def tags
      Tags.new(document, self)
    end

    def directory_listings
      DirectoryListings.new(document, self)
    end

    def root
      tgt_node = document.css('channel')
      Item.new(tgt_node, self)
    end
  end
end
