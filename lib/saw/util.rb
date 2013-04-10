module Saw
  module Util
    def self.time_diff dt1, dt2
      diff = nil
      #diff   = 1 unless dt1 or dt1.kind_of? DateTime
      #diff ||= 1 unless dt2 or dt2.kind_of? DateTime
      diff ||= dt2 - dt1

      return '00:00:00' if diff==1

      str = ''

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