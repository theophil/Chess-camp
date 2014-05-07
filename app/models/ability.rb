class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role? :instructor
      can :index, Instructor
      # instructor can show, update, and edit own user profile
      can :show, User do |u|  
        u.id == user.id
      end
      can :update, User do |u|  
        u.id == user.id
      end
      can :edit, User do |u|
        u.id == user.id
      end
      # instructor can show, update, and edit own instructor profile
      can :show, Instructor do |i|  
        i.id == user.instructor.id
      end
      can :update, Instructor do |i|  
        i.id == user.instructor.id
      end
      #view all camps to get to ultimately get to their own
      can :index, Camp
      # instructors can read their own camps' data
      can :show, Camp do |this_camp|  
        my_camps = user.instructor.camps
        my_camps_ids = my_camps.map { |c| c.id  }
        my_camps_ids.include? this_camp.id 
      end
      can :index, Student
      can :show, Student do |this_student|
        my_camps = user.instructor.camps
        my_students = my_camps.map{|camp| camp.students }
        flattened_students = my_students.flatten
        student_ids = flattened_students.map(&:id)
        student_ids.include? this_student.id
      end
    else      
      #regular users can read all for now...
      can :show, Camp
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/bryanrite/cancancan/wiki/Defining-Abilities
  end
end
