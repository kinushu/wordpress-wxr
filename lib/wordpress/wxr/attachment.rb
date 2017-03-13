require 'wordpress/wxr/item'
require 'uri'

module Wordpress
  class WXR
    class Attachment < Item
      def url
        URI(node.xpath('wp:attachment_url').text)
      end
    end
  end
end
