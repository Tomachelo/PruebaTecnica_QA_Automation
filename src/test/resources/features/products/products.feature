@feature_api_products
Feature: Validacion APIs productos PlatziFake

  Background:
    * url baseUrl
    * def productSchema = read('classpath:schemas/productSchema.json')
    * def productData = read('classpath:data/productData.json')

  @api_get_all_products
  Scenario: Obtener toda la lista de productos
    Given path 'products'
    When method get
    Then status 200
    And match response == '#[]'
    And match response[0] contains productSchema

  @api_get_product_by_id
  Scenario: Obtener un producto por id
    Given path 'products', 1
    When method get
    Then status 200
    And match response.id == 1
    And match response contains productSchema

  @api_post_put_delete_product
  Scenario: Flujo de creacion, actualizacion y eliminacion de producto
    Given path 'products'
    And request productData
    When method post
    Then status 201
    * def productId = response.id
    * def productTitle = response.title

    * def bodyRequest = productData
    * set bodyRequest.id = productId
    * set bodyRequest.title = productTitle + ' actualizado'

    Given path 'products', productId
    And request bodyRequest
    When method put
    Then status 200
    And match response.id == productId
    And match response.title == productTitle + ' actualizado'

    Given path 'products', productId
    When method delete
    Then status 200 || status 204

  @api_get_negative_product_non-existent
  Scenario: Obtener un producto no existente
    Given path 'products', 100000000
    When method get
    Then status 400
    And match response.name == 'EntityNotFoundError'