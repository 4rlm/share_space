module AddressesHelper

  def self.format_address(address)
    full_address = "#{address.street}, #{address.city}, #{address.state}, #{address.zip}"
  end

  def self.return_if_latitude_longitude(addresses)
    verified_addresses = []
    addresses.map do |address|
      verified_addresses << address if address.present? && address.latitude.present? && address.longitude.present?
    end
    verified_addresses
  end

end
