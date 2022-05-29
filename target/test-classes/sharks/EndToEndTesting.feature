@E2E
Feature: End to End Testing

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization: '#("Bearer " + token)'}

  Scenario: Add Account Test
    Given path 'api/accounts/add-account'
    When request
      """
      {
      "primaryPerson": {
      "email": "hyx1115523@tekschool.us",
      "title": "Mr.",
      "firstName": "shaiq",
      "lastName": "darwish",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "employed",
      "dateOfBirth": "01/01/1990"
      },
      "primaryPersonMailingAddress": {
      "addressType": "Home",
      "addressLine1": "123 Main St",
      "city": "Tysons",
      "state": "VA",
      "postalCode": "22122",
      "countryCode": "001"
      },
      "primaryPersonPhone": {
      "phoneNumber": "2021013344",
      "phoneExtension": "123",
      "phoneTime": "morning",
      "phoneType": "cell"
      }
      }
      """
    And method post
    Then status 201
    * def responseID = response.primaryPerson.id
    * headers {Authorization: '#("Bearer " + token)'}
    * path 'api/accounts/get-account'
    * param primaryPersonId = responseID
    When method get
    Then status 200
    And print response
    * headers {Authorization: '#("Bearer " + token)'}
    Given path 'api/accounts/delete-account'
    And param primaryPersonId = responseID
    And method delete
    Then status 200
    * print response
    * def message = response
    * match message == 'Account Successfully deleted'
