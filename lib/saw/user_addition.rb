class User < ActiveRecord::Base
  has_many :track_visits
  has_many :track_links, :through => :track_visits
end