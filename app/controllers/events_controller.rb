class EventsController < ApplicationController
  def index
    @events = Event.all
    @title = 'Events'

    respond_to do |format|
      format.html
      format.json {render :json => @events}
    end

  end

  def show
    @event = Event.find(params[:id])
    @title = @event.header

    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
    
  end

  def create
    @event = Event.create(params[:event])
    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
  end

  def update
    @event = Event.update(params[:id], params[:event])
    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html
      format.json{head :no_content }
    end   
  end 
end
