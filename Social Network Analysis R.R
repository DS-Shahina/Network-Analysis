#install.packages("igraph")
library("igraph") # This loads the igraph package

###### Circula Network using Adjacency Matrix ########
#Facebook#
circular <- read.csv("D:/C DRIVE-SSD DATA backup 15-12-2020/Desktop/360DigiTmg Assignment/Network Analytics/facebook.csv", header = TRUE)
head(circular)
# shows initial few rows of the loaded file

# create a newtwork using adjacency matrix
CircularNW <- graph.adjacency(as.matrix(circular), mode="undirected", weighted=TRUE)
plot(CircularNW)

###### Star Network using Adjacency Matrix from file ##################
#Instagram#
# Load the adjacency matrix from the csv file
star <- read.csv("D:/C DRIVE-SSD DATA backup 15-12-2020/Desktop/360DigiTmg Assignment/Network Analytics/instagram.csv", header = TRUE)
head(star) 

# create a newtwork using adjacency matrix
starNW <- graph.adjacency(as.matrix(star), mode = "undirected")
plot(starNW)

###### Another Star using Adjacency Matrix #########
#LinkedIn
another_star <- read.csv("D:/C DRIVE-SSD DATA backup 15-12-2020/Desktop/360DigiTmg Assignment/Network Analytics/linkedin.csv", header = TRUE)
head(another_star) 
# shows initial few rows of the loaded file

# create a newtwork using adjacency matrix
AnotherstarNW <- graph.adjacency(as.matrix(another_star), mode = "undirected", weighted = TRUE)
plot(AnotherstarNW)

