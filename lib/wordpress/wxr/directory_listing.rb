require 'wordpress/wxr/item'
require 'php-serialize'

module Wordpress
  class WXR
    class DirectoryListing < Item
      def content
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_company_bio']").at_xpath('wp:meta_value').try(:text)
      end

      def directory_name
        node.xpath("wp:postmeta[wp:meta_key = 'directory_type']").at_xpath('wp:meta_value').try(:text)
      end

      def contact_name
        node.xpath("wp:postmeta[wp:meta_key = 'contact_details_0_contact_name']").at_xpath('wp:meta_value').try(:text)
      end

      def contact_email
        node.xpath("wp:postmeta[wp:meta_key = 'contact_details_0_email']").at_xpath('wp:meta_value').try(:text)
      end

      def contact_phone
        node.xpath("wp:postmeta[wp:meta_key = 'contact_details_0_phone']").at_xpath('wp:meta_value').try(:text)
      end

      def country
        unserialize('company_details_0_country_of_origin', 'country_name')
      end

      def state
        unserialize('company_details_0_state_of_origin', 'state_name')
      end

      def city
        unserialize('company_details_0_city_of_origin', 'city_name')
      end

      def country
        unserialize('company_details_0_country_of_origin', 'country_name')
      end

      def state
        unserialize('company_details_0_country_of_origin', 'state_name')
      end

      def city
        unserialize('company_details_0_country_of_origin', 'city_name')
      end

      def website
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_company_website']").at_xpath('wp:meta_value').try(:text)
      end

      def years_established
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_number_of_years_established']").at_xpath('wp:meta_value').try(:text)
      end

      def founder
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_founder']").at_xpath('wp:meta_value').try(:text)
      end

      def ceo
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_ceo']").at_xpath('wp:meta_value').try(:text)
      end

      def coo
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_coo']").at_xpath('wp:meta_value').try(:text)
      end

      def cto
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_cto']").at_xpath('wp:meta_value').try(:text)
      end

      def cfo
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_cfo']").at_xpath('wp:meta_value').try(:text)
      end

      def annual_revenues
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_annual_revenues']").at_xpath('wp:meta_value').try(:text)
      end

      def market_segment
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_portal_market_segment']").at_xpath('wp:meta_value').try(:text)
      end

      def business_model
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_portal_business_model']").at_xpath('wp:meta_value').try(:text)
      end

      def market_coverage
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_portal_market_coverage']").at_xpath('wp:meta_value').try(:text)
      end

      def average_monthly_traffic
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_average_monthly_traffic']").at_xpath('wp:meta_value').try(:text)
      end

      def data_source
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_data_source']").at_xpath('wp:meta_value').try(:text)
      end

      def technology_platform
        node.xpath("wp:postmeta[wp:meta_key = 'company_details_0_technology_platform']").at_xpath('wp:meta_value').try(:text)
      end

      private

      def unserialize(xml_field_name, key)
        return unless node.xpath("wp:postmeta[wp:meta_key = '#{xml_field_name}']").at_xpath('wp:meta_value')
        serialized_php = node.xpath("wp:postmeta[wp:meta_key = '#{xml_field_name}']").at_xpath('wp:meta_value').text
        begin
          unserialized_php = PHP.unserialize(serialized_php)
          !!unserialized_php[key] && !unserialized_php[key].empty? ? unserialized_php[key] : ''
        rescue
          ''
        end
      end

      private

      def unserialize(xml_field_name, key)
        serialized_php = node.xpath("//wp:postmeta[wp:meta_key = '#{xml_field_name}']").at_xpath('wp:meta_value').text
        unserialized_php = PHP.unserialize(serialized_php)
        !!unserialized_php[key] && !unserialized_php[key].empty? ? unserialized_php[key] : ''
      end
    end
  end
end
