class UsersController < ApplicationController
  before_filter :check_auth
  def show
    @user = User.find_by(nickname: params[:nickname])
  end

  private
  # Check authorization for users
  def check_auth
    unless user_signed_in?
      redirect_to '/welcome'
    end
  end

end
