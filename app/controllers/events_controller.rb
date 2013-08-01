class EventsController < ApplicationController
  before_filter :find_user
  before_filter :find_event, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy]


  def new
    @event = @user.events.build
  end

  def create
    @event = @user.events.build(params[:event])
    if @event.save
      flash[:notice] = "Event has been created."
      redirect_to root_path
    else
      flash[:alert] = "Event has not been created."
      render :action => "new"
    end
  end

  def show

  end

  def edit

  end

  def update

    if @event.update_attributes(params[:event])
      flash[:notice] = "Event has been updated."
      redirect_to [@user, @event]
    else
      flash[:alert] = "Event has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "Event has been deleted."
    redirect_to root_path
  end




  private
    def find_event
      @event = @user.events.find(params[:id])
    end

    def find_user
      @user = User.find(params[:user_id])
    end

end
