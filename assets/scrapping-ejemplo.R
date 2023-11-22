# Este es un script de prueba
rm(list = ls()) # limpiamos el entorno
getwd() #obtenemos nuestra ubicación


install.packages("tidyverse")
install.packages("rvest")
install.packages("stringr")
library(tidyverse)
library(rvest)
library(stringr)
base_url <- "https://listado.mercadolibre.com.ar/alimentos-bebidas/almacen/canastas-basicas/canasta-navide%C3%B1a_Discount_5-100_NoIndex_True#applied_filter_id%3Ddiscount%26applied_filter_name%3DDescuentos%26applied_filter_order%3D12%26applied_value_id%3D5-100%26applied_value_name%3DDesde+5%25+OFF%26applied_value_order%3D1%26applied_value_results%3D42%26is_custom%3Dfalse"
webpage <- read_html(base_url)
cajass <- html_nodes(webpage, ".ui-search-item__title")
cajass <- as.character(html_text(cajass))
cajass

cajas_precio<- html_nodes(webpage, ".andes-money-amount__currency-symbol")
cajas_precio <- as.character(html_text(cajas_precio[1:length(cajass)]))
cajas_precio

cajas_valor <- html_nodes(webpage, ".andes-money-amount__fraction")
cajas_valor <- as.character(html_text(cajas_valor[1:length(cajass)]))
cajas_valor

listado_navidad <- data.frame(Caja = cajass, Moneda = cajas_precio, Precio = cajas_valor)


# otra forma

library(rvest) #
library(httr)


link = "https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes"
page = read_html(link)

# Selecting all elements using CSS
all_elements_css <- page %>% html_elements(css = "*")

# Selecting all elements using XPath
all_elements_xpath <- page %>% html_elements(xpath = "//*")

# Seleccionar el elemento HTML de la tabla
htmlElement <- page %>% html_node("table.sortable")

# Obtener la tabla como un data frame
df <- html_table(htmlElement, header = FALSE)

# Asegurarse de que df sea un data frame y no una lista
df <- as.data.frame(df)

# Establecer nombres de columnas a partir de la segunda fila
names(df) <- df[2,]

# Eliminar las primeras dos filas
df <- df[-c(1, 2), ]

# Visualizar el data frame
View(df)
#Exporting data frame to a CSV file

write.csv(df, "iso_codes.csv")
