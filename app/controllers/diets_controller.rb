class DietsController < ApplicationController
  def index

    if !current_user.admin
      redirect_to("/")
    else

      matching_diets = Diet.all

      @list_of_diets = matching_diets.order({ :created_at => :desc })

      @pending_diets = NewDietRequest.all.order({ :created_at => :desc })

      render({ :template => "diets/index" })
    end
  end

  def show
    the_id = params.fetch("path_id")

    matching_diets = Diet.where({ :id => the_id })

    @the_diet = matching_diets.at(0)

    render({ :template => "diets/show" })
  end

  def create
    the_diet = Diet.new
    the_diet.name = params.fetch("query_name")

    if the_diet.valid?
      the_diet.save
      redirect_to("/diets", { :notice => "Diet created successfully." })
    else
      redirect_to("/diets", { :alert => the_diet.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_diet = Diet.where({ :id => the_id }).at(0)

    the_diet.name = params.fetch("query_name")

    if the_diet.valid?
      the_diet.save
      redirect_to("/diets/#{the_diet.id}", { :notice => "Diet updated successfully."} )
    else
      redirect_to("/diets/#{the_diet.id}", { :alert => the_diet.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_diet = Diet.where({ :id => the_id }).at(0)

    the_diet.destroy

    redirect_to("/diets", { :notice => "Diet deleted successfully."} )
  end
end
