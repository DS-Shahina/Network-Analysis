#install.packages("igraph")
library("igraph")

airports <- read.csv("D:/C DRIVE-SSD DATA backup 15-12-2020/Desktop/360digitmg material/Network Analytics/airports.dat", header = FALSE)
colnames(airports) <- c("Airport ID","Name","City","Country","IATA_FAA","ICAO","Latitude","Longitude","Altitude","Timezone","DST","Tz database timezone")
head(airports)

airline_routes <- read.csv("D:/C DRIVE-SSD DATA backup 15-12-2020/Desktop/360digitmg material/Network Analytics/routes.dat", header=FALSE)
colnames(airline_routes) <- c("Airline", "Airline ID", "Source Airport","Source Airport ID","Destination Airport","Destination Airport ID","Stops","Equipment")
head(airline_routes)

AirlineNW <- graph.edgelist(as.matrix(airline_routes[1:300, c(3, 5)]), directed = TRUE) # 3rd and 5th columns 
plot(AirlineNW)

## How many airports are there in the network?
?vcount #vertices count = 143 airports are capture
vcount(AirlineNW)

## How many connections are there in the network?
?ecount #edge count = 300
ecount(AirlineNW)

# Which airport has most flights coming in, and how many?
?degree
indegree <- degree(AirlineNW, mode = "in")
max(indegree) # how many flights are landing = 17
index <- which(indegree == max(indegree))
indegree[index] # MNL Airport has maximum landings
rowid_in = which(airports$IATA_FAA == names(indegree[index]))
airports[rowid_in, ] # city is Manila, country is Philippines, Airport is MNL


# Which airport has most flights going out of, and how many?
outdegree <- degree(AirlineNW, mode = "out")
max(outdegree) # How many take off is there = 17
index <- which(outdegree == max(outdegree))
outdegree[index] # MNL Airport has maximum take off
rowid_in = which(airports$IATA_FAA == names(outdegree[index]))
airports[rowid_in, ] # city is Manila, country is Philippines, Airport is MNL

# MNL Airport is the most busiest Airport, more landings more take offs

# Which airport is close to most of the airports (in terms of number of flights)
?closeness
closeness_in <- closeness(AirlineNW, mode = "in", normalized = TRUE)
max(closeness_in)
index <- which(closeness_in == max(closeness_in))
closeness_in[index] # SVX USSS Airport is close to most of the airports
rowid_close = which(airports$IATA_FAA == names(closeness_in[index]))
airports[rowid_close, ] # city is Yekaterinburg, country is Russia, Airport is SVX USSS

# Which airport comes in between most of the routes and hence is an important international hub?
?betweenness
btwn <- betweenness(AirlineNW, normalized = TRUE)
max(btwn)
index <- which(btwn == max(btwn))
btwn[index] # ARN ESSA airport comes in between most of the routes and hence is an important international hub
rowid_btwn = which(airports$IATA_FAA == names(btwn[index]))
airports[rowid_btwn, ] # city is Stockholm, country is Sweden, Airport is ARN ESSA

# Degree, closeness, and betweenness centralities together
centralities <- cbind(indegree, outdegree, closeness_in, btwn)
colnames(centralities) <- c("inDegree","outDegree","closenessIn","betweenness")
head(centralities)

# correlations of the centralities
cor(centralities)

# Any pair with low correlation?
plot(centralities[, "closenessIn"], centralities[, "betweenness"])
?subset
subset(centralities, (centralities[,"closenessIn"] > 0.005) & (centralities[,"betweenness"] > 0.006)) #check high closeness and high betweenness
airports[which(airports$IATA_FAA == "KZN"), ] # taking randomly
airports[which(airports$IATA_FAA == "ARN"), ]
airports[which(airports$IATA_FAA == "IKT"), ]

# low closeness low betweenness centrality
subset(centralities, (centralities[, "closenessIn"] < 0.002) & (centralities[, "betweenness"] < 0.002))


# Which is one of the most important airport in the world (the Google way)?
?eigen_centrality
eigenv <- eigen_centrality(AirlineNW, directed = TRUE, scale = FALSE, weights = NULL)
eigenv$vector
max(eigenv$vector)
index <- which(eigenv$vector == max(eigenv$vector))
eigenv$vector[index]
names(eigenv$vector[index]) #MNL Airport is one of the most important airport in the world.
rowid_eign = which(airports$IATA_FAA == names(eigenv$vector[index]))
airports[rowid_eign, ] # city is Manila, country is Philippines, Airport is MNL

#which airport has maximum value
?page_rank
pg_rank <- page_rank(AirlineNW, damping = 0.999) # do not put damping=1; the solution not necessarily converges; put a value close to 1.
pg_rank$vector
max(pg_rank$vector)
index <- which(pg_rank$vector == max(pg_rank$vector))
pg_rank$vector[index]
rowid_page = which(airports$IATA_FAA == names(pg_rank$vector[index]))
airports[rowid_page, ] # city is Manila, country is Philippines, Airport is MNL
# MNL is the most busiest Airport

