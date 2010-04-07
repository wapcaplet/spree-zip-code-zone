# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ZipCodeZoneExtension < Spree::Extension
  version "1.0"
  description "Zones for U.S. ZIP Codes"
  url "http://github.com/wapcaplet/spree-zip-code-zone"

  def activate

    # Override Zone methods to support ZipCode zone members
    Zone.class_eval do

      def kind
        member = self.members.last
        case member && member.zoneable_type
        when "State"        then "state"
        when "Zone"         then "zone"
        when "ZipCodeRange" then "zip_code_range"
        else
          "country"
        end
      end

      def include?(address)
        return false unless address

        members.any? do |zone_member|
          case zone_member.zoneable_type
          when "Zone"
            zone_member.zoneable.include?(address)
          when "Country"
            zone_member.zoneable == address.country
          when "State"
            zone_member.zoneable == address.state
          when "ZipCodeRange"
            address.zipcode.between?(
              zone_member.zoneable.start_zip,
              zone_member.zoneable.end_zip)
          else
            false
          end
        end
      end

    end # Zone

    Admin::ZonesController.class_eval do

      def load_data
        @countries = Country.all.sort
        @states = State.all.sort
        @zip_code_ranges = ZipCodeRange.all.sort
        @zones = Zone.all.sort
      end

    end # Admin::ZonesController

  end
end
