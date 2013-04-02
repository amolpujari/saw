class User < ActiveRecord::Base
  has_many :visits
  has_many :hits, :through => :visits
end