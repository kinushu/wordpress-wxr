require 'wordpress/wxr/tag'

module Wordpress
  class WXR
    class Tags
      attr_reader :document, :wxr
      private :document, :wxr

      def initialize(document, wxr)
        @document = document
        @wxr = wxr
      end

      def each
        return enum_for(:each) unless block_given?

        nodes.each do |node|
          yield Tag.new(node, wxr)
        end
      end

      def find_by(slug:)
        each.find { |tag| tag.slug == slug }
      end

      private

      def nodes
        document.xpath('//wp:tag')
      end
    end
  end
end
