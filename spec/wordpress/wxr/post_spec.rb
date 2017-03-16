require 'spec_helper'
require 'uri'

describe 'Wordpress Post' do
  let(:post) { posts.first }
  let(:posts) { @wxr.posts }

  describe '#title' do
    subject { post.title }
    it { is_expected.to eq('Sample Post') }
  end

  describe '#link' do
    subject { post.link }
    it { is_expected.to be_an_instance_of(URI::HTTP) }
    it { is_expected.to eq(URI('http://www.example.com/?p=1131')) }
  end

  describe '#creator' do
    it 'returns the "admin" Author' do
      expect(post.creator.login).to eq('admin')
    end
  end

  describe '#guid' do
    subject { post.guid }
    it { is_expected.to eq('http://www.example.com/blog/?p=1131') }
  end

  describe '#content' do
    subject { post.content }
    it { is_expected.to eq('Sample Post Content') }
  end

  describe '#excerpt' do
    subject { post.excerpt }
    it { is_expected.to eq('Sample Post Excerpt') }
  end

  describe '#id' do
    subject { post.id }
    it { is_expected.to eq(1131) }
  end

  describe '#posted_at' do
    subject { post.posted_at }
    it { is_expected.to eq(DateTime.parse('2010-07-22 13:28:04')) }
  end

  describe '#comment_status' do
    subject { post.comment_status }
    it { is_expected.to eq('open') }
  end

  describe '#ping_status' do
    subject { post.ping_status }
    it { is_expected.to eq('open') }
  end

  describe '#name' do
    subject { post.name }
    it { is_expected.to eq('Post Name') }
  end

  describe '#status' do
    subject { post.status }
    it { is_expected.to eq('publish') }
  end

  describe '#sticky?' do
    subject { post }
    it { is_expected.to be_sticky }
  end

  describe '#tags' do
    subject { post.tags.map(&:slug) }
    it { is_expected.to include('2017-tag', 'topic-tag') }
  end

  describe '#categories' do
    subject { post.categories.map(&:nicename) }
    it { is_expected.to include('uncategorized') }
  end

  describe '#comments' do
    pending
  end

  describe '#meta' do
    subject { post.meta }
    it { is_expected.to include('post_views_count' => '0') }
    it { is_expected.to include('_edit_last' => '4') }
  end
end
