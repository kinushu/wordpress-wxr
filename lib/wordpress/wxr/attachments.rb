require 'wordpress/wxr/attachment'

module Wordpress
  class WXR
    class Attachments
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
          yield Attachment.new(node, wxr)
        end
      end

      def find_by(id:)
        attachment = nodes.xpath("wp:post_id[text() = '#{Integer(id)}']/parent::node()")
        return unless attachment

        Attachment.new(attachment, wxr)
      end

      private

      def nodes
        document.xpath("//item[wp:post_type = 'attachment']")
      end
    end
  end
end
