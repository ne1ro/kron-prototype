class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user, except: [:index, :show]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def index
    @user = User.find(params[:user_id])
    @events = @user.events.all
    @title = 'Events'

    respond_to do |format|
      format.html
      format.json {render :json => @events}
    end

  end

  def show
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
    @title = @event.header

    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
    
  end

  def create
    @user = User.find(params[:user_id])
    @event = @user.events.create(event_params)
    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
  end

  def update
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
    @event.update_attributes(event_params)
    respond_to do |format|
      format.json {head :no_content}
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html
      format.json{head :no_content }
    end   
  end

private
  # Check authorization for users
  def check_auth
    unless user_signed_in?
      redirect_to '/welcome'
    end
  end

  # Check permissions for current user
  def check_user
    @user = User.find(params[:user_id])
    redirect_to root_path unless current_user == @user
  end
  
  # Strong parameters
  def event_params
    params.require(:event).permit(:time, :header, :description)
  end
end
