@feature_api_filters
  Feature: Validion de filtros para la API productos PlatziFake

    Background:
      * url baseUrl
      * def productSchema = read('classpath:schemas/productSchema.json')

    @api_filter_products_by_limit
    Scenario: Filtrar productos por limite
      Given path 'products'
      And param limit = 5
      When method get
      Then status 200
      And match response == '#[]'
      * assert response.length >= 0
      And match each response contains productSchema

    @api_filter_products_by_offset
    Scenario: Filtrar productos desde un ID especifico
      Given path 'products'
      And param offset = 10
      When method get
      Then status 200
      And match response == '#[]'
      And match each response contains productSchema

    @api_filter_products_by_category
    Scenario: Filtrar productos por categoria
      Given path 'products'
      And param categoryId = 1
      When method get
      Then status 200
      And match response == '#[]'
      And match each response contains productSchema
      * def categories = get response[*].category.id
      * match each categories == 1

    @api_filter_products_by_price_range
    Scenario: Filtrar productos por rango de precio
      Given path 'products'
      And param price_min = 10
      And param price_max = 1000
      When method get
      Then status 200
      And match response == '#[]'
      And match each response contains productSchema
      * def prices = get response[*].price
      * match each prices == '#? _ >= 10'