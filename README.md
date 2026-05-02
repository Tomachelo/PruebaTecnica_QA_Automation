# QA Automation Backend - API Testing Karate Framework

## Descripción del proyecto

Este proyecto para la prueba técnica implementa pruebas automatizadas de APIs rest utilizando **Karate Framework**
y **Gradle**. Se valida el comportamiento de la API pública Platzi Fake, realizando pruebas CRUD completas validación
de esquema y filtros.

---

## Tecnologías utilizadas
- Java
- Karate v1.5.2
- Gradle
- JUnit 5

---

## Estructura del proyecto
- src
  - test
    - java
      - runners
    - resources
      - data
      - features
        - categories
        - filters
        - products
        - users
      - schemas

---

## Como ejecutar el proyecto

### Ejecutar todos los test

```bash
./gradlew test
```

### Ejecutar runner principal

```bash
./gradlew test --tests runners.GeneralRunner
```

---

## Casos de prueba implementados

### Products
- Obtener lista de productos
- Obtener producto por Id
- Crear producto
- Actualizar producto
- Eliminar producto
- Validación de producto no existente

### Categories
- Obtener lista de categorías
- Obtener categoría por Id
- Crear categoría
- Actualizar categoría
- Eliminar categoría
- Validación de categoría no existente

### Users
- Obtener lista de usuarios
- Obtener usuario por Id
- Crear usuario
- Actualizar usuario
- Eliminar usuario
- Validación de usuario no existente

### Filters
- Filtrar productos por limit
- Filtrar productos por offset
- Filtrar productos por categoria
- Filtrar productos por rango de precio

### Validaciones implementadas
- Validación de status codes (200, 201, 204, 400)
- Validación de estructura JSON
- Validación de tipo de datos
- Validación de listas (#[])
- Validación de campos obligatorios
- Validación de filtros (Query Params)

### Reportes 
El reporte HTML se genera en:
```bash
build/karate-reports/karate-summary.html
```

---

## Entregable preguntas

---

## Autor 
Tomas Del Piero Amortegui Duarte