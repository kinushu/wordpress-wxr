require 'spec_helper'

describe 'Wordpress Category' do
  let(:category) { categories.each.lazy.first }
  let(:categories) { @wxr.categories }

  describe '#id' do
    subject { category.id }
    it { is_expected.to eq(525) }
  end

  describe '#nicename' do
    subject { category.nicename }
    it { is_expected.to eq('top-level-topic') }
  end

  describe '#parent' do
    let(:top_level) { categories.find_by(nicename: 'top-level-topic') }
    let(:child_level) { categories.find_by(nicename: 'child-level-topic') }

    context 'when the category has no parent' do
      it 'returns nil' do
        expect(top_level.parent).to be_nil
      end
    end

    context 'when the category has a parent' do
      it 'returns the parent Category' do
        expect(child_level.parent).to eq(top_level)
      end
    end
  end

  describe '#name' do
    subject { category.name }
    it { is_expected.to eq('Top Level Topic') }
  end
end
