module ActiveRecord
  class Base
    has_many :hits :as => :associated
  end
end