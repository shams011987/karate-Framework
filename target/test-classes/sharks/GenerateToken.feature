Feature: Generate Token
@Test
  Scenario: Token Generator method
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    And path 'api/token'
    When request {"username": "admin","password": "admin"}
    And method post
    Then status 200
    And print response
    * def token = response.token
