class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role? :instructor
      can :index, Instructor
      # instructor can read own profile
      can :show, User do |u|  
        u.id == user.id
      end
      can :update, User do |u|  
        u.id == user.id
      end
      can :edit, User do |u|
        u.id == user.id
      end
      can :show, Instructor do |i|  
        i.id == user.instructor.id
      end
      # instructor can update  own profile
      can :update, Instructor do |i|  
        i.id == user.instructor.id
      end
    else        
      #regular users can read all for now...
      can :read, :all
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
