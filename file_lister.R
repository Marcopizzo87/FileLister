#####################################################
#              File lister from shapefile           #
#                                                   #  
#                November 22th 2018                 #
#                 Marco Pizzolato                   #
#####################################################



# Set WD

setwd("N:/PROGRAMMES new/GIZ DRC 2017 - Maniema Mapping and LUP/Activities/Products/Marco_Data_processing/5_Data_jan2019_field")

# Check the wd
getwd()

# Clean the environment
rm(list = ls())

list.files(path = ".", pattern = "\\.shp$", recursive = TRUE)

dir_list <- list.dirs('.')

for (i in dir_list){
  if (grepl("*shp$", i)){
    a <- list.files(path = i, pattern = "\\.shp$", recursive = TRUE)
    print(i)
    print(a)
  }
} 
