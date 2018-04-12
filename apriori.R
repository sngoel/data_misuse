library(arules)
mydata <-read.csv("/home/sanchit/Anna/credit.csv", header=TRUE, sep=",")

rules <- apriori(mydata, parameter = list(supp=0.15, conf=0.6, target="rules"), appearance = list(rhs = c("class=good", "class=bad"), default = "lhs"))
rules <- sort(rules, by = "confidence")
inspect(rules[is.redundant(rules)])
rules <- subset(rules, lift > 1)

write(rules[1:25], "/home/sanchit/Anna/credit_rules.csv", sep=";")