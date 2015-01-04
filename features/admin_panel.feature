@admin_panel
Feature: Admin Panel
	In order to administer a website 
	As the owner/admin of the system
	I want to config the website thru an admin panel
	
	Background:
	Given the website is configured
	And the following blog_post list 
	| title       | content                | published | description         | slug        | 
	| Hello World | Welcome to the website | true      | First Post          | hello_world | 
	| Test 001    | 1 2 3 testing          | true      | Testing the website | test_001    |

	
	Scenario: Admin navigates to Dashboard 
		Given I am logged in as admin
		When I click in the link "Admin Panel"
		Then I should see "Dashboard" 
		And I should see "2 Posts"
		And I should see "2 Users"
		And I should see "0 Files"
		And I should see "0/0 Messages"
		
	Scenario: Registered user trying to access the Admin Panel
		Given I am logged in as user
		When I go to the admin dashboard
		Then I should see "You dont have permission to access that page!" 
		
	Scenario: Unregistered user trying to access the Admin Panel
		Given I am not logged in
		When I go to the admin dashboard
		Then I should see "You dont have permission to access that page!"
		
	Scenario: Admin navigates to configurations page 
		Given I am logged in as admin
		When I click in the link "Admin Panel"
		And I click in the link "Configurations"
		Then I should see in the field "Tagline" the text "A Ruby on Rails app template"
		
	Scenario: Registered user trying to access the configurations page
		Given I am logged in as user
		When I go to the configurations page
		Then I should see "You dont have permission to access that page!" 
		
	Scenario: Unregistered user trying to access the configurations page
		Given I am not logged in
		When I go to the configurations page
		Then I should see "You dont have permission to access that page!"
		
	Scenario: Change the website name and Tagline
		Given I am logged in as admin
		And I should see "Rails Website Template"
		When I go to the configurations page
		Then I fill in "info_website_name" with "Testing Website Name"
		And I fill in "info_tagline" with "Just another cucumber test"
		And I click in the button "Update Config"
		Then I should see "Testing Website Name"
		And I should see in the field "info_website_name" the text "Testing Website Name"
		And I should see in the field "Tagline" the text "Just another cucumber test"