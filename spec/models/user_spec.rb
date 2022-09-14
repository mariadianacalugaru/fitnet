require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Create an User without firstname " do
    it "shouldn't be permitted" do
        user = User.create(lastname: 'Lastname', email: 'email@gmail.com', password: 'password2000', password_confirmation: 'password2000', gender: 'M')
        expect(user).to_not be_valid
    end
  end

  describe "Create an User without lastname " do
    it "shouldn't be permitted" do
        user = User.create(firstname: 'Firstname', email: 'email@gmail.com', password: 'password2000', password_confirmation: 'password2000', gender: 'M')
        expect(user).to_not be_valid
    end
  end

  describe "Create an User without email " do
    it "shouldn't be permitted" do
        user = User.create(firstname: 'Firstname',lastname: 'Lastname', password: 'password2000', password_confirmation: 'password2000', gender: 'M')
        expect(user).to_not be_valid
    end
  end

  describe "Create an User with an invalid email " do
    it "shouldn't be permitted" do
        user = User.create(firstname: 'Firstname',lastname: 'Lastname', email: 'email', password: 'password2000', password_confirmation: 'password2000', gender: 'M')
        expect(user).to_not be_valid
    end
  end

  describe "Create an User without a password " do
    it "shouldn't be permitted" do
        user = User.create(firstname: 'Firstname',lastname: 'Lastname', email: 'email@gmail.com', password_confirmation: 'password2000', gender: 'M')
        expect(user).to_not be_valid
    end
  end

  describe "Create an User with a password shorter than 6 characters " do
    it "shouldn't be permitted" do
        user = User.create(firstname: 'Firstname',lastname: 'Lastname', email: 'email@gmail.com', password: 'pass', password_confirmation: 'pass', gender: 'M')
        expect(user).to_not be_valid
    end
  end

  describe "Create an User with different password and password confirmation " do
    it "shouldn't be permitted" do
        user = User.create(firstname: 'Firstname',lastname: 'Lastname', email: 'email@gmail.com', password: 'password2000', password_confirmation: 'password', gender: 'M')
        expect(user).to_not be_valid
    end
  end

  describe "Create a valid User " do
    it "should be permitted" do
        user = User.create(firstname: 'Firstname',lastname: 'Lastname', email: 'email@gmail.com', password: 'password2000', password_confirmation: 'password2000', gender: 'M')
        expect(user).to be_valid
    end
  end
 
end