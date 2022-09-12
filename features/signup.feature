Feature: User Signup

Scenario: Success Signup
	  Given I am on the home page
      When I follow "Sign Up"
      Then I should be on the signup page
      When I fill in "Firstname" with "Lorenzo"
      And I fill in "Lastname" with "Mastrandrea"
      And I fill in "Email" with "lorenzo@gmail.com"
      And I fill in "user_password" with "lorenzo2000"
      And I fill in "user_password_confirmation" with "lorenzo2000"
      And I select "M" from "Gender" 
      And I press "Sign up"
      Then I should be on the home page