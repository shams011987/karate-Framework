Feature: Insurance API Automation

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token

  @getAccount @GetFeature
  Scenario: GetAccount
    Given headers  {Authorization: '#("Bearer " + token)'}
    * path 'api/accounts/get-account'
    * param primaryPersonId = 500
    When method get
    Then status 200
    And print response

  @getAllAccounts
  Scenario: Get All Accounts
    Given headers {Authorization: '#("Bearer " + token)'}
    * path 'api/accounts/get-all-accounts'
    When method get
    Then status 200
    And print response

   # get primary account API
  @getPrimaryAccount @GetFeature
  Scenario Outline: Get Primary Account
    Given headers {Authorization: '#("Bearer " + token)'}
    * path 'api/accounts/get-primary-account'
    * param primaryPersonId = <idValue>
    When method get
    Then status 200
    And print response
    * def id = response.id
    * match id == <idValue>
    * def email = response.email
    * match email contains <emailContains>

    Examples: 
      | idValue | emailContains |
      |     499 | '@gmail.us'   |
      |     500 | '@mail.net'   |
      |     501 | '@yandex.us'  |
