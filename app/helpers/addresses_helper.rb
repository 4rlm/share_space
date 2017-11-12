module AddressesHelper

  def self.format_address(address)
    full_address = "#{address.street}, #{address.city}, #{address.state}, #{address.zip}"
  end

end
