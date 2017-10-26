PracticeData<-read.csv("OverviewSelCoeff_BachelerFilter.csv")

library(seqinr)
library(ape)

#First we'll start the data frame
Pos<-c(1:891)
EnteroData<-data.frame(Pos)
EnteroData$WtNt=""
EnteroData$TrNtFreq=""

#Read in shortened entero data
enteroseqs<-read.fasta("enteroshort.txt")

#Align entero data
enteroaligned<-read.alignment("enteroshort.txt", format="fasta")

#Gets DNA into matrix form
enteromatrix<-read.dna("enteroshort.txt", format="fasta", as.character = TRUE)

#Gets WTnt for each nt position
cons<-seqinr::consensus(enteroaligned)

#Insert concensus nt into dataframe
EnteroData$WtNt=cons

#Function to return transition mutation
transition<-function(basepair){
  #basepair<-("A", "C", "T", "G"),
  if(basepair=="a") {return("g")}
  if(basepair=="g") {return ("a")}
  if(basepair=="t") {return ("c")}
  if(basepair=="c") {return ("t")}
  }

#Loop to insert freq of Transition mutations
for(i in 1:nrow(EnteroData)){
  EnteroData$TrNtFreq[i]<-length(which(enteromatrix[,i]==transition(cons[i])))/
    (nrow(enteromatrix))
}
  
#Loop to 
transAA<-c()
for(i in 1:length(cons)){
  trans_letter<-transition(cons[i])
  transAA<-c(transAA,trans_letter)
}

#
mutatedAA<-translate(transAA)
mutatedAA

#factor code 
bigAAchange=factor(c(), levels=c(0,1), labels=c())

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