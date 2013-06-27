Feature: Deleting Tickets
	In order to delete tickets
	As a user
	I want to be able to press a button and make them disappear

	Background:
		Given there are the following users:
			|email|password|admin|
			|user@ticketee.com|password|false|
			|admin@ticketee.com|password|true|
		Given there is a project called "TextMate 2"
		And "user@ticketee.com" can view the "TextMate 2" project
		And "user@ticketee.com" has created a ticket for this project:
			|title|description|
			|Shiny!|My eyes! My eyes!|

  	Scenario: Delete ticket link is shown to a user with permission
			And "user@ticketee.com" can delete tickets in the "TextMate 2" project
			And I am signed in as "user@ticketee.com"
			Given I am on the homepage
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should see the "Delete" link

		Scenario: Delete ticket link is hidden to a user without permission
			And I am signed in as "user@ticketee.com"
			Given I am on the homepage
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should not see the "Delete" link

		Scenario: Delete ticket link is shown to admins
			Given I am signed in as "admin@ticketee.com"
			Given I am on the homepage
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should see the "Delete" link 
