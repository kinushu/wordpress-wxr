require 'wordpress/wxr/element'

module Wordpress
  class WXR
    class Tag < Element
      def id
        Integer(node.xpath('wp:term_id').text)
      end

      def slug
        node.xpath('wp:tag_slug').text
      end

      def name
        node.xpath('wp:tag_name').text
      end

      def ==(other)
        self.class == other.class &&
          (name == other.name || id == other.id)
      end
      alias eql? ==
    end
  end
end
