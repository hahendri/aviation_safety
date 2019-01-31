setwd("C:/Users/harla/Desktop/Kaggle/Competitions/aviation_safety")

# Set libraries
library(tidyverse)
library(caret)

## create data file and download data files
if (!file.exists("data")){
      dir.create("data")  
}      

# Download data from "https://www.kaggle.com/c/reducing-commercial-aviation-fatalities/download/train.csv"
# and "https://www.kaggle.com/c/reducing-commercial-aviation-fatalities/download/test.csv"
# Unzip files into ./data file

train_data_raw <- read.csv(file = "./data/train.csv")
test_data_raw <- read.csv(file = "./data/test.csv")

# Split train data into train and validation
set.seed(1234)
train_part <- createDataPartition(y = train_data_raw$event, p = 0.80, list = FALSE)
train_data <- train_data_raw[train_part, ]
valid_data <- train_data_raw[-train_part, ]