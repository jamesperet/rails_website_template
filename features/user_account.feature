@user_account
Feature: User Account
	In order to change content in the website 
	As user of the system
	I want to create, update adn delete my user account
	
	Background:
	Given the website is configured
	
	Scenario: Registered user login
		Given the user "Monty" "Cantsin" with email "monty_cantsin@canada.com" and password "12345678" exists
		And I am not logged in
		When I go to the login page
		Then I should see "Sign In"
		And I log in with the email "monty_cantsin@canada.com" and password "12345678"
		Then I should see "Signed in successfully"
		And I should see "Monty Cantsin"
		And I should see "Logout"
		
	Scenario: Registered user logout
		Given the user "Monty" "Cantsin" with email "monty_cantsin@canada.com" and password "12345678" exists
		And I am not logged in
		When I go to the login page
		And I log in with the email "monty_cantsin@canada.com" and password "12345678"
		Then I click in the link "Logout"
		And I should see "Signed out successfully"
		
	Scenario: User registration
		Given I am not logged in
		And I go to the signup page
		When I fill in "First Name" with "Monty"
		And I fill in "Last Name" with "Cantsin"
		And I fill in "Email" with "monty_cantsin@canada.com"
		And I fill in "Password" with "12345678"
		And I fill in "Password Confirmation" with "12345678"
		And I submit the login form
		Then I should see "Welcome! You have signed up successfully"
		And I should see "Monty Cantsin"
		And I should see "Logout"
		And "monty_cantsin@canada.com" should receive an email with subject "Welcome to Rails Website Template"
	
	@focus	
	Scenario: User forgets password
		Given the user "Monty" "Cantsin" with email "monty_cantsin@canada.com" and password "12345678" exists
		And I am not logged in
		And I go to the login page
		When I click in the link "Forgot your password?"
		And I fill in "Email" with "monty_cantsin@canada.com"
		And I submit the password reset form
		Then I should see "You will receive an email with instructions on how to reset your password in a few minutes"
		And "monty_cantsin@canada.com" should receive an email with subject "Reset password instructions"
		When I open the email with subject "Reset password instructions"
		Then I should see "Someone has requested a link to change your password" in the email body
		Then I clicks in the link "Change my password" in the email
		And I fill in "New Password" with "87654321"
		And I fill in "Confirm New Password" with "87654321"
		And I submit the new password form
		Then I should see "Your password was changed successfully. You are now signed in."
		And I should see "Monty Cantsin"
		And I should see "Logout"
		