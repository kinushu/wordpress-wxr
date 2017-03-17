require 'spec_helper'

describe 'Wordpress Author' do
  let(:author) { authors.first }
  let(:authors) { @wxr.authors }

  describe '#id' do
    subject { author.id }
    it { is_expected.to eq(1) }
  end

  describe '#login' do
    subject { author.login }
    it { is_expected.to eq('admin') }
  end

  describe '#email' do
    subject { author.email.to_s }
    it { is_expected.to eq('admin@example.com') }
  end

  describe '#display_name' do
    subject { author.display_name }
    it { is_expected.to eq('Administrator') }
  end

  describe '#first_name' do
    subject { author.first_name }
    it { is_expected.to eq('First') }
  end

  describe '#last_name' do
    subject { author.last_name }
    it { is_expected.to eq('Last') }
  end
end
