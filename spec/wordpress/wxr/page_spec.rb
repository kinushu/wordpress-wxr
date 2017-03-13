require 'spec_helper'
require 'uri'
require 'date'

describe 'Wordpress Page' do
  let(:page) { pages.first }
  let(:pages) { @wxr.pages.each.lazy }

  describe '#title' do
    subject { page.title }
    it { is_expected.to eq('Contributors') }
  end

  describe '#link' do
    subject { page.link }
    it { is_expected.to be_an_instance_of(URI::HTTP) }
    it { is_expected.to eq(URI('http://www.example.com/contributors')) }
  end

  describe '#creator' do
    it 'returns the "admin" Author' do
      expect(page.creator.login).to eq('admin')
    end
  end

  describe '#guid' do
    subject { page.guid }
    it { is_expected.to eq('http://www.example.com/blog/?page_id=4') }
  end

  describe '#content' do
    subject { page.content }
    it { is_expected.to eq('<h1>Sample Page Content</h1>') }
  end

  describe '#excerpt' do
    subject { page.excerpt }
    it { is_expected.to eq('Sample Page Excerpt') }
  end

  describe '#id' do
    subject { page.id }
    it { is_expected.to eq(4) }
  end

  describe '#posted_at' do
    subject { page.posted_at }
    it { is_expected.to eq(DateTime.parse('2007-03-12 17:48:48')) }
  end

  describe '#comment_status' do
    subject { page.comment_status }
    it { is_expected.to eq('closed') }
  end

  describe '#ping_status' do
    subject { page.ping_status }
    it { is_expected.to eq('closed') }
  end

  describe '#name' do
    subject { page.name }
    it { is_expected.to eq('contributors') }
  end

  describe '#status' do
    subject { page.status }
    it { is_expected.to eq('publish') }
  end

  describe '#sticky?' do
    subject { page }
    it { is_expected.not_to be_sticky }
  end

  describe '#tags' do
    subject { page.tags.map(&:slug) }
    it { is_expected.to include('2017-tag', 'topic-tag') }
  end

  describe '#categories' do
    subject { page.categories.map(&:nicename) }
    it { is_expected.to include('uncategorized') }
  end

  describe '#comments' do
    pending
  end
end
