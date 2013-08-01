class TrackLink < ActiveRecord::Base
  default_scope order('id')
  serialize :json_data, JSON  
  attr_accessible :url, :method, :action, :params, :server_name
  belongs_to :track_visit

  def last_track_link
    track_visit.track_links.where(' track_links.id < ? ', id).last
  end

  def next_track_link
    track_visit.track_links.where(' track_links.id > ? ', id).first
  end

  def after
    Saw::Util.time_diff track_visit.starts_with.created_at, created_at
  end

  def user_track_visits
    track_visit.user.track_visits
  end
end
