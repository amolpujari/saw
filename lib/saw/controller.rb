module Saw
  module Controller
    def saw doing=nil, json_data=nil
      return unless current_user

      return if request.fullpath.include? "/admin/"

      user_id     = current_user.id
      session_id  = request.session_options[:id]
      remote_host = request.remote_ip
      remote_host = request.env["HTTP_X_FORWARDED_FOR"] if remote_host.blank?
      user_agent  = request.env["HTTP_USER_AGENT"]
      url         = request.fullpath
      http_method = request.method
      server_name = request.server_name
      action      = "#{controller_name}##{action_name}"
      doing       = doing.to_s.strip
      doing       = action if doing.blank?

      visit = Visit.where('user_id = ? and session_id = ? ', user_id, session_id).first

      visit ||= Visit.create   :user_id      => user_id,
                               :session_id   => session_id,
                               :remote_host  => remote_host,
                               :user_agent   => user_agent, 
                               :source       => ( defined?(visit_source) ? visit_source : "")

      link = visit.links.build :url          => url,
                               :http_method  => http_method, 
                               :action       => action, 
                               :params       => params,
                               :server_name  => server_name

      link.note = doing
      link.json_data = json_data
      link.save!

    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Saw::Controller
  end
end