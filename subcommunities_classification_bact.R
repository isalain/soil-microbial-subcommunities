
otu <- t(otu1)

for(i in 1:ncol(otu))
{
  otu1[i,nrow(otu)+1] <- length(which((otu[,i]>=(sum(otu[1,])/100))))  #AT
  otu1[i,nrow(otu)+2] <- length(which((otu[,i]<(sum(otu[1,])/10000)))) #RT
  otu1[i,nrow(otu)+3] <- length(which((otu[,i]>=(sum(otu[1,])/10000))&(otu[,i]<(sum(otu[1,])/100)))) #MT
  otu1[i,nrow(otu)+4] <- length(which((otu[,i]>=(sum(otu[1,])/10000)))) #CT1
  otu1[i,nrow(otu)+5] <- length(which((otu[,i]<(sum(otu[1,])/100)))) #CT2
}
colnames(otu1)[ncol(otu1)-4] <-"gt1"
colnames(otu1)[ncol(otu1)-3] <-"lt0.01"
colnames(otu1)[ncol(otu1)-2] <-"m"
colnames(otu1)[ncol(otu1)-1] <-"ct1"
colnames(otu1)[ncol(otu1)] <-"ct2"
#write.csv(otu1,"test2.csv")
AT <- subset(otu1,otu1$gt1==nrow(otu))
RT <- subset(otu1,otu1$lt0.01==nrow(otu))
MT <- subset(otu1,otu1$m==nrow(otu))
CAT <-subset(otu1,otu1$ct1==nrow(otu) & otu1$ct2>0 & otu1$ct2<nrow(otu))
CRT <-subset(otu1,otu1$ct2==nrow(otu) & otu1$lt0.01>0 & otu1$lt0.01<nrow(otu))
CRAT <-subset(otu1,otu1$gt1<nrow(otu) & otu1$gt1>0 & otu1$lt0.01<nrow(otu) & otu1$lt0.01>0)
#AT$category <- "AT"
RT$category <- "RT"
MT$category <- "MT"
CAT$category <- "CAT"
CRT$category <- "CRT"
CRAT$category <- "CRAT"
new <- rbind(AT,RT,MT,CAT,CRT,CRAT)