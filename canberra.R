#!/usr/bin/env Rscript

# ...

argv <- commandArgs(T);

# Recieves three arguments simulation_results_1 simulation_results_2 outputfileName

x <- read.table(argv[1],sep = ""); #Read first simulation result


x <- x[,2];
#x
y <- read.table(argv[2],sep = ""); #Read second simulation result
y <- y[,2];
diff <- dist(rbind(x, y), method = "canberra")  #Calculating Canberra's distance between two simulation results
sink(argv[3]) #Set output file
cat(diff) #Content for sending to output (in this case the canberra distance)
sink() #Close output file


