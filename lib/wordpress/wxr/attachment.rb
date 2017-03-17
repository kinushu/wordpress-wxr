require 'wordpress/wxr/item'
require 'cgi'
require 'uri'

module Wordpress
  class WXR
    class Attachment < Item
      # Internal: Add methods to normalize potential utf-8 encodings into
      # standard ASCII escaping to feed into URI which dies on utf-8 characters.
      module Refinements
        refine String do
          def replace_spaces_with_hex_encoding
            gsub(/\s/, '%20')
          end

          def percent_encode_non_ascii
            encode(Encoding.find('ASCII'), invalid: :replace, fallback: ->(char) { CGI.escape(char) })
          end
        end
      end

      using Refinements

      def url
        URI(String(node.xpath('wp:attachment_url').text).replace_spaces_with_hex_encoding.percent_encode_non_ascii)
      end
    end
  end
end
