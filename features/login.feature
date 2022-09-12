Feature: User login

Scenario: Success Login
	  Given I am on the home page
      And I am a registered user
      When I follow "Log In"
      Then I should be on the login page
      When I fill in "Email" with "lorenzo@gmail.com"
      And I fill in "user_password" with "lorenzo2000"
      And I press "Login"
      Then I should be on the home page