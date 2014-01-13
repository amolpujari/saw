class Hit < ActiveRecord::Base
  serialize :json_data, JSON  
  attr_accessible :url, :http_method, :action, :params, :visit_id, :note, :json_data, :associated_type, :associated_id
  belongs_to :visit
  delegate :user, :to => :visit

  def last_hit
    visit.hits.where(' hits.id < ? ', id).last
  end

  def next_hit
    visit.hits.where(' hits.id > ? ', id).first
  end

  def after
    Saw::Util.time_diff visit.starts_with.created_at, created_at
  end

  def self.associated_types 
    @@associated_types ||= select("distinct associated_type").order(" associated_type ").map(&:associated_type).compact
  end

  belongs_to :associated, polymorphic: true
end