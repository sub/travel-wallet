Feature: Travel Cost Interface
  In order to use this app
  As an user
  I want to know travel cost

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

  Scenario: Travel cost
    When I click on Home
    Then I should see "Total: 25"

  Scenario: Travel cost gets updated
    When I remove the cost "Food"
    And I click on Home
    Then I should see "Total: 15"

  Scenario: Travel cost gets updated
    When I add the cost "Bed" "31.30" "John"
    And I click on Home
    Then I should see "Total: 56.30"
