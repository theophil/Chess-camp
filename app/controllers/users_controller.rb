class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
  	@user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "#{@user.username} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "#{@user.username} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "#{@user.username} was removed from the system."
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:usename, :password, :password_confirmation, :instructor_id, :role, :active)
    end
end


end
