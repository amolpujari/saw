class Link < ActiveRecord::Base
  default_scope order('id')
  serialize :json_data, JSON  
  attr_accessible :url, :http_method, :action, :params, :server_name
  belongs_to :visit

  def last_link
    visit.links.where(' links.id < ? ', id).last
  end

  def next_link
    visit.links.where(' links.id > ? ', id).first
  end

  def after
    Saw::Util.time_diff visit.starts_with.created_at, created_at
  end

  def user_visits
    visit.user.visits
  end
end
