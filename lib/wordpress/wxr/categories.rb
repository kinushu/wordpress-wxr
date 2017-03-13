require 'wordpress/wxr/category'

module Wordpress
  class WXR
    class Categories
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
        each.find { |category| category.nicename == nicename }
      end

      private

      def nodes
        document.xpath('//wp:category')
      end
    end
  end
end
