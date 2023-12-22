class ApplicationController < ActionController::Base
  def setup_current_user
    @current_user = current_user
  end

  def current_user
    User.first
  end

end
