setwd("~/desktop") 

library(seqinr)
library(ape)

enteroseqs<-read.fasta("enteroshort.txt")
ealigned<-read.alignment("enteroshort.txt", format="fasta")

#gets DNA into matrix form
enteromatrix<-read.dna("enterodata.txt", format="fasta", as.character = TRUE)

#gets WT NT for each DNA position 
cons<-seqinr::consensus(ealigned)

#counts number of sequences with consensus NT
numCons<-length(which(enteromatrix[]==cons[]))

transition<-function(basepair){
  #basepair<-("A", "C", "T", "G"),
  if(basepair=="a") {return("g")}
  if(basepair=="g") {return ("a")}
  if(basepair=="t") {return ("c")}
  if(basepair=="c") {return ("t")}
  }

nrow(enterodata)
ncol(enterodata)

#determines transition from consensus
numTrans<-length(which(enteromatrix=="transition"))

transAA<-c()
for(i in 1:length(cons)){
  trans_letter<-transition(cons[i])
  transAA<-c(transAA,trans_letter)
}

mutatedAA<-translate(transAA)
mutatedAA

#factor code 
bigAAchange=factor(c(), levels=c(0,1), labels=c())

#creates an new variable to make an empty data frame with 891 rows
num<-c(1:891)

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
mutatedAA->enterodata[,4]

translate(cons) -> wildAA

count=0
for(i in 1:length(wildAA)) {
  count= count+1
  enterodata[count,]$WTAA=wildAA[i]
  count=count+1
  enterodata[count,]$WTAA=wildAA[i]
  count=count+1
  enterodata[count,]$WTAA=wildAA[i]
  }
  
  


View(enterodata)









  








