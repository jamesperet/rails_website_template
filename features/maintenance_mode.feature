@maintenance_mode
Feature: Maintenance Mode

	In order to change things in the website
	As an admin
	I want to close the website for visitors
	
	Background:
	Given the website is configured
	
	Scenario: Enable maintenance mode
		Given I am logged in as admin
		When I go to the configurations page
		And the page should have a "input" called "info_maintenance_mode"
		Then I check the checkbox called "info_maintenance_mode"
		And I fill in "info_maintenance_title" with "Website under maintenance"
		And I fill in "info_maintenance_message" with "Please check back soon"
		And I click in the button "Update Config"
		Then I should see "Configurations saved successfully"
		And I go to the homepage
		And I should not see "Website under maintenance"
		Then I click in the link "Logout"
		And I go to the homepage
		And I should see "Website under maintenance"
		And I should see "Please check back soon"
		
	Scenario: Visitor tries to access page during maintenance mode
		Given I am not logged in
		And Maintenance mode is activated
		When I go to the blog page
		Then I should see "Website under maintenance"
		
	Scenario: User login during maintenance mode
		Given I am not logged in
		And Maintenance mode is activated
		When I log in as user
		Then I should not see "Website under maintenance"
		
	Scenario: Disable maintenance mode
		Given I am not logged in
		And Maintenance mode is activated
		When I log in as admin
		And I go to the configurations page
		And I uncheck the checkbox called "info_maintenance_mode"
		And I click in the button "Update Config"
		And I click in the link "Logout"
		And I go to the homepage
		Then I should not see "Website under maintenance"