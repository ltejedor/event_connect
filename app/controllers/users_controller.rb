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


  def show
    @user = User.find(params[:id])
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
