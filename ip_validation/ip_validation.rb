require 'ipaddr'

def ip_validation(str)
  begin
    IPAddr.new(str).ipv4?
  rescue IPAddr::InvalidAddressError
    false
  end
end