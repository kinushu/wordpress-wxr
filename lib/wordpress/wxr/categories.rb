require 'wordpress/wxr/category'

module Wordpress
  class WXR
    class Categories
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
          yield Category.new(node, wxr)
        end
      end

      def find_by(nicename:)
        return if nicename.empty?

        category = nodes.xpath("wp:category_nicename[text() = '#{nicename}']/parent::node()")
        return unless category

        Category.new(category, wxr)
      end

      private

      def nodes
        document.xpath('//wp:category')
      end
    end
  end
end
