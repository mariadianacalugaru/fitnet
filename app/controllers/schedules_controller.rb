class SchedulesController < ApplicationController
  def index #mostra tutte le schede
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    x = Schedule.new(params[:id])
    puts "CIAOoooooooooo"
    puts x
  end

  private
    def schedule_params
      params.require(:schedule).permit(:user_id, :description)
    end

end
