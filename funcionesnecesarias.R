generate_combinations <- function(transformations, vars, dicotomicas_vars) {
  # Crear todas las combinaciones posibles de transformaciones para las variables no dicotómicas
  combinations <- expand.grid(rep(list(transformations), length(vars)))
  
  # Añadir la transformación "none" para las variables dicotómicas
  for (var in dicotomicas_vars) {
    combinations[[var]] <- "none"
  }
  
  return(combinations)
}



############################################################################
###########    Transforamation ############################################
###########################################################################

# Función para aplicar la transformación adecuada a una columna
apply_transformation <- function(data, column, transformation) {
  if (transformation == "log") {
    return(log(data[[column]]))
  } else if (transformation == "inverse") {
    return(1 / data[[column]])
  } else if (transformation == "sqrt") {
    return(sqrt(data[[column]]))
  } else if (transformation == "square") {
    return(data[[column]]^2)
  } else if (transformation == "cube") {
    return(data[[column]]^3)
  } else if (transformation == "reciprocal_squared") {
    return(1 / (data[[column]]^2))
  } else if (transformation == "cbrt") {
    return(data[[column]]^(1/3))
  } else if (transformation == "arcsine") {
    return(asin(sqrt(data[[column]])))
  } else if (transformation == "standardize") {
    return((data[[column]] - mean(data[[column]], na.rm = TRUE)) / sd(data[[column]], na.rm = TRUE))
  } else if (transformation == "normalize") {
    return((data[[column]] - min(data[[column]], na.rm = TRUE)) / (max(data[[column]], na.rm = TRUE) - min(data[[column]], na.rm = TRUE)))
  } else { # "none" o cualquier otro caso
    return(data[[column]])
  }
}

# Función para ajustar un modelo lineal robusto con una combinación específica de transformaciones
generate_model <- function(data_original, array_transformation, vars, dicotomicas_vars) {
  # Aplicar las transformaciones a los datos
  transformed_data <- data_original
  for (j in seq_along(vars)) {
    if (vars[j] %in% dicotomicas_vars) {
      next # No aplicar transformaciones a las variables dicotómicas
    } else {
      transformed_data[[vars[j]]] <- apply_transformation(data_original, vars[j], array_transformation[j])
    }
  }
  
  # Crear la fórmula del modelo, asumiendo que la primera variable en vars es la dependiente
  independent_vars <- c(vars[-1], dicotomicas_vars) # Excluir la variable dependiente
  formula <- as.formula(paste(vars[1], "~", paste(independent_vars, collapse = " + ")))
  # Ajustar el modelo rlm
  model <- rlm(formula, data = transformed_data)
  return(model)
}

# Ejemplo de uso de la función generate_model
# Supongamos que tienes un dataframe 'data_original' con todas las variables requeridas
# data_original <- tu_dataframe_aquí
# array_transformation <- c("none", "log", "sqrt", "none") # Por ejemplo
# vars <- c("variable_dependiente", "var1", "var2", "var3")
# dicotomicas_vars <- c("genero_dummy")

# Ajustar un modelo con la combinación específica de transformaciones
# model <- generate_model(data_original, array_transformation, vars, dicotomicas_vars)

# Imprimir el resumen del modelo
# print(summary(model))

