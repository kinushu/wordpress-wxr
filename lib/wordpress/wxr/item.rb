require 'wordpress/wxr/element'
require 'wordpress/wxr/tag'
require 'wordpress/wxr/category'
# require 'wordpress/wxr/comments'

require 'date'
require 'uri'

module Wordpress
  class WXR
    class Item < Element
      def title
        node.xpath('title').text
      end

      def link
        URI(node.xpath('link').text)
      end

      def creator
        wxr.authors.find_by(login: node.xpath('dc:creator').text)
      end

      def guid
        node.xpath('guid').text
      end

      def content
        node.xpath('content:encoded').text
      end

      def excerpt
        node.xpath('excerpt:encoded').text
      end

      def id
        Integer(node.xpath('wp:post_id').text)
      end

      def posted_at
        # Attempt to use the GMT post date since it includes a timezone.
        # Failing that, use the post_date which will use the current timezone.
        DateTime.parse(node.xpath('wp:post_date_gmt').text)
      rescue ArgumentError
        DateTime.parse node.xpath('wp:post_date').text
      end

      def comment_status
        # TODO: `opened` or `closed`
        node.xpath('wp:comment_status').text
      end

      def ping_status
        node.xpath('wp:ping_status').text
      end

      def name
        node.xpath('wp:post_name').text
      end

      def status
        node.xpath('wp:status').text
      end

      def tags
        # xml dump has "post_tag" for wordpress 3.1 and "tag" for 3.0
        path = if node.xpath("category[@domain='post_tag']").count > 0
                 "category[@domain='post_tag']"
               else
                 "category[@domain='tag']"
               end

        node.xpath(path).map do |tag_node|
          wxr.tags.find_by(slug: tag_node['nicename'])
        end
      end

      def categories
        node.xpath("category[@domain='category']").map do |cat|
          wxr.categories.find_by(nicename: cat['nicename'])
        end
      end

      # def comments
      #   node.xpath('wp:comment').map do |comment_node|
      #     Comment.new(comment_node)
      #   end
      # end

      # TODO: status: publish, draft, pending, private, trash, inherit
      def draft?
        status != 'publish'
      end

      def published?
        !draft?
      end

      def sticky?
        !node.xpath('wp:is_sticky').text.to_i.zero?
      end

      def ==(other)
        self.class == other.class &&
          id == other.id
      end
      alias eql? ==
    end
  end
end
