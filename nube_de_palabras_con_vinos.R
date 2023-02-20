## Librerias

library(NLP) # Paquete necesario para cargar tm
library(tm) # Paquete para la mineria de datos
library(RColorBrewer) # Colores
library(wordcloud) # Nube de palabras

# Cargamos archivo

vinos<-read.csv('./opiniones_acerca_de_vinos.csv',header=TRUE,sep=',',dec='.',row.names=1)
head(vinos)

# Mirando el archivo, solo necesitamos la columna de description

#Ahora vamos a preparar los datos para que sean analizados

comentarios<-VCorpus(VectorSource(vinos$description))
comentarios<-tm_map(comentarios,content_transformer(tolower)) # Hacer todas las palabras minusculas
comentarios<-tm_map(comentarios,removePunctuation) # Quitar signos de puntuación
comentarios<-tm_map(comentarios,removeWords,stopwords('english')) # Quitar palabras comunes como conjuciones, articulos, etc

# Configurando colores

display.brewer.all(colorblindFriendly = TRUE) # Mirar la paleta de colores
colores=brewer.pal(8,'Dark2')

# Creando nube de palabras

wordcloud(comentarios,scale=c(3.5,0.7),random.order=FALSE,max.words=75,rot.per=0.25,colors=colores)
title(main='WorldCloud vinos',cex.main=1.2)