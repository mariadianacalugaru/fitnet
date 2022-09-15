require 'rails_helper'
require 'spec_helper'

RSpec.describe RequestsController, type: :controller do

    # visualizzazione schede
    describe "GET #index" do
        #utente loggato che vede le sue richieste
        context "when user logged in"  do
            login_user
            it 'renders "my requests" page' do
                get :index
                expect(response).to render_template("index")
            end
        end

        #admin loggato che vede le richieste
        context "when user logged in"  do
            login_admin
            it 'renders "my requests" page' do
                get :index
                expect(response).to render_template("index")
            end
        end
        
        #utente non loggato
        context "when user not logged in"  do
            it 'renders a redirect to index' do
                get :index
                expect(response).to redirect_to("/") 
            end
        end
    end


    # accesso alla pagina request/new
    describe 'GET #new' do
      #utente loggato ha l'accesso
      context "when user logged in"  do
        login_user
        it 'renders "new review" page' do
          get :new
          expect(response).to render_template(:new)
        end
      end

      #utente non loggato non ha l'accesso
      context "with no user logged in" do
        it "returns a redirect to index" do
          allow(controller).to receive(:authenticate_user!).and_return(false)
          get :new
          expect(response).to redirect_to("/")  
        end
      end
    end


    #creazione nuova richiesta
    describe "POST #create" do
      #utente crea una nuova richiesta per una scheda di allenamento
      context "as an user logged in" do
        it "create a new request successfully" do
            user = FactoryBot.create(:user)
            sign_in(user)
            pt = FactoryBot.create(:pt)
            attributes = {:user_id => user.id, 
                          :age => '24',
                          :height => '180',
                          :weight => '76', 
                          :abs => true, 
                          :biceps => false,
                          :cardio => true, 
                          :glutes => true, 
                          :hamstrings => false,
                          :pectorals => false,
                          :quads => true,
                          :triceps =>false,
                          :pt_id => pt.id }
            post :create, params: { request: attributes} 

            request = Request.find_by(user_id: user.id)
			expect(assigns(:request)).to eq(request)
            expect(response).to redirect_to(requests_path())
        end
      end

      # un admin non ha il permesso di creare una richiesta per una scheda di allenamento
      context "as admin logged in" do
        it "doesn't have permission to create a new request" do
            admin = FactoryBot.create(:admin)
            sign_in(admin)
            pt = FactoryBot.create(:pt)
            attributes = {:user_id => admin.id, 
                            :age => '24',
                            :height => '180',
                            :weight => '76', 
                            :abs => true, 
                            :biceps => false,
                            :cardio => true, 
                            :glutes => true, 
                            :hamstrings => false,
                            :pectorals => false,
                            :quads => true,
                            :triceps =>false,
                            :pt_id => pt.id }
            post :create, params: { request: attributes} 
            expect(response).not_to be_successful 
        end
      end

      # un utente non loggato non può creare una richiesta
      context "with no user logged in" do
        it "returns a unsuccess response" do
          user = FactoryBot.create(:user)
          pt = FactoryBot.create(:pt)
          attributes = {:user_id => user.id, 
                          :age => '24',
                          :height => '180',
                          :weight => '76', 
                          :abs => true, 
                          :biceps => false,
                          :cardio => true, 
                          :glutes => true, 
                          :hamstrings => false,
                          :pectorals => false,
                          :quads => true,
                          :triceps =>false,
                          :pt_id => pt.id }
          post :create, params: { request: attributes} 
          expect(controller.user_signed_in?).to be false
          expect(response).not_to be_successful
        end
      end
    end

    #eliminazione richiesta
    describe "DELETE #destroy" do
        # utente non loggato
        context "with no user logged in" do
            it "returns no successfull response" do
                user = FactoryBot.create(:user)
                request = FactoryBot.create(:request)

                allow(controller).to receive(:authenticate_user!).and_return(false)
                delete :destroy, params: {:id => request.id}
                expect{ delete :destroy, params: {:id => request.id} }.not_to change(Request, :count)
                expect(response).not_to be_successful 
            end
        end

        # utente loggato
        context "with user logged in" do
            it "returns successfull delete" do
                user = FactoryBot.create(:user)
                sign_in(user)
                request = FactoryBot.create(:request, :user_id => user.id)
 
                expect{ delete :destroy, params: {:id => request.id} }.to change(Request, :count).by(-1)
                expect(response).to redirect_to(requests_path)
            end
        end

         # utente loggato che cerca di eliminare una richiesta non sua
         context "with user logged in" do
            login_user
            it "returns successfull delete" do
                request = FactoryBot.create(:request)
 
                expect{ delete :destroy, params: {:id => request.id} }.not_to change(Request, :count)
                expect(response).not_to be_successful
            end
        end

    end
end
