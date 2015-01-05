@focus
Feature: Email Subscription

	In order to send newsletters to customers
	As an marketing guy
	I want to a email subscription button
	
	Background:
	Given the website is configured
	And the following subscription list 
	| first_name | last_name | email 			   | 
	| Jimy       | San  	| jimysan@website.com  |
	| John       | Doe       | john_doe@website.com |

	Scenario: Newsletter subscription form
		Given I am not logged in
		And I visit the homepage
		And I should see "Subscribe to our newsletter"
		And I fill in "subscription_first_name" with "Monty"
		And I fill in "subscription_last_name" with "Cantsin"
		And I fill in "subscription_email" with "monty_cantsin@canada.com"
		And I click in the button "submit_subscription"
		Then I should see "Thanks for subscribing to our newsletter"
		And "monty_cantsin@canada.com" should receive an email with subject "Thanks for subscribing"
		
	Scenario: Admin panel email subscription list
		Given I am logged in as admin
		And I go to the admin dashboard
		And I click in the link "Subscribers"
		Then I should see "Jimy San"
		And I should see "jimysan@website.com"		
		And I should see "John Doe"
		And I should see "john_doe@website.com"
		
	Scenario: Export subscription list as a CVS file
		Given I am logged in as admin
		And I go to the subscribers page
		When I click in the link "Export CVS"
		Then I should see "Jimy,San,jimysan@website.com,"
		And I should see "John,Doe,john_doe@website.com"
		
		
	# 1. Create subscription model
	# 2. Create subscription controller
	# 3. Create subscription form view helper
	# 4. Define subscribers method in admin controller
	# 5. Create subscribers view
	# 6. Define Export to CVS method in admin controller
	# 7. Hookup the mailchimp API and send subscriber after subscription
	