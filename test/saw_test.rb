$:.unshift(File.dirname(__FILE__))

require 'helpers/unit_test_helper'
require 'models/user'
require 'models/visit'
require 'models/hit'

# ActionController::Routing::Routes.draw do |map|
#   post "visits" => "visits#create"#, :defaults => { :format => "json"}
# end

class SawTests < Test::Unit::TestCase  # :nodoc:
  fixtures :users, :visits, :hits

  def setup
  end

end