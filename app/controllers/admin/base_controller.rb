class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def not_authenticated
    redirect_to admin_login_path, warning: 'ログインしてください'
  end

  def check_admin
    redirect_to main_index_path, warning: '権限がありません' unless current_user && current_user.role == 'admin'
  end
end
