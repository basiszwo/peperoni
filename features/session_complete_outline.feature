@slow
Feature: login for backend and frontend user
  In order to use peperoni
  as a backend or frontend user
  I should be able to log in

  Scenario Outline:
    Given the following role records
      | name   |
      | <role> |
    And the following <role> records
      | username   | email   | password   |
      | <username> | <email> | <password> |
    And I am on the login page
    When I fill in "Email" with "<email>"
    And I fill in "Password" with "<login_password>"
    And I press "Login"
    Then I should <action>
    And I should be on the <page> page

  Examples:
   | role          | email                | password | login_password | username | action                 | page       |
   | frontend_user | customer@example.com | secret   | badsecret      | customer | see error messages     | new login  |
   | frontend_user | customer@example.com | secret   | secret         | customer | see "Login successful" | account    |
   | backend_user  | admin@example.com    | secret   | badsecret      | admin    | see error messages     | new login  |
   | backend_user  | admin@example.com    | secret   | secret         | admin    | see "Login successful" | admin root |