@contact_messages
Feature: Contact Messages

	In order to send a message
	As an visitor
	I want to send contact messages
	
	In order to receive a messages from visitors
	As the site administrator
	I want to receive and access contact messages
	
	Background:
	Given the website is configured
	
	Scenario: Send Contact Message as a visitor
		Given I go to the homepage
		When I go to the contact page 
		Then the page should have a "form" called "new_contact_message"
		And I fill in "contact_message_email" with "yo@website.com"
		And I fill in "contact_message_title" with "Hello Webmaster"
		And I fill in "contact_message_content" with "How are you doing bro?"
		And I click in the button "submit_contact_message"
		Then I should see "Message sent!"
		And "admin@website.com" should receive an email with subject "Hello Webmaster" 
	
	Scenario: Send Contact Message as a user
		Given I am logged in as user
		And I go to the homepage
		When I go to the contact page 
		Then the page should have a "form" called "new_contact_message"
		And the page should not have a "input" called "contact_message_email"
		And I fill in "contact_message_title" with "Hello Webmaster"
		And I fill in "contact_message_content" with "How are you doing bro?"
		And I click in the button "submit_contact_message"
		Then I should see "Message sent!"
		And "admin@website.com" should receive an email with subject "Hello Webmaster"
	
	Scenario: Receive message
		Given I go to the contact page 
		And I fill in "contact_message_email" with "yo@website.com"
		And I fill in "contact_message_title" with "Hello Webmaster"
		And I fill in "contact_message_content" with "How are you doing bro?"
		And I click in the button "submit_contact_message"
		Then I should see "Message sent!"
		And "admin@website.com" should receive an email with subject "Hello Webmaster"
		Then I log in as admin
		And I go to the contact messages list
		And I should see "Hello Webmaster" 