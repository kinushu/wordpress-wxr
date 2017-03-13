require 'spec_helper'

describe Wordpress::WXR do
  subject { @wxr }

  describe '.parse' do
    it { is_expected.to be_an_instance_of(Wordpress::WXR) }
  end

  shared_examples 'a collection of' do |method, instance_class|
    describe "##{method}" do
      it "returns a collection of WordPress::WXR::#{instance_class} objects" do
        collection = subject.public_send(method.to_sym).each
        collection_type = Wordpress::WXR.const_get(instance_class)
        expect(collection).to include(an_instance_of(collection_type))
      end
    end
  end

  include_examples 'a collection of', 'attachments', 'Attachment'
  include_examples 'a collection of', 'authors', 'Author'
  include_examples 'a collection of', 'categories', 'Category'
  include_examples 'a collection of', 'pages', 'Page'
  include_examples 'a collection of', 'posts', 'Post'
  include_examples 'a collection of', 'tags', 'Tag'
end
