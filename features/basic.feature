Feature: Basic User Interface
  In order to use this app
  As an user
  I want to interact with a UI

  Background:
    Given I run the app

  Scenario: See empty summary page
    Then I should see "No info added yet"

  Scenario: Unable to add cost
    When I click on "Cost"
    Then I should see "Please, add at least a mate first."

  Scenario: Empty mates view
    When I click on "Mates"
    Then I should see "No Mates added yet"

  Scenario: Add mate
    When I click on "Mate"
    And I insert the "name" "Jack"
    And I submit "submit-participant"
    Then I should see "Summary"
    And I should see "Jack"

  Scenario: See correct initial travel cost
    Then I should not see "Total"

  Scenario: See correct initial travel cost with one mate
    When I click on "Mate"
    And I insert the "name" "Jack"
    And I submit "submit-participant"
    Then I should see "Total: 0"
