class NewDietRequestsController < ApplicationController
  def index
    matching_new_diet_requests = NewDietRequest.where({ :user_id => current_user.id })

    @list_of_new_diet_requests = matching_new_diet_requests.order({ :created_at => :desc })

    render({ :template => "new_diet_requests/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_new_diet_requests = NewDietRequest.where({ :id => the_id })

    @the_new_diet_request = matching_new_diet_requests.at(0)

    render({ :template => "new_diet_requests/show" })
  end

  def create
    the_new_diet_request = NewDietRequest.new
    the_new_diet_request.name = params.fetch("query_name")
    the_new_diet_request.user_id = current_user.id

    if the_new_diet_request.valid?
      the_new_diet_request.save
      redirect_to("/new_diet_requests", { :notice => "New diet request created successfully." })
    else
      redirect_to("/new_diet_requests", { :alert => the_new_diet_request.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_new_diet_request = NewDietRequest.where({ :id => the_id }).at(0)

    the_new_diet_request.name = params.fetch("query_name")

    if the_new_diet_request.valid?
      the_new_diet_request.save
      redirect_to("/new_diet_requests/#{the_new_diet_request.id}", { :notice => "New diet request updated successfully."} )
    else
      redirect_to("/new_diet_requests/#{the_new_diet_request.id}", { :alert => the_new_diet_request.errors.full_messages.to_sentence })
    end
  end

  def destroy_admin
    the_id = params.fetch("path_id")
    the_new_diet_request = NewDietRequest.where({ :id => the_id }).at(0)

    the_new_diet_request.destroy

    redirect_to("/diets", { :notice => "New diet request deleted successfully."} )
  end

  def destroy
    the_id = params.fetch("path_id")
    the_new_diet_request = NewDietRequest.where({ :id => the_id }).at(0)

    the_new_diet_request.destroy

    redirect_to("/new_diet_requests", { :notice => "New diet request deleted successfully."} )
  end
end
