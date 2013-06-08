class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user, except: [:index, :show]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def index
    @title = 'Notifications'
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:event_id])
    @notifications = @event.notifications.all

    respond_to do |format|
      format.html
      format.json {render :json => @notifications}
    end 

  end

  def show
    @user = User.find(params[:user_id])
    @event = @user.find(params[:event_id])
    @notification = @event.notifications.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render :json => @notification}
    end
  end

  def create
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:event_id])
    @notification = @event.notifications.create(notification_params)

    respond_to do |format|
      format.html
      format.json {render :json => @notification}
    end

  end

  def update
    @user = User.find(params[:user_id])
    @event = @user.find(params[:event_id])
    @notification = @event.notifications.find(params[:id])
    @notification.update_attributes(notification_params)

    respond_to do |format|
      format.html
      format.json {head :no_content}
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:event_id])
    @notification = @event.notifications.find(params[:id])
    @notification.destroy
    
    respond_to do |format|
      format.html
      format.json {head :no_content}
    end
  end

  private
    # Check permissions for current user
    def check_user
      @user = User.find(params[:user_id])
      redirect_to root_path unless current_user == @user
    end

  # Strong parameters
  def notification_params
    params.require(:notification).permit(:text, :time, :marked)
  end

end
