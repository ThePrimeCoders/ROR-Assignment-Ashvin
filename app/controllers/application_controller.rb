class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  
  protect_from_forgery with: :exception

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, flash: { alert: I18n.t('message.admin.redirect_permission') }
    end
  end

  def after_sign_in_path_for(resource)
  	admins_auctions_path
  end
  def after_sign_out_path_for(resource)
  	root_path
  end
end
