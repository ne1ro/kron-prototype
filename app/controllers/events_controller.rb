class EventsController < ApplicationController
  before_filter :check_auth
  skip_before_filter  :verify_authenticity_token

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
    @event = @user.events.create(params[:event])
    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
  end

  def update
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
    @event.update_attributes(params[:event])
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

end
