require 'spec_helper'

describe 'Wordpress Tag' do
  let(:tag) { tags.first }
  let(:tags) { @wxr.tags.each.lazy }

  describe '#id' do
    subject { tag.id }
    it { is_expected.to eq(680) }
  end

  describe '#slug' do
    subject { tag.slug }
    it { is_expected.to eq('2017-tag') }
  end

  describe '#name' do
    subject { tag.name }
    it { is_expected.to eq('2017 Tag') }
  end
end
