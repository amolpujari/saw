class User < ActiveRecord::Base
  has_many :visits
  has_many :links, :through => :visits
end