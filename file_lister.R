#####################################################
#              File lister from shapefile           #
#                                                   #  
#                February 16th 2019                 #
#                 Marco Pizzolato                   #
#####################################################

###  SHORT DESCRIPTION ----

# The script loops through the shapefile in a folder and creates a report.

# Clean the environment if you need to do so

# rm(list = ls())


library(knitr) # create table in Rmd file
library(stringr)

###  SET THESE PARAMETERS ----

# Write here the EXTENSION you want to find
EXTENSION <- ("shp")

# folder you want to scan (the scrip scans also the sub-folders)
PATH_DEST <- ("N:/PROGRAMMES new/GIZ DRC 2017 - Maniema Mapping and LUP/Activities/Products/2019-01 Data_field_jan/Village_Bafundo_PAT")
  

###  SCRIPT ----

# Set WD automatically
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# Check the wd
getwd()


extension <- as.character(EXTENSION)

list.files(path = PATH_DEST, pattern = (paste("\\.",extension,"$", sep="")), recursive = TRUE)


dir_list <- list.dirs(PATH_DEST)
dir_list

df1 <- data.frame(stringsAsFactors=FALSE)
list_a <- list()

for (i in dir_list){
  a <- list.files(path = i, pattern = "\\.shp$")
  if (length(a) > 0){
    df1[1,1] <- i
    list_a <- a
  } 
} 


for (i in dir_list){
    a <- list.files(path = i, pattern = "\\.shp$")
    if (length(a) > 0){
      print("FOLDER:")
      print(i)
      print("FILES:")
      print(a)
    } 
  } 

###  PRINT THE PDF ----

path_print <- as.data.frame(PATH_DEST)

rmarkdown::render( input = "./file_lister.Rmd",
                   output_format = "pdf_document",
                   output_file = paste("List_of_",EXTENSION,"_files",".pdf", sep = ""),
                   output_dir = PATH_DEST) 
