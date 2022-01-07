"Problem 2"

import pandas as pd
import numpy as np
import networkx as nx 
import matplotlib.pyplot as plt

# Degree Centrality
G = pd.read_csv("D:/C DRIVE-SSD DATA backup 15-12-2020/Desktop/360DigiTmg Assignment/Network Analytics/flight_hault.csv")
G = G.iloc[:500,:] # 500 rows

g = nx.Graph()

g = nx.from_pandas_edgelist(G, source = 'GKA', target = 'AYGA')

print(nx.info(g))
#Number of nodes: 898
#Number of edges: 500
#Average degree:   1.1136

b = nx.degree_centrality(g)  # Degree Centrality
print(b) 
# AEY is the highest degree centrality

pos = nx.spring_layout(g, k = 0.15)
nx.draw_networkx(g, pos, node_size = 25, node_color = 'blue')

# closeness centrality
closeness = nx.closeness_centrality(g)
print(closeness)
# AEY is the highest closeness centrality

# Betweeness Centrality 
d = nx.betweenness_centrality(g) # Betweeness_Centrality
print(d)
# AEY is the highest betweenness centrality

## Eigen-Vector Centrality
evg = nx.eigenvector_centrality(g) # Eigen vector centrality
print(evg)
# AEY is the highest Eigen-Vector Centrality

# cluster coefficient
cluster_coeff = nx.clustering(g)
print(cluster_coeff)
# AEY is the highest cluster coefficient

# Average clustering
cc = nx.average_clustering(g) 
print(cc)
# Average clustering = 0.0


