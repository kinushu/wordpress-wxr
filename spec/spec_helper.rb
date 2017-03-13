$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wordpress/wxr'

RSpec.configure do |c|
  c.before(:context) do
    @wxr = Wordpress::WXR.parse(File.expand_path('../sample.xml', __FILE__))
  end
end
