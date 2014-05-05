class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  authorize_resource
  before_action :check_login

  def new
  	@user = User.new
  end

  def edit
    #lab13
    current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #added via lab13
      redirect_to @user, notice: "#{@user.instructor.proper_name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    current_user
    if @user.update(user_params)
      redirect_to @user, notice: "#{@user.instructor.proper_name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  #not in lab13
  def destroy
    @user.destroy
    redirect_to users_url, notice: "#{@user.instructor.proper_name} was removed from the system."
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      if current_user && current_user.role?(:admin)
        params.require(:user).permit(:username, :instructor_id, :password, :password_confirmation, :role, :active)  
      else
        params.require(:user).permit(:username, :instructor_id, :password, :password_confirmation, :active)
      end
    end
end


end
