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

    # Default value for timer - today
    if @event.timers.empty?
      now = DateTime.now()
      timer = Timer.new
        timer.hour = now.hour
        timer.minute = now.minute
      @event.timers << timer  
    end

    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    respond_to do |format|
      format.json {head :no_content}
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
