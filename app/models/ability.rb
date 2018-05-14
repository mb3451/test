class Ability
  include CanCan::Ability

  def initialize(user)
     # alias_action :create, :read, :update, :destroy, to: :crud
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    
        if user.present?  # additional permissions for logged in users (they can manage their posts)
          can :update, Project, manager_id: user.id 
          can :destroy, Project, manager_id: user.id
          can :create, Feature
          can :update, Feature, developer_id: user.id 
          can :update, Feature, creator_id: user.id 
          can :destroy, Feature, creator_id: user.id 
          can :read, :all 
          if user.user_type == "Manager"  # additional permissions for administrators
            can :read, :all
            can :create, Project
          end
        end
  
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
