module Wordpress
  class WXR
    class Element
      attr_reader :node, :wxr
      private :node, :wxr

      def initialize(node, wxr)
        @node = node
        @wxr = wxr
      end
    end
  end
end
