Feature: Reset Interface
  In order to use this app
  As an user
  I want to be able to reset info added

  Background:
    Given I run the app
    And the following mates exist:
    | name     |
    | Jack   |
    | John | 
    And the following costs exist:
    | description | cost | mate     |
    | Beer        |   15 | Jack   |
    | Food        |   10 | John |

  Scenario: Reset data (1)
    When I click on Home
    And I click on "Settings"
    And I click on "Reset"
    And I click on "Yes, I'm really sure"
    And I click on Home
    Then I should see "No info added yet"

  Scenario: Reset data (2)
    When I click on Home
    And I click on "Settings"
    And I click on "Reset"
    And I click on "Yes, I'm really sure"
    And I click on Home
    And I click on "Cost"
    Then I should see "Please, add at least a mate first."
