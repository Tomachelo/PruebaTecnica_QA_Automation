@feature_api_categories
Feature: Validacion APIs categorias PlatziFake

  Background:
    * url baseUrl
    * def categorySchema = read('classpath:schemas/categorySchema.json')
    * def categoryData = read('classpath:data/categoryData.json')

  @api_get_all_categories
  Scenario: Obtener la lista de categorias
    Given path 'categories'
    When method get
    Then status 200
    And match response == '#[]'
    And match each response contains categorySchema

  @api_get_category_by_id
  Scenario: Obtener una categoria por id
    Given path 'categories', 1
    When method get
    Then status 200
    And match response.id == 1
    And match response.id == 1
    And match response.name == '#string'
    And match response.image == '#string'

  @api_post_put_delete_category
  Scenario: Flujo de creacion, actualizacion y eliminacion de categoria
    Given path 'categories'
    And request categoryData
    When method post
    Then status 201
    * def categoryId = response.id
    * def categoryName = response.name

    * def bodyRequest = categoryData
    * set bodyRequest.id = categoryId
    * set bodyRequest.name = categoryName + ' actualizada'

    Given path 'categories', categoryId
    And request bodyRequest
    When method put
    Then status 200
    And match response.id == categoryId
    And match response.name == categoryName + ' actualizada'

    Given path 'categories', categoryId
    When method delete
    Then status 200 || status 204

    Given path 'categories', categoryId
    When method get
    Then status 400

  @api_get_negative_category_non-existent
  Scenario: Obtener una categoria no existente
    Given path 'categories', 100000000
    When method get
    Then status 400
    And match response.name == 'EntityNotFoundError'