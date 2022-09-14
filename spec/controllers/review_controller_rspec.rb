require 'rails_helper'
require 'spec_helper'

RSpec.describe "Review", type: :controller do
  
    before :each do
        @user = FactoryBot.create(:user)
    end

    describe "GET #index" do
        it "renders reviews page" do
            get :index
            expect(response).to render_template("index")
        end
    end

    describe "POST create" do
        context "when user logged in"  do
            login_user
            it "renders the create template" do
              post :create, 
              expect(response).to render_template("create")
            end
          end

          context "when user not logged in" do
            describe "add a review without a logged account" do
              it "redirects to sign_in page" do
                get :index
                assert_redirected_to user_session_url
              end
          end
        end
    end

end