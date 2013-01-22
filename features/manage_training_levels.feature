Feature: Manage traninig_levels
    In order to manage tranining levels
    As a director delegate
    I want to create and manage training levels

    Scenario: Areas list
	Given I have tranining levels titled DAM, Telecommunications
	When I go to the list of training levels
	Then I should see "DAM"
	And I should see "Telecommunications"


    Scenario: Basic fields in a Tranining Level
	Given I am creating a new training_level
	Then I should see "name", "description" and "parent"
