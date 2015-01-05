@blog
Feature: Blog Posts
	In order to make a blog 
	As an author
	I want to create and manage blog psots
	
	Background:
	Given the website is configured
	And the following list of blog posts 
	| title       | content                | published | description         | slug        | 
	| Hello World | Welcome to the website | true      | First Post          | hello_world | 
	| Test 001    | 1 2 3 testing          | true      | Testing the website | test_001    |

	Scenario: Blog posts list 
		When I go to the blog page 
		Then I should see "Hello World" 
		And I should see "First Post"
		And I should see "Test 001" 
		And I should see "Testing the website"
	
	Scenario: Blog post page 
		When I go to the blog page 
		And I click in the link "Hello World" 
		Then I should see "Hello World" 
		And I should see "Welcome to the website"
		And The current url should be "/blog/hello_world"

	Scenario: New blog post
		Given I am logged in as admin
		Then I click in the link "Admin Panel"
		And I click in the link "Posts"
		And The current url should be "/admin/posts"
		Then I click in the link "New Post"
		And The current url should be "/admin/posts/new"
		Then I fill in "Title" with "Test 002"
		And I fill in "Slug" with "test_002"
		And I fill in "Description" with "Another blog post test"
		And I fill in "post_content" with "This is blog post test number 002!"
		And I click in the button "Save"
		Then I should see "Test 002"
		And I should see "This is blog post test number 002!"
		And I should see "Admin"
		
	Scenario: Delete blog post
		Given I am logged in as admin
		Then I click in the link "Admin Panel"
		Then I click in the link "Posts"
		And The current url should be "/admin/posts"
		Then I should see "Hello World"
		And I should see "Test 001"
		Then I click in the link "delete_hello_world"
		Then I should see "Test 001"
		And I should not see "Hello World"
		
	Scenario: Only admin users can see edit blog post button
		Given I go to the blog page 
		And I click in the link "Hello World"
		Then I should not see the link "edit_hello_world"
		Then I log in as admin
		And I go to the blog page 
		And I click in the link "Hello World"
		Then I should see the link "edit_hello_world"
		
	Scenario: Only admin users can access the blog posts admin page
		Given I go to the blog page 
		Then I should not see the link "navlink_admin_panel"
		Then I go to the admin blog posts page
		And I should see "You dont have permission to access that page!"
		Then I log in as admin
		And I go to the admin blog posts page
		Then The current url should be "/admin/posts"