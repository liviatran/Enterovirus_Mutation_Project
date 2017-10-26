PracticeData<-read.csv("OverviewSelCoeff_BachelerFilter.csv")

library(seqinr)
library(ape)

#First we'll create the data frame
Pos<-c(1:891)
enterodata<-data.frame(Pos)
enterodata$WtNt=""
enterodata$TrNtFreq=""
enterodata$WTAA=""
enterodata$MUTAA=""
enterodata$bigAAchange=""

#Read in shortened entero data
enteroseqs<-read.fasta("enteroshort.txt")

#Align entero data
enteroaligned<-read.alignment("enteroshort.txt", format="fasta")

#Gets DNA into matrix form
enteromatrix<-read.dna("enteroshort.txt", format="fasta", as.character = TRUE)

#Gets WTnt for each nt position
cons<-seqinr::consensus(enteroaligned)

#Insert concensus into dataframe
enterodata$WtNt=cons

#Function to return transition mutation
transition<-function(basepair){
  #basepair<-("A", "C", "T", "G"),
  if(basepair=="a") {return("g")}
  if(basepair=="g") {return ("a")}
  if(basepair=="t") {return ("c")}
  if(basepair=="c") {return ("t")}
  }

#Loop to insert the freq of transition mutations
for(i in 1:nrow(enterodata)){
  enterodata$TrNtFreq[i]<-length(which(enteromatrix[,i]==transition(cons[i])))/
    (nrow(enteromatrix))
  }
  
#Translate the consensus to AAs
translate(cons) -> wildAA

#Insert the translated consensus into data frame
count=0
for(i in 1:length(wildAA)) {
  count = count+1
  enterodata[count,]$WTAA=wildAA[i]
  count=count+1
  enterodata[count,]$WTAA=wildAA[i]
  count=count+1
  enterodata[count,]$WTAA=wildAA[i]
  }




