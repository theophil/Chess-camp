class HomeController < ApplicationController
  def index
  	 @upcoming_camps_for_guest = Camp.upcoming.active.chronological.paginate(:page => params[:page]).per_page(10)
  	 @instructor_upcoming_camps = current_user.instructor.camps.upcoming.to_a if current_user.role == 'instructor' #current user WILL be instructor in this case
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end
