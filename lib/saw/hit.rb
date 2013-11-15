class Hit < ActiveRecord::Base
  serialize :json_data, JSON  
  attr_accessible :url, :http_method, :action, :params
  belongs_to :visit

  def last_hit
    visit.hits.where(' hits.id < ? ', id).last
  end

  def next_hit
    visit.hits.where(' hits.id > ? ', id).first
  end

  def after
    Saw::Util.time_diff visit.starts_with.created_at, created_at
  end

  def user_visits
    visit.user.visits
  end
end
