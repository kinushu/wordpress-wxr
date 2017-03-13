require 'wordpress/wxr/post'

module Wordpress
  class WXR
    class Posts
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
          yield Post.new(node, wxr)
        end
      end

      private

      def nodes
        document.xpath("//item[wp:post_type = 'post']")
      end
    end
  end
end
