class ScheduleExercisesController < ApplicationController
    def show #mostra una scheda
        @schedule = ScheduleExercise.where(schedule_id:params[:id])
    end
  
    def new

    end

    def index 
    end
  
    def create
    end
end
