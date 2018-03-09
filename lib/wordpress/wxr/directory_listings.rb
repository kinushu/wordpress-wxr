require 'wordpress/wxr/directory_listing'

module Wordpress
  class WXR
    class DirectoryListings
      include Enumerable

      attr_reader :document, :wxr
      private :document, :wxr

      def initialize(document, wxr)
        @document = document
        @wxr = wxr
      end

      def each
        return enum_for(:each) unless block_given?

        nodes.each do |node|
          yield DirectoryListing.new(node, wxr)
        end
      end

      private

      def nodes
        document.xpath("//item[wp:post_type = 'directory']")
      end
    end
  end
end
