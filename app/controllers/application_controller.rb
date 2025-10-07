require 'pry'

class ApplicationController < ActionController::Base
  include ApplicationHelper
  include UserHelper

  before_action :authorization
  helper_method :current_user

  private

  def current_user
    return @current_user if @current_user.present?
    token = session[:session_token]
    if token
      session_record = Session.find_by(session_token: token)
      if session_record && session_record.expires_at > Time.now
        @current_user = session_record.user
      end
    end
  end

  def authorization
    redirect_to login_path unless current_user
  end
end
