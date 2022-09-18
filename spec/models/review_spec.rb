require 'rails_helper'

RSpec.describe Review, type: :model do

    before do  
        @user = FactoryBot.create(:user)
    end


    describe "Create a Review without a body " do
        it "shouldn't be permitted" do
            review = Review.create(user_id: @user)
            expect(review).to_not be_valid
        end
    end

    describe "Create a Review without a user " do
        it "shouldn't be permitted" do
            review = Review.create(body: "This is one of the best fitness app I've ever tried!")
            expect(review).to_not be_valid
        end
    end

    describe "Create a Review correctly " do
        it "should be permitted" do
            review = Review.create(user_id: @user.id, body: "This is one of the best fitness app I've ever tried!")
            expect(review).to be_valid
        end
    end

end