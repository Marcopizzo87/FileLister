#####################################################
#              File lister from shapefile           #
#                                                   #  
#                February 16th 2019                 #
#                 Marco Pizzolato                   #
#####################################################

###  SHORT DESCRIPTION ----

# The script loops through the shapefile in a folder and creates a report.


###  SET THESE PARAMETERS ----

# which file extension do you want to find
extension <- as.character("shp") # specify here the extension

# folder you want to scan (the scrip scans also the sub-folders)
path_dest <- ("D:/Desktop/SSD_GIS/Flood_Map")


###  SCRIPT ----

# Set WD automatically
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# Check the wd
getwd()

# Clean the environment
# rm(list = ls())


list.files(path = path_dest, pattern = (paste("\\.",extension,"$", sep="")), recursive = TRUE)


dir_list <- list.dirs(path_dest)
dir_list

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

rmarkdown::render( input = "./file_lister.Rmd",
                   output_format = "pdf_document",
                   output_file = paste("List_of_",extension,"_files",".pdf", sep = ""),
                   output_dir = path_dest) 
