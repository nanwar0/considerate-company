class FriendsController < ApplicationController
  def index
    if current_user==nil
      redirect_to("/users/sign_in")
    else
      if current_user.id==1
        current_user.admin = true
        current_user.save
      end

      matching_friends = Friend.where({ :user_id => current_user.id })

      @list_of_friends = matching_friends.order({ :created_at => :desc })
  
      render({ :template => "friends/index" })
    end
    

  end

  def show
    the_id = params.fetch("path_id")

    matching_friends = Friend.where({ :id => the_id })

    @the_friend = matching_friends.at(0)
    
    @restriction_diet_ids = Array.new
    @the_friend.diets.each do |diet|
      @restriction_diet_ids.push(diet.id)
    end

    render({ :template => "friends/show" })
  end

  def create
    the_friend = Friend.new
    the_friend.name = params.fetch("query_name")
    the_friend.address = params.fetch("query_address")
    the_friend.birthday = params.fetch("query_birthday")
    the_friend.user_id = current_user.id
    the_friend.notes = params.fetch("query_notes")

    if the_friend.valid?
      the_friend.save
      redirect_to("/friends", { :notice => "Friend created successfully." })
    else
      redirect_to("/friends", { :alert => the_friend.errors.full_messages.to_sentence })
    end


    if params["query_restrictions"].present?
      input_restrictions = params.fetch("query_restrictions")

      input_restrictions.each do |restriction|
        the_restriction = Restriction.new
        the_restriction.friend_id = the_friend.id
        the_restriction.diet_id = restriction

        if the_restriction.valid?
          the_restriction.save
        end
      end
    end

  end

  

  def update
    the_id = params.fetch("path_id")
    the_friend = Friend.where({ :id => the_id }).at(0)

    the_friend.name = params.fetch("query_name")
    the_friend.address = params.fetch("query_address")
    the_friend.birthday = params.fetch("query_birthday")
    the_friend.user_id = current_user.id
    the_friend.notes = params.fetch("query_notes")

    if the_friend.valid?
      the_friend.save
    end

    the_friend.restrictions.each do |restriction|
      the_restriction = Restriction.where({ :id => restriction.id }).at(0)
      the_restriction.destroy
    end

    input_restrictions = params.fetch("query_restrictions")

    input_restrictions.each do |restriction|
      the_restriction = Restriction.new
      the_restriction.friend_id = the_friend.id
      the_restriction.diet_id = restriction.to_i

      if the_restriction.valid?
        the_restriction.save
      end
    end
    redirect_to("/friends/#{the_friend.id}", { :notice => "Friend updated successfully."} )
  end

  def destroy
    the_id = params.fetch("path_id")
    the_friend = Friend.where({ :id => the_id }).at(0)

    the_friend.destroy

    redirect_to("/friends", { :notice => "Friend deleted successfully."} )
  end
end
