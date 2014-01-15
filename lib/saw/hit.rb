class Hit < ActiveRecord::Base
  serialize :json_data, JSON  
  attr_accessible :url, :http_method, :action, :params, :visit_id, :note, :json_data, :associated_type, :associated_id
  belongs_to :visit

  def user
    visit and visit.user
  end

  def last_hit
    visit.hits.where(' hits.id < ? ', id).last
  end

  def next_hit
    visit.hits.where(' hits.id > ? ', id).first
  end

  def after
    Saw::Util.time_diff visit.starts_with.created_at, created_at
  end

  belongs_to :associated, polymorphic: true
end