require 'helper'

class TestMiniGeocode < Test::Unit::TestCase
  should "valid address to gps" do
    address = "1600 Amphitheatre Parkway, Mountain View, CA"
    assert_equal MiniGeocode.address_to_gps(address), {"lng"=>"-122.0829964", "lat"=>"37.4217080"}
  end
  
  should "invalid address to gps" do
    address = "test address"
    assert_nil MiniGeocode.address_to_gps(address) 
  end
  
  should "valid gps to address" do
    assert_equal MiniGeocode.gps_to_address(37.4219551,-122.0844984), "1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA"
  end
  
  should "invalid gps to address" do
    assert_nil MiniGeocode.gps_to_address(237.4219551,-122.0844984)
  end
end

