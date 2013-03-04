Feature: Costs Interface
  In order to use this app
  As an user
  I want to handle costs

  Background:
    Given I run the app
    And the following mates exist:
    | name |
    | Jack |
    | John |

  Scenario: Add cost
    When I click on "Cost"
    And I insert the "description" "Beer"
    And I insert the "cost" "15"
    And I select the mate "Jack"
    And I submit "submit"
    Then I should see "Costs"
    And I should see "Beer"
    And I should see "15"
    And I should see "Paid by Jack"

  Scenario: Cost description validation
    When I click on "Cost"
    And I insert the "cost" "15"
    And I select the mate "Jack"
    And I submit "submit"
    Then I should see "Please, fill in all fields."

  Scenario: Cost value validation (1)
    When I click on "Cost"
    And I insert the "description" "Beer"
    And I select the mate "Jack"
    And I submit "submit"
    Then I should see "Please, fill in all fields."

  Scenario: Cost value validation (2)
    When I click on "Cost"
    And I insert the "description" "Beer"
    And I insert the "cost" "COST"
    And I select the mate "Jack"
    And I submit "submit"
    Then I should see "Note: cost must be numeric"

  Scenario: Mate value validation
    When I click on "Cost"
    And I insert the "description" "Beer"
    And I submit "submit"
    Then I should see "Please, fill in all fields."
