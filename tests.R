test_normality <- function(model){
  err = residuals(model)
  jb_result <- jarque.test(err)
  #jb_result$statistic < 5.99 &&
  if( jb_result$p.value > 0.001){
    #La prueba de Jarque-Bera indica que los residuos tienen una distribución normal. Pasa!!!
    return(TRUE)
  } else {
    #La prueba de Jarque-Bera indica que los residuos NO tienen una distribución normal. No pasa!!!
    return(FALSE)
  }
}

test_homoscedasticity <- function(model){
  # Obtiene los grados de libertad del modelo. Por lo general, es el número de términos independientes.
  df <- length(coef(model)) - 1
  # Calcula el valor crítico de chi-cuadrado para los grados de libertad y un nivel de significancia de 0.025
  critical_value <- qchisq(0.975, 2)
  bp_result <- bptest(model)
  if(bp_result$statistic < critical_value && bp_result$p.value > 0.05){
    #La prueba de Breusch-Pagan indica homocedasticidad en los residuos. Pasa!!!
    return(TRUE)
  } else {
    #La prueba de Breusch-Pagan indica heterocedasticidad en los residuos. No pasa!!!
    return(FALSE)
  }
}

test_spearman <- function(variable1, variable2, threshold = 0.05) {
  # Calcula la correlación de Spearman entre dos variables
  test_result <- cor.test(variable1, variable2, method = "spearman")
  
  # Verifica si el valor p es menor que el umbral para decidir si "pasa" el test
  if(test_result$p.value < threshold) {
    return(TRUE)  # Pasa el test
  } else {
    return(FALSE)  # No pasa el test
  }
}

test_coefficient_significance <- function(model, threshold = 0.05) {
  # Extrae el resumen del modelo para obtener los valores p de los coeficientes
  summary_model <- summary(model)
  
  # Si estás seguro de que 'Pr(>|t|)' es el nombre correcto, esto no debería causar un error
  # Si el error persiste, usa 'names(summary_model$coefficients)' para encontrar el nombre correcto
  if(!"Pr(>|t|)" %in% names(summary_model$coefficients)) {
    stop("La columna 'Pr(>|t|)' no se encuentra en el resumen del modelo. Verifica los nombres de las columnas.")
  }
  
  # Obtiene los valores p de los coeficientes, maneja NAs si es necesario
  p_values <- summary_model$coefficients[, "Pr(>|t|)", drop = FALSE]
  if (any(is.na(p_values))) {
    warning("Hay valores NA en los p-values del modelo.")
  }
  
  # Verifica si cada coeficiente es significativo comparando con el umbral
  significant <- p_values < threshold
  
  # Retorna un vector lógico indicando la significancia de cada coeficiente
  return(significant)
}

test_model_significance_rlm <- function(model, threshold = 0.05) {
  # Obtiene el resumen del modelo
  model_summary <- summary(model)
  
  # Extrae los t-estadísticos de los coeficientes
  t_values <- model_summary$coefficients[-1, "t value"]  # Excluye el intercepto si es necesario
  
  # Calcula la estadística de Wald, que sigue aproximadamente una distribución chi-cuadrado
  wald_statistic <- sum(t_values^2)
  
  # Los grados de libertad son igual al número de t-estadísticos utilizados
  df <- length(t_values)
  
  # Calcula el p-valor comparando la estadística de Wald con la distribución chi-cuadrado
  p_value <- pchisq(wald_statistic, df, lower.tail = FALSE)
  
  cat("Estadística de Wald:", wald_statistic, "\n", "p-valor:", p_value, "\n")
  
  # Verifica si el p-valor es menor que el umbral de significancia
  return(p_value < threshold)
}






