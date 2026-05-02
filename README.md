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

### Ejecutar todos los test (Desde raíz del proyecto)

```bash
./gradlew test
```

### Ejecutar runner principal (Desde raíz del proyecto)

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
- a. ¿Cuáles fueron los principales desafíos que enfrentaste al implementar las funcionalidades?

Respuesta: Uno de los principales desafios fue manejar datos dinamicos para evitar dependencias entre los escenarios para que se pudiera
realizar una regresión completa de los features. Además fue necesario estructurar correctamente los casos de prueba para cubrir multiples
endpoints sin duplicar la lógica.

- b. ¿Qué técnicas de pruebas se usaron y qué enfoque se le dio a la automatización?

Respuesta: Aplique pruebas funcionales de API en base ha caja negra, validando unicamente las entradas y salidas del sistema. También
se implemente pruebas positivas y negativas, validación de códigos HTTP, validación de contratos mediante JSON y pruebas de filtros.
Todo esto asegurando estabiliad y comportamiento esperado de los servicios.

- c. ¿Cómo gestionaste la validación de datos y la verificación de la estructura de las respuestas JSON en tus pruebas automatizadas?

Respuesta: La validación de datos se hizo bajo JSON Schema para asegurar la estructura de las respuestas sea consistente, además use
archivos de datos reutilizables para parametrizar las pruebas y evitar la duplicación y el hardcode de data. Karate me permitio 
validar tipos de datos, estructuras de listas y campos obligatorios.

- d. ¿Qué aprendizajes obtuviste al desarrollar esta prueba técnica y cómo consideras que aportan a tu crecimiento profesional?

Respuesta: Me fortalecio el uso de Karate Framework para automatización de APIs y la importancia de estructuras proyectos de forma
estable, también reforce buenas prácticas como idependencia de escenarios, reutilización de componentes y validación de contratos.

---

## Autor 
Tomas Del Piero Amortegui Duarte