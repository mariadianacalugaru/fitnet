Feature: User login

Scenario: Success Login
	  Given I am on the home page
      And I follow "Log In"
      Then I should be on login page
      When I fill in "user_email" with "mario@gmail.com"
      And I fill in "user_password" with "mario2000"
      And I press "Login"
      Then I should be on the home page