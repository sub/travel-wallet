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
    And the following costs exist:
    | description | cost | mate |
    | Beer        |   15 | Jack |
    | Food        |   10 | John |

  Scenario: Edit cost
    When I click on "Costs"
    And I click on "Beer"
    And I insert the "Description" "Bed"
    And I insert the "Cost" "25"
    And I select the mate "Jack"
    And I submit "submit-edit-cost"
    Then I should see "Costs"
    And I should see "Bed"
    And I should see "25"
    And I should see "Paid by Jack"
    And I should see "Food"
    And I should see "10"

  Scenario: Remove cost
    When I click on "Costs"
    And I click on "Food"
    And I submit "Remove"
    And I click on "Yes, I'm really sure"
    Then I should see "Costs"
    And I should see "Beer"
    And I should see "15"
    And I should see "Paid by Jack"
    And I should not see "Paid by John"

  Scenario: Remove another cost
    When I click on "Costs"
    And I click on "Beer"
    And I submit "Remove"
    And I click on "Yes, I'm really sure"
    Then I should see "Costs"
    And I should see "Food"
    And I should see "10"
    And I should not see "Paid by Jack"
    And I should see "Paid by John"

  Scenario: See spent and give/receive correct values
    When I click on Home
    Then I should see "Money spent: 15.00"
    And I should see "Status: 2.50"
    And I should see "Money spent: 10.00"
    And I should see "Status: -2.50"

  Scenario: Still see spent and give/receive correct values after removing cost
    When I remove the cost "Food"
    And I click on Home
    Then I should see "Money spent: 15.00"
    And I should see "Status: 7.50"
    And I should see "Money spent: 0.00"
    And I should see "Status: -7.50"

  Scenario: Still see spent and give/receive correct values after adding cost
    When I add the cost "Bed" "31.30" "John"
    And I click on Home
    Then I should see "Money spent: 15.00"
    And I should see "Status: -13.15"
    And I should see "Money spent: 41.30"
    And I should see "Status: 13.15"

  Scenario: Still see spent and give/receive correct values after adding participant
    When I add the mate "Mari"
    Then I should see "Money spent: 15.00"
    And I should see "Status: 6.67"
    And I should see "Money spent: 10.00"
    And I should see "Status: 1.67"
    And I should see "Money spent: 0"
    And I should see "Status: -8.33"

  Scenario: Still see spent and give/receive correct values after removing participant
    When I add the mate "Mari"
    And I add the cost "Bed" "31.30" "Mari"
    And I click on Home
    And I remove the mate "Mari"
    Then I should see "Money spent: 15.00"
    And I should see "Status: 2.50"
    And I should see "Money spent: 10.00"
    And I should see "Status: -2.50"

