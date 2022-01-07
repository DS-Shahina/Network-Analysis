"Problem 1"
import pandas as pd
import numpy as np
import networkx as nx 
import matplotlib.pyplot as plt

# Degree Centrality
G = pd.read_csv("D:/C DRIVE-SSD DATA backup 15-12-2020/Desktop/360DigiTmg Assignment/Network Analytics/connecting_routes.csv")
G = G[['2B','410','AER','2965','KZN','2990','CR2']] # Remove Unwanted Columns
G = G.iloc[:500,:] # 500 rows

g = nx.Graph()

g = nx.from_pandas_edgelist(G, source = 'AER', target = 'KZN')

print(nx.info(g))
#Number of nodes: 227
#Number of edges: 265
#Average degree:   2.3348

b = nx.degree_centrality(g)  # Degree Centrality
print(b) 
# ABJ is the highest degree centrality

pos = nx.spring_layout(g, k = 0.15)
nx.draw_networkx(g, pos, node_size = 25, node_color = 'blue')

# closeness centrality
closeness = nx.closeness_centrality(g)
print(closeness)
# ABJ is the highest closeness centrality

# Betweeness Centrality 
d = nx.betweenness_centrality(g) # Betweeness_Centrality
print(d)
# ABJ is the highest betweenness centrality

## Eigen-Vector Centrality
evg = nx.eigenvector_centrality(g) # Eigen vector centrality
print(evg)
# ABJ is the highest Eigen-Vector Centrality

# cluster coefficient
cluster_coeff = nx.clustering(g)
print(cluster_coeff)
# ABJ is the highest cluster coefficient

# Average clustering
cc = nx.average_clustering(g) 
print(cc)
# Average clustering = 0.14421180874925366

