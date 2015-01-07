@file_upload
Feature: File Upload

	In order to upload files
	As an content creator
	I want to upload and manage files
	
	Background:
	Given the website is configured
	
	Scenario: Upload file
		Given I am logged in as admin
		And I go to the files page
		When I click in the link "Upload File"
		And I fill in "Title" with "Cat meme"
		And I fill in "Description" with "Cats with lasers"
		And I upload the file "cats_with_lasers.jpg" to the field "upload_file"
		And I click in the button "Save"
		Then I should see "Upload was successfully created"
		And I should see the image "cats_with_lasers.jpg"
	
	Scenario: List files
		Given I am logged in as admin
		And the following files where uploaded
		| title  | description        | file 			   | 
		| Aliens | History Chanel guy | aliens_meme.jpg      |
		| Cats   | Cats with lasers   | cats_with_lasers.jpg |
		When I go to the files page
		Then I should see "Aliens"
		And I should see the image "aliens_meme.jpg"
		And I should see "Cats"
		And I should see the image "cats_with_lasers.jpg"
		
	Scenario: Edit file
		Given I am logged in as admin
		And the following files where uploaded
		| title  | description        | file 			   | 
		| Aliens | History Chanel guy | aliens_meme.jpg      |
		| Cats   | Cats with lasers   | cats_with_lasers.jpg |
		When I go to the files page
		And I click in the link "Aliens"
		And I click in the link "Edit"
		And I fill in "Title" with "Crazy Dude"
		And I fill in "Description" with "I see aliens"
		And I click in the button "Save"
		Then I should see the image "aliens_meme.jpg"
		And I should see "Crazy Dude"
		And I should see "I see aliens"
	
	Scenario: Delete file
		Given I am logged in as admin
		And the following files where uploaded
		| title  | description        | file 			   | 
		| Aliens | History Chanel guy | aliens_meme.jpg      |
		| Cats   | Cats with lasers   | cats_with_lasers.jpg |
		When I go to the files page
		And I click in the link "Aliens"
		And I click in the link "Delete"
		Then I should see "Cats"
		And I should see the image "cats_with_lasers.jpg"
		And I should not see "Aliens"