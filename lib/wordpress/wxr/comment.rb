require 'wordpress/wxr/element'
require 'email_address'
require 'uri'

module Wordpress
  class WXR
    class Comment < Element
      def author
        node.xpath('wp:comment_author').text
      end

      def email
        EmailAddress.new(node.xpath('wp:comment_author_email').text)
      end

      def url
        URI(node.xpath('wp:comment_author_url').text)
      end

      def date
        DateTime.parse(node.xpath('wp:comment_date').text)
      end

      def content
        node.xpath('wp:comment_content').text
      end

      def approved?
        node.xpath('wp:comment_approved').text.to_i == 1
      end

      def ==(other)
        self.class == other.class &&
          email == other.email &&
          date == other.date &&
          content == other.content
      end
      alias eql? ==
    end
  end
end
