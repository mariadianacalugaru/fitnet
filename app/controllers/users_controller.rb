class UsersController < ApplicationController
    load_and_authorize_resource
    def index
      @personal_trainers = User.where(pt: 1)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "Movie was successfully destroyed." }
      end
    end
end