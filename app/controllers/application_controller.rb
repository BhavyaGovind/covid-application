class ApplicationController < ActionController::Base
  before_action :fetch_user
  skip_before_action :verify_authenticity_token


  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to root_path unless @current_user.present?
  end




end