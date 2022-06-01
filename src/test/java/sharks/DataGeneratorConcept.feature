Feature: Data Generator Concept

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization: '#("Bearer " + token)'}
    * def dataGenerator = Java.type('sharks.DataGenerator')
    * def emailValue = dataGenerator.getEmail()
    * def firstNameValue = dataGenerator.getFirstName()
    * def lastNameValue = dataGenerator.getLastName()
    * def titleValue = dataGenerator.getTitle()

  @Test
  Scenario: Test DataGeneratorSetup
    Given path 'api/accounts/add-primary-account'
    When request
      """
      {
      "email": "#(emailValue)",
      "title": "#(titleValue)",
      "firstName": "#(firstNameValue)",
      "lastName": "#(lastNameValue)",
      "gender": "MALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Student",
      "dateOfBirth": "01/01/1987"
      }
      """
    And method post
    Then status 201
    * print response
