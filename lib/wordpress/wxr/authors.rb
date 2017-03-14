require 'wordpress/wxr/author'

module Wordpress
  class WXR
    class Authors
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
          yield Author.new(node, wxr)
        end
      end

      def find_by(login:)
        return if login.empty?

        author = nodes.xpath("wp:author_login[text() = '#{login}']/parent::node()")
        return unless author

        Author.new(author, wxr)
      end

      private

      def nodes
        document.xpath('//wp:author')
      end
    end
  end
end
