module Saw
  module Controller
    def saw doing=nil, json_data=nil, associated_object=nil
      user_id     = current_user ? current_user.id : nil
      session_id  = request.session_options[:id]
      remote_host = request.remote_ip
      remote_host = request.env["HTTP_X_FORWARDED_FOR"] if remote_host.blank?
      user_agent  = request.env["HTTP_USER_AGENT"]
      url         = request.fullpath
      http_method = request.method
      action      = "#{controller_name}##{action_name}"
      doing       = doing.to_s.strip
      doing       = action if doing.blank?
      visit_id    = nil

      associated_id, associated_type = nil
      if associated_object and associated_object.is_a? ActiveRecord::Base
        associated_id   = associated_object.id
        associated_type = associated_object.class.name
      end

      if user_id
        visit = Visit.where('user_id = ? and session_id = ? ', user_id, session_id).first 

        visit ||= Visit.create  :user_id      => user_id,
                                :session_id   => session_id,
                                :remote_host  => remote_host,
                                :user_agent   => user_agent

        visit_id = visit.id
      end

      hit = Hit.create :visit_id        => visit_id,
                       :url             => url,
                       :http_method     => http_method, 
                       :action          => action, 
                       :params          => params,
                       :note            => doing,
                       :json_data       => json_data,
                       :associated_type => associated_type,
                       :associated_id   => associated_id
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Saw::Controller
  end
end

if defined? ActiveAdmin
  ActiveAdmin::ResourceController.class_eval do
    include Saw::Controller
  end
end

