library(sqldf)
require(data.table)
library(dplyr)
library(DT)

## Loading data
arquivo <- read.table("players2014fifa.csv", sep = ';', head = T)

## Exploring the dataset
sum(is.na(arquivo)) # 0
length(unique(arquivo$ID)) # 736
arquivo$DateOfBirth <- as.Date(arquivo$DateOfBirth, "%d/%m/%Y")
summary(arquivo)
table(arquivo$Goals) # 0 - 68
length(table(arquivo$Goals)) # 44
goals <- sort(unique(arquivo$Goals))
length(table(arquivo$Country)) # 101
countries <- sort(unique(arquivo$Country))

## Helper functions

## Filter by # of Goals
selecionaGols <- function(tbl, minGoal, maxGoal) {
        result <- fn$sqldf("
                SELECT *
                FROM arquivo
                WHERE Goals >= $minGoal 
                AND Goals <= $maxGoal")

        result <- datatable(result, options = list(iDisplayLength = 50))
        return(result)
}