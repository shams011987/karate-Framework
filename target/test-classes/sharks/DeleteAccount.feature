Feature: Delete Request Concepts

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization: '#("Bearer " + token)'}

  @deleteAccount
  Scenario: Delete user Test
    Given path 'api/accounts/delete-account'
    And param primaryPersonId = 45
    And method delete
    Then status 200
    * print response
    * def message = response
    * match message == 'Account Successfully deleted'
