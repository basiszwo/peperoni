Feature: login for backend user
  In order to use peperoni
  as a backend user / customer
  I should be able to log in
      
  Scenario Outline:
    Given the following role records
      | name          |
      | backend_user |
    And the following backend_user records
      | username   | email   | password   |
      | <username> | <email> | <password> |
    And I am on the login page
    When I fill in "Email" with "<email>"
    And I fill in "Password" with "<login_password>"
    And I press "Login"
    Then I should <action>
    And I should be on the <page> page

  Examples:
    | email             | password | login_password | username | action                 | page       |
    | admin@example.com | secret   | badsecret      | admin    | see error messages     | new login  |
    | admin@example.com | secret   | secret         | admin    | see "Login successful" | admin root |