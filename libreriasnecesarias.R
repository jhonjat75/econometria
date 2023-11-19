# Verifica si el paquete MASS está instalado y cárgalo, de lo contrario, instálalo y luego cárgalo
# MASS: Contiene funciones y datasets para soporte del libro "Modern Applied Statistics with S"
if (!require("MASS", character.only = TRUE)) {
  install.packages("MASS")
  library(MASS)
}

# Verifica si el paquete psych está instalado y cárgalo, de lo contrario, instálalo y luego cárgalo
# psych: Provee procedimientos para análisis psicométricos incluyendo pruebas de normalidad y matrices de correlación
if (!require("psych", character.only = TRUE)) {
  install.packages("psych")
  library(psych)
}

# Verifica si el paquete moments está instalado y cárgalo, de lo contrario, instálalo y luego cárgalo
# moments: Permite calcular momentos estadísticos como asimetría y curtosis
if (!require("moments", character.only = TRUE)) {
  install.packages("moments")
  library(moments)
}

# Verifica si el paquete lmtest está instalado y cárgalo, de lo contrario, instálalo y luego cárgalo
# lmtest: Ofrece pruebas de especificación de modelos lineales, incluyendo la prueba de Breusch-Pagan
if (!require("lmtest", character.only = TRUE)) {
  install.packages("lmtest")
  library(lmtest)
}

# Verifica si el paquete 'readxl' está instalado y cárgalo, de lo contrario, instálalo y luego cárgalo
# readxl: Facilita la lectura de archivos Excel en R
if (!require("readxl", character.only = TRUE)) {
  install.packages("readxl")
  library(readxl)
}

# Verifica si el paquete 'dplyr' está instalado y cárgalo, de lo contrario, instálalo y luego cárgalo
# dplyr: Herramienta para la transformación de datos con un gran rendimiento y facilidad de uso
if (!require("dplyr", character.only = TRUE)) {
  install.packages("dplyr")
  library(dplyr)
}

# Verifica si el paquete 'caret' está instalado y cárgalo, de lo contrario, instálalo y luego cárgalo
# caret: Conjunto de funciones que ayudan a la creación de modelos predictivos y a la evaluación de su rendimiento
if (!require("caret", character.only = TRUE)) {
  install.packages("caret")
  library(caret)
}

# Verifica si el paquete 'car' está instalado y cárgalo, de lo contrario, instálalo y luego cárgalo
# car: Complemento para Análisis de Regresión Aplicada
if (!require("car", character.only = TRUE)) {
  install.packages("car")
  library(car)
}

# Instalar el paquete 'tseries' si aún no está instalado y cargarlo
if (!require("tseries", character.only = TRUE)) {
  install.packages("tseries")
  library(tseries)
}

