require 'spec_helper'
require 'uri'

describe 'Wordpress Directory Listing' do
  let(:directory_listing) { directory_listings.first }
  let(:directory_listings) { @wxr.directory_listings }

  describe '#title' do
    subject { directory_listing.title }
    it { is_expected.to eq('Luxury Car Rental') }
  end

  describe '#link' do
    subject { directory_listing.link }
    it { is_expected.to be_an_instance_of(URI::HTTP) }
    it { is_expected.to eq(URI('http://www.propertyportalwatch.com/?post_type=directory')) }
  end

  describe '#creator' do
    it 'returns the "admin" Author' do
      expect(directory_listing.creator.login).to eq('admin')
    end
  end

  describe '#guid' do
    subject { directory_listing.guid }
    it { is_expected.to eq('http://www.propertyportalwatch.com/?post_type=directory') }
  end

  describe '#content' do
    subject { directory_listing.content }
    it { is_expected.to eq('Dreams Star Luxury Car Transport is committed to provide one of a kind, proficient chauffeur-driven experience.') }
  end

  describe '#excerpt' do
    subject { directory_listing.excerpt }
    it { is_expected.to eq('Luxury Car Rental is awesome') }
  end

  describe '#id' do
    subject { directory_listing.id }
    it { is_expected.to eq(21152) }
  end

  describe '#posted_at' do
    subject { directory_listing.posted_at }
    it { is_expected.to eq(DateTime.parse('2016-09-23 21:09:04')) }
  end

  describe '#comment_status' do
    subject { directory_listing.comment_status }
    it { is_expected.to eq('closed') }
  end

  describe '#ping_status' do
    subject { directory_listing.ping_status }
    it { is_expected.to eq('closed') }
  end

  describe '#name' do
    subject { directory_listing.name }
    it { is_expected.to eq('') }
  end

  describe '#status' do
    subject { directory_listing.status }
    it { is_expected.to eq('pending') }
  end

  describe '#sticky?' do
    subject { directory_listing }
    it { is_expected.not_to be_sticky }
  end

  describe '#directory_name' do
    subject { directory_listing.directory_name }
    it { is_expected.to eq('companies' )}
  end

  describe '#contact_name' do
    subject { directory_listing.contact_name }
    it { is_expected.to eq('aboood ibrahim' )}
  end

  describe '#contact_email' do
    subject { directory_listing.contact_email }
    it { is_expected.to eq('aboood.ibrahim@mail.com' )}
  end

  describe '#contact_phone' do
    subject { directory_listing.contact_phone }
    it { is_expected.to eq('+971 55 235 5835' )}
  end

  describe '#country' do
    subject { directory_listing.country }
    it { is_expected.to eq ('United Arab Emirates') }
  end

  describe '#state' do
    subject { directory_listing.state }
    it { is_expected.to eq ('') }
  end

  describe '#city' do
    subject { directory_listing.city }
    it { is_expected.to eq ('') }
  end

  describe '#website' do
    subject { directory_listing.website }
    it { is_expected.to eq('http://www.dreamsstarlimo.com' )}
  end

  describe '#years_established' do
    subject { directory_listing.years_established }
    it { is_expected.to eq('1' )}
  end

  describe '#founder' do
    subject { directory_listing.founder }
    it { is_expected.to eq('John Smith' )}
  end

  describe '#ceo' do
    subject { directory_listing.ceo }
    it { is_expected.to eq('Tom Chaffee' )}
  end

  describe '#coo' do
    subject { directory_listing.coo }
    it { is_expected.to eq('Geri Chaffee' )}
  end

  describe '#cto' do
    subject { directory_listing.cto }
    it { is_expected.to eq('Trey Connell' )}
  end

  describe '#cfo' do
    subject { directory_listing.cfo }
    it { is_expected.to eq('Gene Sieburg' )}
  end

  describe '#annual_revenues' do
    subject { directory_listing.annual_revenues }
    it { is_expected.to eq('1000000' )}
  end

  describe '#market_segment' do
    subject { directory_listing.market_segment }
    it { is_expected.to eq('Technology' )}
  end

  describe '#business_model' do
    subject { directory_listing.business_model }
    it { is_expected.to eq('Basic' )}
  end

  describe '#market_coverage' do
    subject { directory_listing.market_coverage }
    it { is_expected.to eq('20' )}
  end

  describe '#average_monthly_traffic' do
    subject { directory_listing.average_monthly_traffic }
    it { is_expected.to eq('10000' )}
  end

  describe '#data_source' do
    subject { directory_listing.data_source }
    it { is_expected.to eq('Equifax' )}
  end

  describe '#technology_platform' do
    subject { directory_listing.technology_platform }
    it { is_expected.to eq('Ruby on Rails' )}
  end

  describe '#meta' do
    subject { directory_listing.meta }
    it { is_expected.to include('directory_type' => 'companies') }
    it { is_expected.to include('contact_details_0_contact_name' => 'aboood ibrahim') }
    it { is_expected.to include('contact_details_0_email' => 'aboood.ibrahim@mail.com') }
    it { is_expected.to include('contact_details_0_phone' => '+971 55 235 5835') }
    it { is_expected.to include('company_details_0_company_name' => 'Luxury Car Rental') }
    it { is_expected.to include('company_details_0_company_bio' => 'Dreams Star Luxury Car Transport is committed to provide one of a kind, proficient chauffeur-driven experience.') }
    it { is_expected.to include('company_details_0_company_website' => 'http://www.dreamsstarlimo.com') }
    it { is_expected.to include('company_details_0_number_of_years_established' => '1') }
    it { is_expected.to include('company_details_0_founder' => 'John Smith') }
    it { is_expected.to include('company_details_0_ceo' => 'Tom Chaffee') }
    it { is_expected.to include('company_details_0_cfo' => 'Gene Sieburg') }
    it { is_expected.to include('company_details_0_coo' => 'Geri Chaffee') }
    it { is_expected.to include('company_details_0_cto' => 'Trey Connell') }
    it { is_expected.to include('company_details_0_annual_revenues' => '1000000') }
    it { is_expected.to include('company_details_0_portal_market_segment' => 'Technology') }
    it { is_expected.to include('company_details_0_portal_business_model' => 'Basic') }
    it { is_expected.to include('company_details_0_portal_market_coverage' => '20') }
    it { is_expected.to include('company_details_0_average_monthly_traffic' => '10000') }
    it { is_expected.to include('company_details_0_data_source' => 'Equifax') }
    it { is_expected.to include('company_details_0_technology_platform' => 'Ruby on Rails') }
    it { is_expected.to include('company_details' => '1') }
  end
end
