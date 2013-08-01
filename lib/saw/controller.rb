module Saw
  module Controller
    def saw doing=nil, json_data=nil
      return unless current_user

      return if request.fullpath.include? "/admin/"

      user_id     = current_user.id
      session_id  = request.session_options[:id]
      remote_ip   = request.remote_ip
      remote_ip   = request.env["HTTP_X_FORWARDED_FOR"] if remote_host.blank?
      user_agent  = request.env["HTTP_USER_AGENT"]
      url         = request.fullpath
      method      = request.method
      server_name = request.server_name
      action      = "#{controller_name}##{action_name}"
      doing       = doing.to_s.strip
      doing       = action if doing.blank?

      track_visit = TrackVisit.where('user_id = ? and session_id = ? ', user_id, session_id).first

      track_visit ||= TrackVisit.create  :user_id      => user_id,
                                         :session_id   => session_id,
                                         :remote_ip    => remote_ip,
                                         :user_agent   => user_agent, 
                                         :visit_source => ( defined?(track_visit_source) ? track_visit_source : "")

      track_link = track_visit.track_links.build :url          => url,
                                                 :method       => method, 
                                                 :action       => action, 
                                                 :params       => params,
                                                 :server_name  => server_name

      track_link.note = doing
      track_link.json_data = json_data
      track_link.save!

    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Saw::Controller
  end
end