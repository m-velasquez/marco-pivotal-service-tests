Feature: Comments

  Background:
    Given I use the "pivotal" service and the "owner" account
    And I send a POST request to "/projects" with json body
    """
    {
    "name": "Project created by cucumber {RANDOM}",
    "new_account_name": "New Account"
    }
    """
    And I save the response as "P"
    And I save the request endpoint for deleting
    And I send a POST request to "/projects/{P.id}/stories" with json body
    """
    {
    "name": "Story created by cucumber"
    }
    """
    And I save the response as "S"
    And I send a POST request to "/projects/{P.id}/stories/{S.id}/comments" with json body
    """
    {
    "text": "Comment created by cucumber"
    }
    """
    And I save the response as "C"

  @cleanData
  Scenario: PUT comment
    When I send a PUT request to "/projects/{P.id}/stories/{S.id}/comments/{C.id}" with json body
    """
    {
    "text": "Comment updated by cucumber"
    }
    """
    Then I validate the response has status code 200
    And I validate the response contains "text" equals "Comment updated by cucumber"
