require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'active_support'
require 'active_support/test_case'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'mini_geocode'

class Test::Unit::TestCase
end
