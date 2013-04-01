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
      action      = "#{controller_name}##{action_name}"
      doing       = doing.to_s.strip
      doing       = action if doing.blank?

      visit = Visit.where('user_id = ? and session_id = ? ', user_id, session_id).first

      visit ||= Visit.create  :user_id      => user_id,
                              :session_id   => session_id,
                              :remote_host  => remote_host

      hit = visit.hits.create :url          => url,
                              :http_method  => http_method, 
                              :action       => action, 
                              :params       => params,
                              :note         => doing,
                              :json_data    => json_data

    end
  end

  class VisitsController < ApplicationController
    def create
      saw params[:doing]
      head :ok
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Saw::Controller
  end
end