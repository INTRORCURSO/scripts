#############################################################################
#############################################################################
#############################################################################
#############################################################################
#############################################################################
#############################################################################
#############################################################################
#############################################################################

##############################
# Borrar todo el workspace
##############################

rm(list=ls())
gc()

##############################
# Directorio de trabajo
##############################

setwd("C:\\Users\\Profesor\\Desktop\\proyecto1")

##############################
# Importo la base de datos
##############################

library("openxlsx")

datos <- read.xlsx(xlsxFile="datos/datos.curso1.xlsx",sheet=1)

##############################
# Checks
##############################

ls()
class(datos)
dim(datos)
str(datos)
head(datos)
tail(datos)

datos[c(1:6),c(1,4,5,6)]

# Comprobacion de repetidos

length(datos$"ID")
length(unique(datos$"ID"))

# Comprobacion de cada variable

range(datos$"edad")
sum(is.na(datos$"edad"))

table(datos$"estado.civil",exclude=NULL)


# OTROS CHECKS CON OTRAS FUNCIONES (nchar, intersects, recodificaciones....)

# Cambio de tipo de variable

class(datos$"estado.civil")
datos$"estado.civil"<-as.factor(datos$"estado.civil")
class(datos$"estado.civil")

# Recodificacion nivel de estudios

class(datos$"nivel.estudios")
sum(is.na(datos$"nivel.estudios"))
table(datos$"nivel.estudios",exclude=NULL)
datos$"nivel.estudios"[datos$"nivel.estudios"=="Bajo"]<-"Basico"
table(datos$"nivel.estudios",exclude=NULL)


##############################
# ANALISIS
##############################


# 1. Tabla de frecuencia de estado civil por sexo

table(datos$"sexo",exclude=NULL)

hombres <- datos[datos$"sexo"=="Hombre" & datos$"nivel.estudios"=="Basico",]
dim(hombres)

mujeres <- datos[datos$"sexo"=="Mujer",]
dim(mujeres)

table(datos$"estado.civil",exclude=NULL)

table(hombres$"estado.civil")

table(mujeres$"estado.civil")

table(hombres$"estado.civil")/dim(hombres)[1]*100
table(mujeres$"estado.civil")/dim(mujeres)[1]*100

# Funcion para hacerlo directamente
prop.table(table(hombres$"estado.civil"))


# 2. Inserto una variable nueva en los datos

datos$fin <- rep("AL FIN",200)



#####################################
# EXPORTAMOS LA NUEVA BASE DE DATOS
#####################################

write.xlsx(datos,"resultados/nueva.base.datos.xlsx")






























#############################################################################
#############################################################################
#############################################################################
#############################################################################
#############################################################################
#############################################################################
#############################################################################
#############################################################################
