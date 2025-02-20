# on liste tous les fichiers présents dans le répertoire
liste_fichiers=list.files()

# Dans la liste des fichiers, on travaille sur le fichier qui comprend une extension .txt
for (i in 1:length(liste_fichiers)){
  elem = unlist(strsplit(liste_fichiers[i], split="\\."))
  if(elem[length(elem)]=="csv"){
    tableau_noms = liste_fichiers[i]
  }
}
fichier_noms = read.table(tableau_noms, sep=";", header=T, quote="\"")

for (j in 1:nrow(fichier_noms)){
  ancien_nom = as.vector(fichier_noms$id[j])
  nouveau_nom = paste(fichier_noms$nvnom[j], ".txt", sep="")
  file.rename(from=ancien_nom, to=nouveau_nom)
}



## il faut les fichiers à renommer en .txt et le tableau de noms en .csv
## les noms ne doivent comporter qu'un seul ".", placé juste avant l'extension

## Choix du répertoire de travail.

## on liste tous les fichiers présents dans le répertoire
liste_fichiers = list.files()

## je recherche le tableau des noms :
tableau_noms = read.table("NOMDUFICHIER", sep=";", header=T, quote="\"")

## Dans la liste des fichiers, je parcours et je traite la liste des articles
for (i in 1:length(liste_fichiers)){
  elem = unlist(strsplit(liste_fichiers[i],split="\\."))
  if(elem[2]=="txt"){
    un_article = liste_fichiers[i]
    nom_article = elem[1]
    ind_nom = which(tableau_noms$id==nom_article)
    nouveau_nom = paste(as.vector(tableau_noms$nvnom[ind_nom]), ".txt", sep="")
    file.rename(from=nom_article, to=nouveau_nom)
  }
}
