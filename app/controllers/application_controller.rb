class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authorize_admin!
    redirect_to root_path, alert: "Not authorized" unless current_user.role == 'admin'
  end

end
