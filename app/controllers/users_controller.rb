class UsersController < ApplicationController
  before_filter :check_auth
  
  def show
    @user = User.find_by(nickname: params[:nickname])
    if @user.fullname.blank?
      @title = @user.nickname
    else
      @title = @user.fullname
    end
    
    respond_to do |format|
      format.html
      format.json {render :json => @user}
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
