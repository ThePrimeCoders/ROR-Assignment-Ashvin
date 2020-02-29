class Admins::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  before_action :current_admin

  def current_admin
    if current_user.admin?
      @admin = current_user
    end
  end
end
