# Importations et Données
library('ggplot2')

setwd("C:/Users/ASUS_TMX/Documents/R project/")
diamonds=read.csv("./diamonds.csv")

head(diamonds,5)

# Tâches à effectuer
# Créer un diagramme de dispersion de la colonne prix par rapport à la colonne carat
ggplot(diamonds, aes(x=carat, y=price))+geom_point(alpha=0.1, colour='blue')

# Créer un histogramme de la colonne des prix
ggplot(diamonds, aes(x=price))+geom_histogram(bins=50, fill='blue')

# Créer un graphique de comptage des instances par type de coupe
ggplot(diamonds, aes(x=cut, fill = cut))+geom_bar()

# Créer un grand diagramme en boîtes montrant la répartition des prix par type de coupe
ggplot(diamonds, aes(x=cut, y=price, fill = cut))+geom_boxplot()

# Défi ! Voyez si vous pouvez modifier l'ordre des boîtes à moustaches
diamonds$cut <- factor(diamonds$cut , levels=c('Fair', 'Ideal', 'Good', 'Very Good', 'Premium'))
ggplot(diamonds, aes(x=cut, y=price, fill = cut))+geom_boxplot()+scale_fill_brewer(palette="BuPu")
