class UsersController < ApplicationController
  before_filter :find_user, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to @user
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User has been updated."
      redirect_to @user
    else
      flash[:alert] = "User has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User has been deleted."
    redirect_to users_path
  end


  private
    def find_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The user you were looking" +
                      "for could not be found."
      redirect_to users_path
    end

end
