# Análisis Económico de Chapinero, Bogotá con R

Este repositorio contiene el trabajo de análisis de datos para la localidad de Chapinero en Bogotá. Utilizamos modelos de minimos cuadrados ordinarios y aplicamos varias pruebas estadísticas para asegurar la validez de los modelos.

## Archivos en el Repositorio

- `buscandoelmodelo.R`: Scripts para la selección preliminar de modelos estadísticos.
- `creandomodelo.R`: Scripts utilizados para crear el modelo de regresión lineal múltiple.
- `datos.xlsx`: Datos recopilados para la localidad de Chapinero en Bogotá.
- `funcionesnecesarias.R`: Funciones personalizadas utilizadas en el análisis.
- `libreriasnecesarias.R`: Librerías de R necesarias para ejecutar los scripts.
- `tests.R`: Scripts para realizar tests de normalidad, homocedasticidad, autorrelación, multicolinealidad y endogenidad.
- `transformaciondata.R`: Scripts para la transformación y limpieza de los datos.

## Metodología

El análisis se realiza en varias etapas:

1. **Preparación de Datos**: Los datos son limpiados y transformados para su uso en el modelo.
2. **Modelado**: Se aplica MCO para entender las relaciones entre las variables.
3. **Validación del Modelo**:
   - **Normalidad**: Pruebas de Shapiro-Wilk para evaluar la distribución de los residuos.
   - **Homocedasticidad**: Prueba de Breusch-Pagan para verificar la varianza constante de los residuos.
   - **Autocorrelación**: Prueba de Durbin-Watson para detectar la presencia de autocorrelación en los residuos.
   - **Multicolinealidad**: Factor de inflación de la varianza (VIF) para identificar multicolinealidad entre predictores.
   - **Endogenidad**: Se utilizan instrumentos para controlar la endogenidad potencial en el modelo.

## Cómo Usar

Para replicar el análisis, clona este repositorio y ejecuta los scripts en el orden presentado arriba. Asegúrate de tener instaladas todas las librerías necesarias listadas en `libreriasnecesarias.R`.

## Contribuciones

Si tienes sugerencias o mejoras para el análisis, no dudes en abrir un 'issue' o hacer un 'pull request'.

## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo `LICENSE.md` para más detalles.

## Contacto

Si tienes alguna pregunta, puedes contactarme en [jhon-torres2@upc.com].

---

> Este `README.md` es un documento vivo y se actualizará a medida que avance el proyecto.
