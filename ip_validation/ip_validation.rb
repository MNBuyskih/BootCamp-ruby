require 'ipaddr'

def ipv4?(str)
  IPAddr.new(str).ipv4?
rescue IPAddr::InvalidAddressError
  false
end