setwd("Z:/USER/Axel/Fortbildung/Data Analyst/R/50 Course/040 Exploratory Data Analysis/week 4/20 Programme/Project2")

filename <- "daten.zip"

## Download the dataset if it does not already exist in the working directory ################################################

## Check if file exits, if not download it

if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileURL, filename)
}  

## Check if files unziped, if not, unzip

if (!file.exists("Source_Classification_Code.rds"))  { 
    
# Unzip all files
    
    unzip(filename) 
    
} else {filename}
