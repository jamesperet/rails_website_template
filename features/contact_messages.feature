Feature: Contact Messages
	In order to send a message
	As an visitor
	I want to send contact messages
	
	Scenario: Send Contact Message as a visitor
		Given I go to the homepage
		When I go to the contact page 
		Then the page should have a "form" called "new_contact_message"
		And I fill in "contact_message_email" with "yo@website.com"
		And I fill in "contact_message_title" with "Hello Webmaster"
		And I fill in "contact_message_content" with "How are you doing bro?"
		And I click in the button "submit_contact_message"
		Then I should see "Message sent!" 
	
	@focus
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
