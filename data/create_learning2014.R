# Rabbil Bhuiyan
# 10.11.2018
# Data wrangling practice 
# read the data
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# dimension of the data
dim(lrn14)

#structure of the data
str(lrn14)

#Output of the codes
#183 observations and 60 variables were found

##########################
# access the dplyr library
library(dplyr)

# Analysis dataset
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

# select the 'keep_columns' to create a new dataset named learning2014
learning2014 <- select(lrn14, one_of(keep_columns))

# see the structure of the new dataset
str(learning2014, points = 0)

###############################################33

### excluding of observations
# access the dplyr library
library(dplyr)

# select male students
male_students <- filter(learning2014, gender == "M")

# select rows where Points is greater than zero
learning2014 <- filter(learning2014, Points > 0)

str(learning2014, Points > 0)

############################
Scale of variables to original scale(# Access the dplyr library
  library(dplyr)
  
  # questions related to deep, surface and strategic learning
  deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
  surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
  strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
  
  # select the columns related to deep learning and create column 'deep' by averaging
  deep_columns <- select(lrn14, one_of(deep_questions))
  lrn14$deep <- rowMeans(deep_columns)
  
  # select the columns related to surface learning and create column 'surf' by averaging
  surface_columns <- select(lrn14, one_of(surface_questions))
  lrn14$surf <- rowMeans(surface_columns)
  
  # select the columns related to strategic learning and create column 'stra' by averaging
  strategic_columns <- select(lrn14, one_of(strategic_questions))
  lrn14$stra <- rowMeans(strategic_columns)

