class HomeController < ApplicationController
  def index
    if current_user==nil
      redirect_to("/users/sign_in")
    else
      matching_friends = Friend.where({ :user_id => current_user.id })
      @this_months_birthdays = matching_friends.where("EXTRACT(MONTH FROM birthday) = ?", Date.today.month).order({ :birthday => :asc })
      
      render({ :template => "home" })
    end
  end
end
