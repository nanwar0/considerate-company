class GroupsController < ApplicationController
  def index
    matching_groups = Group.all

    @list_of_groups = matching_groups.order({ :created_at => :desc })

    render({ :template => "groups/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_groups = Group.where({ :id => the_id })

    @the_group = matching_groups.at(0)

    render({ :template => "groups/show" })
  end

  def create
    the_group = Group.new
    the_group.friend_id = params.fetch("query_friend_id")
    the_group.user_id = params.fetch("query_user_id")

    if the_group.valid?
      the_group.save
      redirect_to("/groups", { :notice => "Group created successfully." })
    else
      redirect_to("/groups", { :alert => the_group.errors.full_messages.to_sentence })
    end
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
