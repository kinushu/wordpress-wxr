require 'wordpress/wxr/element'
require 'email_address'

module Wordpress
  class WXR
    class Author < Element
      def id
        Integer(node.xpath('wp:author_id').text)
      end

      def login
        node.xpath('wp:author_login').text
      end

      def email
        EmailAddress.new(node.xpath('wp:author_email').text)
      end

      def display_name
        node.xpath('wp:author_display_name').text
      end

      def first_name
        node.xpath('wp:author_first_name').text
      end

      def last_name
        node.xpath('wp:author_last_name').text
      end

      def ==(other)
        self.class == other.class &&
          id == other.id &&
          login == other.login
      end
      alias eql? ==
    end
  end
end
