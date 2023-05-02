# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    
    return unless user.present?

    if user.is? :admin
      can :manage, :all
    else
      can :create, Reserved
      can :manage, Mission 
      can :read, Rocket
    end
  end
end
