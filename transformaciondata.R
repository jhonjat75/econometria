# Instalar las bibliotecas necesarias
rm(list = ls())
# Cargar los datos desde el archivo Excel
datos <- read_excel("datos.xlsx")
# print(unique(datos$ocupacion))
# print(unique(datos$genero))
datos$ocupacion <- as.factor(datos$ocupacion)
datos$genero <- as.factor(datos$genero)

# Crear variables dummy para 'ocupacion'
# Se excluye la primera columna para evitar la multicolinealidad
ocupacion_dummies <- model.matrix(~ ocupacion - 1, data = datos)

# Crear una variable dummy para 'genero', usando 'Masculino' como la categoría de referencia
# Esto creará una columna donde 'Femenino' es 1 y 'Masculino' es 0
datos$genero_dummy <- ifelse(datos$genero == "Femenino", 1, 0)

# Ajustar la columna 'presupuesto' para asegurar que todos los valores sean positivos
min_presupuesto <- min(datos$presupuesto, na.rm = TRUE)

# Solo ajustar si hay valores menores o iguales a cero
if (min_presupuesto <= 0) {
  ajuste <- abs(min_presupuesto) + 1
  datos$presupuesto <- datos$presupuesto + ajuste
}

# Ajustar la columna 'libros_anio' para asegurar que todos los valores sean positivos
min_libros_anio <- min(datos$libros_anio, na.rm = TRUE)

# Solo ajustar si hay valores menores o iguales a cero
if (min_libros_anio <= 0) {
  ajuste <- abs(min_libros_anio) + 1
  datos$libros_anio <- datos$libros_anio + ajuste
}

# Ahora une las nuevas columnas de variables dummy al dataframe original
# y selecciona solo las columnas que quieres incluir en el modelo final
datos_arreglados <- cbind(datos[, c("edad", "estrato", "libros_anio", "presupuesto")], 
                     ocupacion_dummies, genero_dummy = datos$genero_dummy)

# Muestra las primeras filas del nuevo conjunto de datos para verificar
head(datos_arreglados)
summary(datos_arreglados)
