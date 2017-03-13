require 'wordpress/wxr/element'

module Wordpress
  class WXR
    class Category < Element
      def id
        Integer(node.xpath('wp:term_id').text)
      end

      def nicename
        node.xpath('wp:category_nicename').text
      end

      def parent
        wxr.categories.find_by(nicename: node.xpath('wp:category_parent').text)
      end

      def name
        node.xpath('wp:cat_name').text
      end

      def ==(other)
        self.class == other.class &&
          id == other.id
      end
      alias eql? ==
    end
  end
end
