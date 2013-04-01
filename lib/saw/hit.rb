module Saw
  class Hit < ActiveRecord::Base
    default_scope order('id')
    belongs_to :visit
  end
end