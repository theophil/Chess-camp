class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:edit, :update, :destroy]
  authorize_resource
  before_action :check_login

  def new
    @registration = Registration.new
    @registration.camp_id = params[:camp_id] unless params[:camp_id].nil?
  end

  def edit
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to @registration, notice: "The registration for student #{@registration.student.first_name @registration.student.last_name} for camp #{@registration.camp.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @registration.update(registration_params)
      redirect_to @registration, notice: "The registration for student #{@registration.student.first_name @registration.student.last_name} for camp #{@registration.camp.name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @registration.destroy
    redirect_to registrations_url, notice: "The registration for student #{@registration.student.first_name @registration.student.last_name} for camp #{@registration.camp.name} was removed from the system."
  end

  private
    def set_registration
      @registration = Registration.find(params[:id])
    end

    def registration_params
      params.require(:registration).permit(:camp_id, :student_id, :payment_status, :points_earned)
    end

end
