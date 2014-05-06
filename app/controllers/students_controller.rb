class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  authorize_resource
  before_action :check_login
  
  def index
  	@active_students = Student.active.alphabetical.paginate(:page => params[:page]).per_page(10)
  	@inactive_students = Student.inactive.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def show
  	#Do I really need this?
  	@family = @student.family
    @camps = @student.camps.alphabetical.paginate(:page => params[:page]).per_page(10)
  	#subtract these 2 to get dropdown for registration
  	# @eligible_camps = Camp.upcoming.active.for_rating(@student.rating)
  	# @already_registered_camps = Student.camps.upcoming.active.for_rating(@student.rating)

  end

  def new
  	@student = Student.new
  end

  def edit
  end

  def create
  	adjust_ratings
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "The student #{@student.first_name} #{@student.last_name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
  	adjust_ratings
    if @student.update(student_params)
      redirect_to @student, notice: "The student #{@student.first_name} #{@student.last_name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: "The student #{@student.first_name} #{@student.last_name} was removed from the system."
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name, :family_id, :date_of_birth, :rating, :active)
    end

    def adjust_ratings
      params[:student][:rating] = 0 if params[:student][:rating].nil? 
    end

end
