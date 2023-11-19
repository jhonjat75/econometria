# Cargar las bibliotecas necesarias
source("libreriasnecesarias.R")
source("funcionesnecesarias.R")
source("tests.R")

# Desactivar la generación automática de gráficos
graphics.off()

# Cargar los datos si aún no están cargados
if (!exists("datos_arreglados")) {
  source("transformaciondata.R")
}

transformations <- c("none","log","square", "inverse", "sqrt", "cube", "reciprocal_squared", "cbrt", "standardize", "normalize")
# c("presupuesto", "edad", "estrato", "libros_anio")
vars <- c("presupuesto","edad", "estrato", "libros_anio")
# c("genero_dummy")
dicotomicas_vars <- c("genero_dummy")
data_original <- datos_arreglados[, c(vars, dicotomicas_vars)]
result_combinations <- generate_combinations(transformations, vars, dicotomicas_vars)
cont = 1
for (i in 1:nrow(result_combinations)) {
  combination <- combination <- sapply(result_combinations[i, ], as.character)
  model <- generate_model(data_original, combination, vars, dicotomicas_vars)
  if (test_normality(model) && test_model_significance_rlm(model) && test_homoscedasticity(model)){
    print(summary(model))
    print(combination)
    break
  }
}

test_model_significance_rlm(model)
#Autocorrelacion
dwtest(model)
#Multicolonidad
#Activar car
vif(model)