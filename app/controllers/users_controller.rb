class UsersController < ApplicationController
  before_filter :check_auth
  
  def show
    @user = User.find(params[:id])
    if @user.fullname.blank?
      @title = @user.nickname
    else
      @title = @user.fullname
    end
  end
  
  private
  # Check authorization for users
  def check_auth
    unless user_signed_in?
      redirect_to '/welcome'
    end
  end

end
