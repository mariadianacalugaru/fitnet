class ExercisesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  def new
      if Tmdb.get_exercises
          redirect_to schedules_path, notice: "Exercises successfully updated." 
      else
          render :new, status: :unprocessable_entity
      end
  end 

  def create
      
  end
end
