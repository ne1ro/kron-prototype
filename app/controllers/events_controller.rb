class EventsController < ApplicationController
  before_filter :check_auth

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
    @event = @user.events.find(params[:id])
    @title = @event.header

    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
    
  end

  def create
    @event = @user.events.create(params[:event])
    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
  end

  def update
    @event = @user.events.find(params[:id])
    @event.update_attributes(params[:event])
    respond_to do |format|
      format.json {head :no_content}
    end
  end

  def destroy
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
