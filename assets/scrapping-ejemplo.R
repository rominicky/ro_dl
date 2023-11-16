rm(list = ls())

install.packages("tidyverse")
install.packages("rvest")
install.packages("stringr")
library(tidyverse)
library(rvest)
library(stringr)
base_url <- "https://listado.mercadolibre.com.ar/canasta-navide%C3%B1a#D[A:canasta%20navide%C3%B1a%20]"
webpage <- read_html(base_url)
cajass <- html_nodes(webpage, ".ui-search-item__title")
cajass <- as.character(html_text(cajass))
cajass

cajass<- html_nodes(webpage, ".price-tag-symbol")
cajass <- as.character(html_text(cajass))
cajass

cajass <- html_nodes(webpage, ".price-tag-fraction")
cajass <- as.character(html_text(cajass))
cajass

# otra forma

library(rvest)
library(httr)


link = "https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes"
page = read_html(link)

#Parsing HTML Content

page %>% html_elements(css="", )
page %>% html_elements(xpath="")

#for above page, use the following:
  
  htmlElement <- page %>% html_element("table.sortable")

#Saving data to a data frame

df <- html_table(htmlElement, header = FALSE)
names(df) <- df[2,]
df = df[-1:-2,]

#Exporting data frame to a CSV file

write.csv(df, "iso_codes.csv")


#Scrape Dynamic Pages with Rvest

#Find the API endpoint and use that as following:
  
page <- session(link,timeout(10)) #Method 2
