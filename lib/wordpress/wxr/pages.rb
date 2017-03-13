require 'wordpress/wxr/page'

module Wordpress
  class WXR
    class Pages
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
          yield Page.new(node, wxr)
        end
      end

      private

      def nodes
        document.xpath("//item[wp:post_type = 'page']")
      end
    end
  end
end
