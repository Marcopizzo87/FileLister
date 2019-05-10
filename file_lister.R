
####-->  FILE LISTING
####-->  List al the files in a folder & subfolders
####-->  February 2019                    
####-->  by Marco Pizzolato                   


####  SHORT DESCRIPTION ----

# Given a specific folder path and file extension the script loops through 
# the folder (including subfolders) looking for all files with a specific extension.
# Inputs: (1) Path to the folder to scan (2) Extension to search.
# Outputs: (1) .pdf report in the target folder (2) .csv report in the target folder.

# Clean the environment if you need to do so
# rm(list = ls())

#### LIBRARIES ----

library(knitr) # creates table in Rmd file
library(stringr) # use to cut the string with a pattern


####  SET THESE PARAMETERS ----

# EXTENSION you want to find
EXTENSION <- ("pdf") # replace ".shp" with the extension you want (es: .pdf,.jpg)

# Target FOLDER
PATH_DEST <- ("D:/Desktop/../..") # Replace with the folder you want to scan (the scrip scans also the sub-folders)
  

####  SCRIPT ----

# Set WD automatically to where the R scrip is
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# Check the wd
getwd()

extension <- as.character(EXTENSION)

# Complete list of files (if you want to see it) 
# list.files(path = PATH_DEST, pattern = (paste("\\.",extension,"$", sep="")), recursive = TRUE)

# Complete list of directories and subdirectories 
dir_list <- list.dirs(PATH_DEST)

# (if you want to see it)
# dir_list


####  RUN FOR A QUICK RESULT IN THE CONSOLE ----

for (i in dir_list){
  a <- list.files(path = i, pattern = (paste("\\.",extension,"$", sep="")))
  if (length(a) > 0){
    print("FOLDER:")
    folder <- str_remove(i,PATH_DEST)
    print(folder)
    print("FILES:")
    print(a)
    cat("\n")
  } 
} 


###  RUN TO PRINT THE PDF REPORT ----

path_print <- as.data.frame(PATH_DEST)

rmarkdown::render( input = "./file_lister.Rmd",
                   output_format = "pdf_document",
                   output_file = paste("List_of_",EXTENSION,"_files",".pdf", sep = ""),
                   output_dir = PATH_DEST) 



###  RUN TO EXPORT THE LIST OF FILES IN EXCEL ----

list_a <- list()

for (i in dir_list){
  a <- list.files(path = i) #, pattern = (paste("\\.",extension,"$", sep="")))
  if (length(a) > 0){
    #df1[1,1] <- i
    list_a <- append(list_a,a)
  } 
} 

df.list_a <- as.data.frame(list_a) %>% gather(.)

write.csv(df.list_a, file = paste("List_of_all files",".csv", sep = ""))

## END OF SCRIPT ##
