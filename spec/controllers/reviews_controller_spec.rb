require 'rails_helper'
require 'spec_helper'

RSpec.describe ReviewsController, type: :controller do
    # visualizzazione recensioni
    describe "GET #index" do
        it "renders reviews page" do
            get :index
            expect(response).to render_template("index")
        end
    end

    # accesso alla pagina reviews/new
    describe 'GET #new' do
      context "when user logged in"  do
        login_user
        it 'renders "new review" page' do
          get :new
          expect(response).to render_template(:new)
        end
      end

      context "with no user logged in" do
        it "returns a redirect to index" do
          allow(controller).to receive(:authenticate_user!).and_return(false)
          get :new
          expect(response).to redirect_to("/")  
        end
      end
    end
    
    # aggiunta nuova recensione
    describe "POST #create" do
      context "as an user logged in" do
        it "create a new review successfully" do
            @user = FactoryBot.create(:user)
            sign_in(@user)
            attributes = { :body => "Nice app!", :user_id => @user.id }
            post :create, params: { review: attributes} 

            review = Review.find_by(user_id: @user.id)
			      expect(assigns(:review)).to eq(review)
            expect(response).to redirect_to(reviews_path())
        end
      end

      context "with no user logged in" do
        it "returns a unsuccess response" do
          @user = FactoryBot.create(:user)
          attributes = { :body => "Nice app!", :user_id => @user.id }
          post :create, params: { review: attributes} 
          expect(controller.user_signed_in?).to be false
          expect(response).not_to be_successful
        end
      end

    end

end