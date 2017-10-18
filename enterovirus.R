setwd("~/desktop") 

library(seqinr)
enterodata<-read.fasta("enterodata.txt")

#creates an new variable to make an empty data frame with 891 rows
num<-c(1:891)

#creates the data frame with 891 rows 
enterodata<-data.frame(num)

#creates 2 new columns 
enterodata$WtNT="element1"
enterodata$freq=""


#all elements are 891 in length
element1<-enterodata[[1]]
element1[1]

View(enterodata)

##Substr is a way to look at any range of positions of an element. This first line calls
# for the first position of the first element. However, "c" should not be the first
# position here (look at position 2 and 3 too). The first real nuc isn't shown until
# position 4. This is something that will need to be fixed to properly call nucs
substr(enterodata[1], 1, 1)
substr(enterodata[1], 2, 2)
substr(enterodata[1], 3, 3)
substr(enterodata[1], 4, 4)

##Table allows us to see the distribution of possibilities at a position in all of the
# elements. Positons 4 & 9 are the first and second nucletide positons. Most frequent!
table(substr(enterodata, 4, 4))
table(substr(enterodata, 9, 9))

#creates a for loop
loop1<-c()
for(i in 1:1782)
  {
  table(substr(
    enterodata[i])->nucs,
    loop1<-c(loop1,nucs))
  }






  








