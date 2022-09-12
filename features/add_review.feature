Feature: Add a review

Scenario: Add a review
	  Given I am on the home page
	  Given I am a registered user

	  When I follow "Log In"
      Then I should be on the login page
      When I fill in "Email" with "lorenzo@gmail.com"
      And I fill in "user_password" with "lorenzo2000"
      And I press "Login"
      Then I should be on the home page

	  When I follow "Personal Area"
	  Then I should be on the dashboard page

	  When I follow "Add a review"
	  Then I should be on the create a new review page

	  When I fill in "body" with "One of the best fitness applications I ever tried!"

	  And I press "Add review"
	  Then I should be on the reviews page
	  And I should see "Review successfully added."
	  



	  
