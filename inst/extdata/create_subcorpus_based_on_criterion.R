### CHOIX DU DOSSIER
filename="LeMonde"
### NOUVEAU DOSSIER
new_filename="theme_barrage"
### CHOIX DU CRITERE
criterion='theme=="barrage"'

files=list.files(path=filename)
library(stringr)
library(dplyr)
files_txt=str_subset(files,".txt")
file_csv=str_subset(files,".csv")
metadata=utils::read.csv(str_c(filename,"/metadata.csv"),header=TRUE,sep=",")
sub_metadata=filter_(metadata, criterion)
files_of_interest=str_c(sub_metadata$id,".txt")
dir.create(new_filename)
file.copy(from=str_c(filename,"/",files_of_interest),
          to=str_c(new_filename,"/",files_of_interest))

