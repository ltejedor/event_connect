class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Event has been created."
      redirect_to @event
    else
      flash[:alert] = "Event has not been created."
      render :action => "new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:project])
      flash[:notice] = "Event has been updated."
      redirect_to @event
    else
      flash[:alert] = "Project has not been updated."
      render :action => "edit"
    end
  end

end
