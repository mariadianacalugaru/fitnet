class SchedulesController < ApplicationController
  def index #mostra tutte le schede
    @schedules = Schedule.all
  end

  def new
  end

  def create
  end
end
