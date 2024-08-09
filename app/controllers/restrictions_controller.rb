class RestrictionsController < ApplicationController
  def index
    matching_restrictions = Restriction.all

    @list_of_restrictions = matching_restrictions.order({ :created_at => :desc })

    render({ :template => "restrictions/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_restrictions = Restriction.where({ :id => the_id })

    @the_restriction = matching_restrictions.at(0)

    render({ :template => "restrictions/show" })
  end

  def create
    the_restriction = Restriction.new
    the_restriction.friend_id = params.fetch("query_friend_id")
    the_restriction.diet_id = params.fetch("query_diet_id")

    if the_restriction.valid?
      the_restriction.save
      redirect_to("/restrictions", { :notice => "Restriction created successfully." })
    else
      redirect_to("/restrictions", { :alert => the_restriction.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_restriction = Restriction.where({ :id => the_id }).at(0)

    the_restriction.friend_id = params.fetch("query_friend_id")
    the_restriction.diet_id = params.fetch("query_diet_id")

    if the_restriction.valid?
      the_restriction.save
      redirect_to("/restrictions/#{the_restriction.id}", { :notice => "Restriction updated successfully."} )
    else
      redirect_to("/restrictions/#{the_restriction.id}", { :alert => the_restriction.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_restriction = Restriction.where({ :id => the_id }).at(0)

    the_restriction.destroy

    redirect_to("/restrictions", { :notice => "Restriction deleted successfully."} )
  end
end
