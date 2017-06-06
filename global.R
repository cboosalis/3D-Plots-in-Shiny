library(shiny)
library(rglwidget)
library(markdown)
library(ggplot2)
library(dplyr)
library(rgl)
library(rglwidget)
library("plot3Drgl")
library(googleVis)
library(shinyjs)


DATA = read.csv("3D-PLOT-DATA1.csv", header=TRUE)
DATA1 <- read.csv("sample-data2.csv", stringsAsFactors = FALSE)
DATA3 <- read.csv("university-assessment-data.csv", stringsAsFactors = FALSE)
DATA4 <- read.csv("tpe-data.csv", stringsAsFactors = FALSE)

boosalis1 <- "Boosalis, C.N. (2016, May). Plotting direct and indirect measures of student achievement and perception in two and three dimensions using r. Pacific Conference on Statistical Computing and Data Mining, Palm Springs, California."
#enableBookmarking(store = "url")
#Credit to the following blogs:
#Dean Attali: http://deanattali.com/blog/building-shiny-apps-tutorial/
#Hernán Resnizky: https://hernanresnizky.com/
#Thank you! Chris Boosalis
#http://bootswatch.com/