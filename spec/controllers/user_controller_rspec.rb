require 'rails_helper'
require 'spec_helper'

RSpec.describe "User", type: :controller do
  
    before :each do
        @user = FactoryBot.create(:user)
    end

    describe "GET #index" do
        context "user is logged in" do
            it "renders user profile page" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
                        allow(controller).to receive(:current_user).and_return(@user)
                get :index
                expect(response).to be_successful
            end
        end

        context "user is not logged in" do
            it "redirects to login page" do
              allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
              allow(controller).to receive(:current_user).and_return(nil)
              get :index
              expect(response).to redirect_to(new_user_session_path)
            end
        end
    end

end