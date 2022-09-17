class SchedulesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  
  def index #mostra tutte le schede
    @schedules = Schedule.all.order('created_at DESC')
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
    @schedule.request_id = params[:request_id]

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
      Request.where(id:params[:request_id]).update(done:true)
      redirect_to schedules_path, notice: "Schedule successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end

  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule successfully removed." }
    end

  end 


  private
    def schedule_params
      params.require(:schedule).permit(:user_id, :description)
    end

end
