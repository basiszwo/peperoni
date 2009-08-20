Feature: login for frontend user
  In order to use peperoni
  as a frontend user / customer
  I should be able to log in
  
  Background:
    Given the following role records
      | name          |
      | frontend_user  |
    And the following frontend_user records
      | username | email                | password |
      | customer | customer@example.com | secret   |
    And I am on the login page
  
  Scenario: Frontend User with invalid credentials
    When I fill in "Email" with "customer@example.com"
    And I fill in "Password" with "badsecret"
    And I press "Login"
    Then I should see error messages
    And I am on the login page
    
  Scenario: Frontend User with valid credentials
    When I fill in "Email" with "customer@example.com"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should see "Login successful"
    And I am on the account page