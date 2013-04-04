class Hit < ActiveRecord::Base
  default_scope order('id')
  serialize :json_data, JSON  
  attr_accessible :url, :http_method, :action, :params
  belongs_to :visit
end
