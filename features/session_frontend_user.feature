Feature: login for frontend user
  In order to use peperoni
  as a frontend user / customer
  I should be able to log in
  
  Scenario: Frontend User with invalid credentials
    Given the following role records
      | name          |
      | frontend_user  |
    And the following frontend_user records
      | username | email                | password |
      | customer | customer@example.com | secret   |
    And I am on the login page
    When I fill in "Email" with "customer@example.com"
    And I fill in "Password" with "wrongsecret"
    And I press "Login"
    Then I should see error messages
    And I should be on the login page
    
  
  Scenario: Frontend User with valid credentials
    Given the following role records
      | name          |
      | frontend_user  |
    And the following frontend_user records
      | username | email                | password |
      | customer | customer@example.com | secret   |
    And I am on the login page
    When I fill in "Email" with "customer@example.com"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should see "Login successful"
    And I should be on the account page