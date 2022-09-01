class SchedulesController < ApplicationController
  def index #mostra tutte le schede
    @schedules = Schedule.where(user_id:current_user.id)
    @exercises = Exercise.all
  end

  def new
    @schedule = Schedule.new
    @exercises = Exercise.all
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.pt_id = current_user.id
    @schedule.user_id = params[:user_id]

    if @schedule.save
      series = "series_exercise_"
      time = "time_exercise_"
      reps = "reps_exercise_"
      n = Integer(params[:exercises_number])
      (0..n).each do |i|
        @row = ScheduleExercise.new
        @row.schedule_id = @schedule.id
        @row.exercise_id = params["exercise" + i.to_s]
        @row.rep = params[reps + i.to_s]
        @row.time = params[time + i.to_s]
        @row.series = params[series + i.to_s]
        if @row.save
          puts "Exercise " + @row.exercise_id.to_s + " correctly insert in schedule " + @row.schedule_id.to_s
        else
          puts "Errore inserimento esercizio"
        end
      end
      redirect_to "/schedules" #DA CAMBIARE PERCHE' NON C'E' LA NOTICE DELL'AVVENUTO INVIO DELLA SCHEDA
    else
      render :new, status: :unprocessable_entity 
    end

  end

  private
    def schedule_params
      params.require(:schedule).permit(:user_id, :description)
    end

end
