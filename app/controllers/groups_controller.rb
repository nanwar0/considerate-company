class GroupsController < ApplicationController
  def index
    if current_user==nil
      redirect_to("/users/sign_in")
    else
      @matching_friends = Friend.where({ :user_id => current_user.id })

      matching_groups = Group.where({ :user_id => current_user.id })

      @list_of_groups = matching_groups.order({ :created_at => :desc })

      @list_of_diets = Array.new

      matching_groups.each do |group|
        group.friend.restrictions.each do |restriction|
          if !@list_of_diets.include?(restriction.diet_id) && restriction.diet_id!=12
            @list_of_diets.push(restriction.diet_id)
          end
        end
      end
      render({ :template => "groups/index" })
    end
    

  end

  def recommend

    client = OpenAI::Client.new(:api_key => ENV.fetch("OPENAI_API_KEY"))

    raw_response = client.completions.create(
    parameters: {
      model: "gpt-3.5-turbo", 
      messages: [
        {:role => "system", :content => "You are a helpful assistant."},
        {:role => "user", :content => "Recommend four restaurants in Chicago."},
      ]
    }
    )

    next_message = raw_response.fetch("choices").at(0).fetch("message").fetch("content")
    pp next_message
  end

  def show
    the_id = params.fetch("path_id")

    matching_groups = Group.where({ :id => the_id })

    @the_group = matching_groups.at(0)

    render({ :template => "groups/show" })
  end

  def create
    existing_group = Group.where({ :user_id => current_user.id })

    existing_group.each do |group|
      group.destroy
    end
    
    list_of_friends = params.fetch("query_friend_id")

    list_of_friends.each do |friend|
      the_group = Group.new
      the_group.friend_id = friend
      the_group.user_id = current_user.id

      if the_group.valid?
        the_group.save
      else
        redirect_to("/groups", { :alert => the_group.errors.full_messages.to_sentence })
      end
    end
    redirect_to("/groups")
  end

  def update
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.friend_id = params.fetch("query_friend_id")
    the_group.user_id = params.fetch("query_user_id")

    if the_group.valid?
      the_group.save
      redirect_to("/groups/#{the_group.id}", { :notice => "Group updated successfully."} )
    else
      redirect_to("/groups/#{the_group.id}", { :alert => the_group.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.destroy

    redirect_to("/groups", { :notice => "Group deleted successfully."} )
  end
end
