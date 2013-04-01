module Saw
  class Visit < ActiveRecord::Base
    default_scope order('id')

    has_many :hits
    belongs_to :user

    def title
      "#{lasts} on #{created_at.strftime('%b %-d %Y, %l %P')}"
    end

    def lasts
      str = ''

      last_hit = hits.last
      diff = last_hit ? last_hit.created_at - created_at : 1

      hours_diff = (diff/1.hour).round
      if hours_diff > 0
        str << "#{format('%02d', hours_diff)}"
        diff = diff - hours_diff.hours
      else
        str << "00"
      end

      minutes_diff = (diff/1.minute).round
      if minutes_diff > 0
        str << ":#{format('%02d', minutes_diff)}"
        diff = diff - minutes_diff.minutes
      else
        str << ":00"
      end

      seconds_diff = (diff/1.second).round
      if seconds_diff > 0
        str << ":#{format('%02d', seconds_diff)}"
        #diff = diff - seconds_diff.seconds
      else
        str << ":00"
      end

      str
    end
  end
end