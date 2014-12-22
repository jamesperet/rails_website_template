Feature: Manage Articles 
	In order to make a blog 
	As an author
	I want to create and manage blog psots
	
	Background:
	Given the following blog_post list 
	| title       | content                | published | description         | slug        | 
	| Hello World | Welcome to the website | true      | First Post          | hello_world | 
	| Test 001    | 1 2 3 testing          | true      | Testing the website | test_001    |

	@focus	
	Scenario: Blog Posts List 
		When I go to the blog page 
		Then I should see "Hello World" 
		And I should see "First Post"
		And I should see "Test 001" 
		And I should see "Testing the website"
	
	Scenario: Posts Page 
		When I go to the blog page 
		And I click in the link "Hello World" 
		Then I should see "Hello World" 
		And I should see "Welcome to the website"