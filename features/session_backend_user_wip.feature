Feature: login for backend user
  In order to use peperoni
  as a backend user / admin
  I should be able to log in
  
  @dev
  Scenario: Backend User with invalid credentials
    Given the following role records
      | name          |
      | backend_user  |
    And the following backend_user records
      | username | email             | password |
      | admin    | admin@example.com | secret   |
    And I am on the login page
    When I fill in "Email" with "admin@example.com"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should see error messages
    And I should be on the new login page

  @dev
  Scenario: Backend User with valid credentials
    Given the following role records
      | name          |
      | backend_user  |
    And the following backend_user records
      | username | email                | password |
      | customer | customer@example.com | secret   |
    And I am on the login page
    When I fill in "Email" with "customer@example.com"
    And I fill in "Password" with "badsecret"
    And I press "Login"
    Then I should see "Login successful"
    And I should be on the admin root page