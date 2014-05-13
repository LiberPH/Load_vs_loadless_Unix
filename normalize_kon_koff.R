#!/usr/bin/env Rscript

# ...

argv <- commandArgs(T);

# error checking...
a <- matrix(0,ncol=1000,nrow=1) #Matrix for 1000 randomized x results
x <- read.table(argv[1],sep = "");


x <- x[,2];
#x
y <- read.table(argv[2],sep = "");
y <- y[,2];
diff <- dist(rbind(x, y), method = "canberra")  #Calculating Canberra's distance between the simulations
for(i in 1:1000){
    random <-sample(x)  #Randomize x simulation
    a[,i] <- dist(rbind(x,random), method="canberra") #Calculate Canberra's distance between the simulation and its randomized case
}
m <- mean(a)

result <- diff/m #normalized diffrence

sink(argv[3]) #Open output file
cat(result) #Output content
sink() #Close output

