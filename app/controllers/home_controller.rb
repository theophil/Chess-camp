class HomeController < ApplicationController
  def index
  	 @upcoming_camps_for_guest = Camp.upcoming.active.chronological.paginate(:page => params[:page]).per_page(10)
  	 @instructor_upcoming_camps = current_user.instructor.camps.upcoming.to_a if logged_in? && current_user.role == 'instructor' #current user WILL be instructor in this case
     # @instructor_students = current_user.instructor.students.to_a if current_user.role == 'instructor'
     @upcoming_camps_for_admin = Camp.active.upcoming.chronological.paginate(:page => params[:page]).per_page(10)
     @instructors = Instructor.active.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end
