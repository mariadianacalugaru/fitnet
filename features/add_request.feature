Feature: Add a new request for a workout schedule

Scenario: Create a new request
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

	  When I follow "My Requests"
	  Then I should be on the requests page

	  When I follow "Add a request"
	  Then I should be on the create a new request page

	  When I fill in "age" with "22"
      And I fill in "weight" with "83"
      And I fill in "height" with "185"

	  And I check "glutes"
	  Then the "glutes" checkbox should be checked
	  And I check "cardio"
	  Then the "cardio" checkbox should be checked
	  And I check "pectorals"
	  Then the "pectorals" checkbox should be checked

	  And I press "Add request"
	  Then I should be on the requests page
	  And I should see "Request successfully sent."



	  
