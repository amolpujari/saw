Rails.application.routes.draw do |map|
  post "visits" => "visits#create", :defaults => { :format => 'json'}
end