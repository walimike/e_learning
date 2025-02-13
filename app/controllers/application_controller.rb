class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authorize_admin!
    redirect_to root_path, alert: "Not authorized" unless is_admin
  end

end
