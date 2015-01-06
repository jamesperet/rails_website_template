@focus
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