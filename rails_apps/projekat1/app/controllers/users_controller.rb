class UsersController < ApplicationController
  
  before_action :finding

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def finding
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name,:username,:email,:age,:job)
    end
end
