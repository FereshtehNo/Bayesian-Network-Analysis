# Set the working directory
setwd("D:/Phd-classes/network-exam")

# Load the required libraries
library(igraph)
library(bnlearn)

# Read in the csv file
df <- read.csv("string_interactions_selected.csv", header=TRUE, stringsAsFactors=FALSE)

# Create a network object from the data frame
g <- graph_from_data_frame(df, directed=FALSE)

# Convert the network object to an adjacency matrix
adj_matrix <- as.matrix(get.adjacency(g, sparse=FALSE))

# Convert the adjacency matrix to a data frame
adj_df <- as.data.frame(adj_matrix)

# Learn the structure of the Bayesian network using the hill-climbing algorithm
bn.fit <- hc(adj_df)

# Print the edges of the Bayesian network
print(bn.fit$learned.edges)

# Plot the Bayesian network
plot(bn.fit)
