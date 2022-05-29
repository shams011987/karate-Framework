Feature: Post Request Concepts

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization: '#("Bearer " + token)'}

  @postMethod
  Scenario: Add Account Test
    Given path 'api/accounts/add-account'
    When request
      """
      {
      "primaryPerson": {
      "email": "shaiq123@tekschool.us",
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
    * print response
    * def state = response.primaryPersonMailingAddresses.state
    * print state
    * def phoneNumber = response.primaryPersonPhones.phoneNumber
    * print phoneNumber

  @postPrimaryAccount
  Scenario Outline: Add primary person Test
    Given path 'api/accounts/add-primary-account'
    When request
      """
      {
      "email": <emailValue>,
      "title": <titleValue>,
      "firstName": <firstNameValue>,
      "lastName": <lastNameValue>,
      "gender": <genderValue>,
      "maritalStatus": <maritalStatusValue>,
      "employmentStatus": <employmentStatusValue>,
      "dateOfBirth": <dateOfBirthValue>
      }
      """
    And method post
    Then status 201
    * print response

    Examples: 
      | emailValue         | titleValue | firstNameValue | lastNameValue | genderValue | maritalStatusValue | employmentStatusValue | dateOfBirthValue |
      | 'alex@gmail.com'   | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex1@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex2@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex3@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex4@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex5@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex6@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex7@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex8@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex9@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex0@gmail.com'  | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex11@gmail.com' | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex12@gmail.com' | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex13@gmail.com' | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex14@gmail.com' | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
      | 'alex15@gmail.com' | 'Mr'       | 'John'         | 'Whick'       | 'MALE'      | 'MARRIED'          | 'employed'            | '01/01/2000'     |
