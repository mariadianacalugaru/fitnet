class UsersController < ApplicationController
    def index
      @personal_trainers = User.where(pt: 1)
    end
end