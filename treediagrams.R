# Creating the tree diagrams as "dot" files and PNGs.
#
# On Linux, the "graphviz" and "libglpk-dev" packages must be installed for this.

library(data.tree)     # for tree diagrams
library(DiagrammeR)

DPI <- 300


treeToPng <- function (root, outfile) {
    dotstr <- generate_dot(ToDiagrammeRGraph(root))
    cat(gsub("\'", '"', dotstr, fixed = TRUE), file = sprintf("images/%s.dot", outfile))
    system(sprintf("dot -Tpng -Gdpi=%d images/%s.dot > images/%s.png", DPI, outfile, outfile))
}


# ----- Tree 1 -----

# Nodes and edges of the tree diagram
root <- Node$new('')
node_k <- root$AddChild("Person sick")
node_k_p <- node_k$AddChild("Test positive")
node_k_np <- node_k$AddChild("Test negative")
node_nk <- root$AddChild("Person healthy")
node_nk_p <- node_nk$AddChild("Test positive")
node_nk_np <- node_nk$AddChild("Test negative")

# Visual adjustments
SetNodeStyle(root, shape = 'point')
SetNodeStyle(node_k, shape = 'ellipse')
SetNodeStyle(node_nk, shape = 'ellipse')
SetGraphStyle(root, rankdir = "LR")   # Tree from left to right instead of top to bottom

treeToPng(root, "tree1")


# ----- Tree 2 -----

# Nodes and edges of the tree diagram
root <- Node$new('')
SetEdgeStyle(root, fontsize = 10)

# upper branch (sick)
node_k <- root$AddChild("S")
SetEdgeStyle(node_k, label = "P(S)")
node_k_p <- node_k$AddChild("T")
SetEdgeStyle(node_k_p, label = "P(T|S)")
node_k_np <- node_k$AddChild("T&#773;")
SetEdgeStyle(node_k_np, label = "P(T&#773;|S)")

# lower branch (not sick)
node_nk <- root$AddChild("S&#773;")
SetEdgeStyle(node_nk, label = "P(S&#773;)")
node_nk_p <- node_nk$AddChild("T")
SetEdgeStyle(node_nk_p, label = "P(T|S&#773;)")
node_nk_np <- node_nk$AddChild("T&#773;")
SetEdgeStyle(node_nk_np, label = "P(T&#773;|S&#773;)")

# Visual adjustments
SetNodeStyle(root, shape = 'point')
SetNodeStyle(node_k, shape = 'ellipse')
SetNodeStyle(node_nk, shape = 'ellipse')
SetGraphStyle(root, rankdir = "LR")

treeToPng(root, "tree2")


# ----- Tree 3 -----

# Nodes and edges of the tree diagram
root <- Node$new('')
SetEdgeStyle(root, fontsize = 10)

# upper branch (sick)
node_k <- root$AddChild("S")
SetEdgeStyle(node_k, label = "P(S)", color = "red")
node_k_p <- node_k$AddChild("T")
SetNodeStyle(node_k_p, color = "red")
SetEdgeStyle(node_k_p, label = "P(T|S)", color = "red")
node_k_np <- node_k$AddChild("T&#773;")
SetEdgeStyle(node_k_np, label = "P(T&#773;|S)", color = "black")

# lower branch (not sick)
node_nk <- root$AddChild("S&#773;")
SetEdgeStyle(node_nk, label = "P(S&#773;)", color = "red")
node_nk_p <- node_nk$AddChild("T")
SetNodeStyle(node_nk_p, color = "red")
SetEdgeStyle(node_nk_p, label = "P(T|S&#773;)", color = "red")
node_nk_np <- node_nk$AddChild("T&#773;")
SetEdgeStyle(node_nk_np, label = "P(T&#773;|S&#773;)", color = "black")

# Visual adjustments
SetNodeStyle(root, shape = 'point')
SetNodeStyle(node_k, shape = 'ellipse')
SetNodeStyle(node_nk, shape = 'ellipse')
SetGraphStyle(root, rankdir = "LR")

treeToPng(root, "tree3")
