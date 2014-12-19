Feature: Manage Articles 
	In order to make a blog 
	As an author 
	I want to create and manage articles
	
Scenario: Blog Posts List 
	Given I have blog posts titled Pizza, Breadsticks 
	When I go to the blog page 
	Then I should see "Pizza" And I should see "Breadsticks"