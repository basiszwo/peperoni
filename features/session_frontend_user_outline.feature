Feature: login for frontend user
  In order to use peperoni
  as a frontend user / customer
  I should be able to log in
      
  Scenario Outline:
    Given the following role records
      | name          |
      | frontend_user |
    And the following frontend_user records
      | username   | email   | password   |
      | <username> | <email> | <password> |
    And I am on the login page
    When I fill in "Email" with "<email>"
    And I fill in "Password" with "<login_password>"
    And I press "Login"
    Then I should <action>
    And I should be on the <page> page

  Examples:
    | email                | password | login_password | username | action                 | page    |
    | customer@example.com | secret   | badsecret      | customer | see error messages     | login   |
    | customer@example.com | secret   | secret         | customer | see "Login successful" | account |