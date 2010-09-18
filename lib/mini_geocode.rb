# MiniGeocode
require 'open-uri'

class MiniGeocode

  # address = street, city, country
  def self.address_to_gps(address)
    address = format_address(address)
    source = address_url(address)
    result = geo_result(source)
    result = result_to_hash(result)
    
    
    if result['GeocodeResponse']['status'] == 'OK'
      return result['GeocodeResponse']['result']['geometry']['location']
    else
      return nil
    end
  end

  def self.gps_to_address(lat,lng)
    source = latlng_url(lat,lng)
    result = geo_result(source)
    result = result_to_hash(result)
    
    if result['GeocodeResponse']['status'] == 'OK'
      return result['GeocodeResponse']['result'][0]['formatted_address']
    else
      return nil
    end
  end
  
  private
  
  def self.format_address(address)
    address.tr(' ','+')
  end
  
  def self.address_url(address)
    "http://maps.google.com/maps/api/geocode/xml?address=#{address}&sensor=false"
  end
  
  def self.latlng_url(lat,lng)
    "http://maps.google.com/maps/api/geocode/xml?latlng=#{lat},#{lng}&sensor=false"
  end
  
  # read the result from google
  def self.geo_result(url)
    result = ""
    open(url) do |s|
      result = s.read 
    end
    result
  end
  
  def self.result_to_hash(result)
    Hash.from_xml(result)
  end
end