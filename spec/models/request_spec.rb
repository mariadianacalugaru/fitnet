require 'rails_helper'

RSpec.describe Review, type: :model do

    before do  
        @user = FactoryBot.create(:user)
        @pt = FactoryBot.create(:pt)
    end


    describe "Create a Request without a user " do
        it "shouldn't be permitted" do
            request = Request.create(age: '26', height: '185', weight: '85', abs: true, cardio: true, quads: true, pt_id: @pt)
            expect(request).to_not be_valid
        end
    end

    describe "Create a Request without age " do
        it "shouldn't be permitted" do
            request = Request.create(user_id: @user, height: '185', weight: '85', abs: true, cardio: true, quads: true, pt_id: @pt)
            expect(request).to_not be_valid
        end
    end

    describe "Create a Request without height " do
        it "shouldn't be permitted" do
            request = Request.create(user_id: @user, age: '26', weight: '85', abs: true, cardio: true, quads: true, pt_id: @pt)
            expect(request).to_not be_valid
        end
    end

    describe "Create a Request without weight " do
        it "shouldn't be permitted" do
            request = Request.create(user_id: @user, age: '26', height: '185', abs: true, cardio: true, quads: true, pt_id: @pt)
            expect(request).to_not be_valid
        end
    end

    describe "Create a valid Request " do
        it "should be permitted" do
            request = Request.create(user_id: @user, age: '26', height: '185', weight: '85', abs: true, cardio: true, quads: true, pt_id: @pt)
            expect(request).to_not be_valid
        end

        it "should be permitted also not to choose a pt" do
            request = Request.create(user_id: @user, age: '26', height: '185', weight: '85', abs: true, cardio: true, quads: true)
            expect(request).to_not be_valid
        end
    end

end