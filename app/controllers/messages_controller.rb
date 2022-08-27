class MessagesController < ApplicationController
  
    def index
      @messages = Message.all
    end
  
    def new
      @message = Message.new
    end
  
    def create
      @message = Message.new(message_params)
      @message.for = 0
      if @message.save
        redirect_to messages_path, notice: "Message successfully added." 
      else
        render :new, status: :unprocessable_entity 
      end
    end
  
    private
      def message_params
        params.require(:message).permit(:body)
      end
    
  
  end
  