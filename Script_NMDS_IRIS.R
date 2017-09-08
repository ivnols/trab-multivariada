##Primeiramente jovens, como escolher nosso diret?rio de trabalho no R?
##Usem a fun??o setwd(),e entre os parenteses copiem o local da sua pasta
##de trabalho,lembrem-se, se voc? usa windows (amador), como eu,
##mudem o lado das barrinhas dessa->'\', para essa ->'/'. 


setwd("C:/R/Dados")


##Por?m para nosso exemplo usaremos dados que j? existem na mem?ria do R
##, ou seja, o passo acima foi s? perda de tempo! :)
##Vamos usar o dataset "iris". Para carregar esses dados use a fun??o data():


data(iris)


##Cofere ae, só para garantir:


summary(iris)


######Se tudo deu certo, continuemos:#####

##Vamos precisar do patote "vegan". Use a função install.packages()
##para baixar o pacote caso voc? n?o o tenha instalado.


install.packages("vegan")


##Para "chamar" o pacote ap?s a instala??o use library():


library(vegan)


##Olha os dados:


iris


######Criando objeto das vari?veis sem os nomes das esp?cies:

iris_data<-iris[ , 1:4]

summary(iris_data)

################################################################


## CRIANDO A MATRIZ DE DIST?NCIA 


iris_data_euc<-vegdist(iris_data, method="euclidean")


### REALIZANDO AN?LISE ###

##### try e trymax delimita o n?mero m?ximo e m?nimo de rodadas
##ponto de stress abaixo de 0,2 muito bom

nmds.euc<-metaMDS(iris_data_euc, try=20, trymax=50)


## Visulizando gr?fico feito

plot(nmds.euc, type="t")

#######################################

##inserindo as esp?cies na parada


as.data.frame(iris[ ,5])

sp_iris<-iris[ ,5]

### Fazendo o gr?fico


cores.sp<-c("blue", "red", "green")   ##Colocar cada esp?cie em cor diferente
plot(nmds.euc, type="n")   ##plotar a janela fazia para come?ar a brincadeira
points(nmds.euc, pch=16, col=cores.sp[sp_iris])   ##Continuando o gr?fico
ordihull(nmds.euc,sp_iris, col=cores.sp)   ## e para ficar mais bonitinho!

envfit.euc<-envfit(nmds.euc, iris_data)   ##Agora nós podemos ver como cada vari?vel influ?ncia ou n?o a forma??o dos grupos usando a fun??o envifit().
envfit.euc
plot(envfit.euc)
