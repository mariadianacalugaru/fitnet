class MessagesController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  
    def index
      @messages = Message.all
    end
  
    def new
      @message = Message.new
    end
  
    def create
      @message = Message.new(message_params)
      @message.user_id = current_user.id
      if @message.save
        redirect_to messages_path, notice: "Message successfully added." 
      else
        render :new, status: :unprocessable_entity 
      end
    end
  
    def destroy
      @message = Message.find(params[:id])
      @message.destroy

      respond_to do |format|
        format.html { redirect_to messages_url, notice: "Message successfully removed." }
      end
    end

    
    private
      def message_params
        params.require(:message).permit(:body, :for)
      end
    

  end