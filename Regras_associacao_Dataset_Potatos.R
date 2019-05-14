#1 Carregar o dataset Titanic
dados <- read.csv(file="C:/Users/leleite/Documents/data/papafrescaSimNao.csv", header=TRUE, sep=";")


#2 Instalar Pacote 
install.packages("arules")

#3-	Carregar a biblioteca arules:
library("arules")


#4-	BATATA ENGORDA = SIM
regras <- apriori(dados, control = list(verbose=T),
                  parameter = list(minlen=2, maxlen=4, supp=0.05, conf=0.5),
                  appearance = list(rhs=c("Lapapaengorda=Sim")))

regrasOrdenadas <- sort(regras, by="confidence")
inspect(regrasOrdenadas)


regraslimpas <- regrasOrdenadas[!is.redundant(regrasOrdenadas)]
inspect(regraslimpas)

#INSIGHTS:
# PESSOAS NAS CONDIÇÕES ABAIXO TENDEM A ACHAR QUE BATATA ENGORDA:
# - NÃO ACHAM QUE BATATAS SÃO SAUDAVEIS
# - NÃO ACHAM QUE BATATAS SÃO ECONOMICAS
#
