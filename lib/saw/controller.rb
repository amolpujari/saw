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

      if json_data and json_data.is_a? ActiveRecord::Base
        associated_object = json_data
        json_data = nil
      end

      associated_object ||= controller_name.classify.constantize.find params[:id] rescue nil

      associated_id, associated_type = nil
      if associated_object and associated_object.is_a? ActiveRecord::Base
        associated_id   = associated_object.id
        associated_type = associated_object.class.name
      end

      if user_id
        visit   = Visit.where('user_id = ? and session_id = ? ', user_id, session_id).first
        visit ||= Visit.new

        visit.user_id     = user_id
        visit.session_id  = session_id
        visit.remote_host = remote_host
        visit.user_agent  = user_agent
        visit.user_id     = user_id

        visit.save

        visit_id = visit.id
      end

      hit = Hit.new
      hit.visit_id        = visit_id
      hit.url             = url
      hit.http_method     = http_method,
      hit.action          = action
      hit.params          = params
      hit.note            = doing
      hit.json_data       = json_data
      hit.associated_type = associated_type
      hit.associated_id   = associated_id
      hit.save
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

