setwd(choose.dir())
metadata=read.table("metadata.csv",sep=",",header=T)
file.create("texte_tot.txt")

for (i in 1:nrow(metadata)){
  namefile=paste(metadata$id[i],".txt",sep="")
  descripteur_i=c("****")
  for (j in 1:ncol(metadata)){
    descripteur_i=paste(descripteur_i," *",colnames(metadata)[j],"_",metadata[i,j],sep="")
  }
  cat(descripteur_i, file="texte_tot.txt",append=T)
  
  cat("\n", file="texte_tot.txt",append=T)
  texte=readLines(namefile,  encoding="UTF-8")
  cat(texte, file="texte_tot.txt",append=T)
  cat("\n", file="texte_tot.txt",append=T)
  cat("\n", file="texte_tot.txt",append=T)
}