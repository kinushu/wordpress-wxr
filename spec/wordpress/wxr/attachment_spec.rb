require 'spec_helper'
require 'uri'
require 'date'

describe 'Wordpress Attachment' do
  let(:attachment) { attachments.first }
  let(:attachments) { @wxr.attachments }

  describe '#url' do
    subject { attachment.url }
    it { is_expected.to be_an_instance_of(URI::HTTP) }
    it { is_expected.to eq(URI('http://www.example.com/wp-content/uploads/2007/03/attachment.jpg')) }
  end

  describe '#title' do
    subject { attachment.title }
    it { is_expected.to eq('attachment.jpg') }
  end

  describe '#link' do
    subject { attachment.link }
    it { is_expected.to be_an_instance_of(URI::HTTP) }
    it { is_expected.to eq(URI('http://www.example.com/contributors/attachmentjpg')) }
  end

  describe '#creator' do
    it 'returns the "admin" Author' do
      expect(attachment.creator.login).to eq('admin')
    end
  end

  describe '#guid' do
    subject { attachment.guid }
    it { is_expected.to eq('http://www.example.com/blog/wp-content/uploads/2007/03/attachment.jpg') }
  end

  describe '#id' do
    subject { attachment.id }
    it { is_expected.to eq(16) }
  end

  describe '#posted_at' do
    subject { attachment.posted_at }
    it { is_expected.to eq(DateTime.parse('2007-04-01 04:00:48Z')) }
  end
end
