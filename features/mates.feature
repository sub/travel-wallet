Feature: Handle mates
  In order to use this app
  As an user
  I want to handle mates

  Background:
    Given I run the app
    And the following mates exist:
    | name |
    | Jack |
    | John |

  Scenario: Mates view
    When I click on "Mates"
    Then I should see "Jack"
    And I should see "John"

  Scenario: Edit mate
    When I click on "Mates"
    And I click on "Jack"
    And I insert the "name" "JackNEW"
    And I submit "Update"
    Then I should see "Summary"
    And I should see "JackNEW"

  Scenario: Remove mate
    When I click on "Mates"
    And I click on "Jack"
    And I submit "Remove"
    And I click on "Yes, I'm really sure"
    Then I should see "Summary"
    And I should see "John"

  Scenario: Remove another mate
    When I click on "Mates"
    And I click on "John"
    And I submit "Remove"
    And I click on "Yes, I'm really sure"
    Then I should see "Summary"
    And I should see "Jack"

  Scenario: Mate validation
    When I click on "Mate"
    And I submit "submit-participant"
    Then I should see "Please, fill in all fields."
