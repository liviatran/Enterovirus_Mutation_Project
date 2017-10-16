#This is the practice data we can use as reference
PracticeData <- read.csv("OverviewSelCoeff_BachelerFilter.csv")

#Call the seqinr library to load functions
library(seqinr)

#Here we load in our enterovirus data
enterovirus_data <- read.fasta("EnterovirusA_VP1.fasta_pruned.mu.trim05")

#This is a new variable so we can create an empty data frame with 891 rows
num<-c(1:891)

#We create the data frame
Enterovirus<-data.frame(num)

#We create 2 additinoal columns
Enterovirus$WtNT = ""
Enterovirus$freq = ""


##Substr is a way to look at any range of positions of an element. This first line calls
# for the first position of the first element. However, "c" should not be the first
# position here (look at position 2 and 3 too). The first real nuc isn't shown until
# position 4. This is something that will need to be fixed to properly call nucs
substr(enterovirus_data[1], 1, 1)
substr(enterovirus_data[1], 2, 2)
substr(enterovirus_data[1], 3, 3)
substr(enterovirus_data[1], 4, 4)

##Table allows us to see the distribution of possibiltes at a position in all of the
# elements. Positons 4 & 9 are the first and second nucletide positons. Most frequent!
table(substr(enterovirus_data, 4, 4))
table(substr(enterovirus_data, 9, 9))

##If you select a range from the first position to 20 for example, you'll see where the
# problem is coming from. the c() function, paranthesis, and quotes are being included
# in the positions.
substr(enterovirus_data[1], 1, 20)

##...

#gaby was here
