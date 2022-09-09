class ScheduleExercisesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    
    
    def show #mostra una scheda
        @schedule = ScheduleExercise.where(schedule_id:params[:id])
    end
  
    def new
        @schedule = ScheduleExercise.new
    end

    def index 
    end
  
    def create
    end
end
