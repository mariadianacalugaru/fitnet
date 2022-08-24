class RequestsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create 
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
			redirect_to requests_path, notice: "Request successfully sent." 
		else
			render :new, status: :unprocessable_entity 
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request successfully removed." }
    end
  end


  private
    def request_params
      params.require(:request).permit(:age, :height, :weight, :abs, :biceps, :cardio, :glutes, :hamstrings, :pectorals, :quads, :triceps)
    end
  
end
