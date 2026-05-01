@feature_api_users
Feature: Validacion APIs usuarios PlatziFake

  Background:
    * url baseUrl
    * def userSchema = read('classpath:schemas/userSchema.json')
    * def userData = read('classpath:data/userData.json')

  @api_get_all_users
  Scenario: Obtener la lista de usuarios
    Given path 'users'
    When method get
    Then status 200
    And match response == '#[]'
    And match each response contains userSchema

  @api_get_user_by_id
  Scenario: Obtener un usuario por id
    Given path 'users', 1
    When method get
    Then status 200
    And match response.id == 1
    And match response.email == '#string'
    And match response.role == '#string'

  @api_post_put_delete_user
  Scenario: Flujo de creacion, actualizacion y eliminacion de usuario
    Given path 'users'
    And request userData
    When method post
    Then status 201
    * def userId = response.id
    * def userName = response.name

    * def bodyRequest = userData
    * set bodyRequest.id = userId
    * set bodyRequest.name = userName + ' actualizado'

    Given path 'users', userId
    And request bodyRequest
    When method put
    Then status 200
    And match response.id == userId
    And match response.name == userName + ' actualizado'
    And match response.updatedAt != null

    Given path 'users', userId
    When method delete
    Then status 200 || status 204

    Given path 'users', userId
    When method get
    Then status 400

  @api_get_negative_user_non-existent
  Scenario: Obtener un usuario no existente
    Given path 'users', 100000000
    When method get
    Then status 400
    And match response.name == 'EntityNotFoundError'