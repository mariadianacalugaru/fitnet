# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #unlogged users
    can :read, Review
    can :read, User

    
    #users
    return unless user.present? 
      can [:read, :create], Review
      can :manage, User, user: user
      can [:read, :create, :destroy], Request, user_id: user.id
      can [:read], Message
      can [:read, :destroy], Schedule
      can :read, ScheduleExercise
      can :read, Exercise
      cannot :destroy, User
     

    #personal trainers
    return unless user.pt?
      can :read, Request, pt_id: user.id
      can [:read, :create], Schedule
      can [:read], Message
      can [:read, :destroy], Request
      can :read, ScheduleExercise
      can :read, Exercise
      cannot :create, Request
      cannot :create, Review
      cannot :destroy, User

     #admins
     return unless user.admin? 
     can [:read, :destroy], User
     can :read, ScheduleExercise
     can :read, Review
     can [:read, :create], Exercise
     can [:read, :destroy], Request
     can [:read, :destroy], Schedule
     can [:read, :create, :destroy], Message
     cannot :create, Review
     cannot :create, Request
     cannot :create, Schedule

   
   
   # user ||= User.new # guest user (not logged in)

    #if user.admin?
      #can [:read, :destroy], User
      #can :read, Review
      #can [:read, :destroy], Request
    #else
      #can :manage, User, user_id: user.id
      #can [:read, :create, :destroy], Request, user_id: user.id
      #can [:read, :create], Review
      #cannot :destroy, User
    #end


    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
