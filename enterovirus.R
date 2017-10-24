setwd("~/desktop") 

library(seqinr)
library(ape)

enteroseqs<-read.fasta("enteroAli.txt")

#gets DNA into matrix form
enteromatrix<-read.dna("enteroAli.txt", format="fasta", as.character = TRUE)

#gets WT NT for each DNA position 
cons<-consensus(enteromatrix)

#counts number of sequences with consensus NT
numCons<-length(which(enteromatrix[,1]==cons[1]))

transition<-function(basepair){
  #basepair<-("A", "C", "T", "G"),
  if(basepair=="A") {return("G")}
  if(basepair=="G") {return ("A")}
  if(basepair=="T") {return ("C")}
  if(basepair=="C") {return ("T")}}

#determines transition from consensus
numTrans<-length(which(enteromatrix=="transition"))
transition(cons)



#factor code 
bigAAchange=factor(c(), levels=c(0,1), labels=c())

#creates an new variable to make an empty data frame with 891 rows
num<-c(1:864)

#creates the data frame with 891 rows 
enterodata<-data.frame(num)

#creates 2 new columns 
enterodata$WtNT=""
enterodata$WTAA=""
enterodata$MutAA=""
enterodata$bigAAchange=""

#puts WTNT in first 5 elements in row 2
cons->enterodata[,2]
WTAA->enterodata[,3]

WTAA<-translate(cons)




View(enterodata)









  








