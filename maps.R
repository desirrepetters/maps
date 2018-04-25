### MAPS WITH GEOGRAPHICAL LOCATIONS AND PIE CHARTS###
### Basic functions ###

# Libraries required for script
# ggplot2  is required for plot functions
# rgdal is required for readOGR function and compassRose function 
# maps is required for map.axes and map.scale functions
# mapplots is required for add.pie function

library(ggplot2)
library(rgdal)
library(maps)
library(mapplots)

# Read the shapefile of interest and create an object, here called "map" 
# File is specificied in "Shapefile.shp"
# readOGR includes a standard projection on shapefile

map <- readOGR("shapefile.shp")

# plot map using shapefile
# maps.axes for including longitude and latitude axes
# map.scale for including scale
# lwd defines border thickness
# relwidht defines scale size, x & y coordinates define scale position
# compassRose position defined by coordinates (e.g. -55, -22.98)
# compassRose rose rotation (rot), character expansion (cex) for defining size


plot(map, lwd=2.5, border = alpha("black"), col = "#252525")
map.axes()
map.scale(ratio=F, relwidth = 0.1, x = -49, y = -23, lwd = 5)
compassRose(-55, -22.98, rot = 0, cex = 0.5)

# Adding geographical points
# Read a csv table, sep for column separator (e. g. ";" symbol)
# dec for decimal separator, and table header specified with TRUE
# points plots the geographical points, columns specified by "[, c(1, 2)]"
# cex for size of dots, col for colour, pch for point format
mappoints <- read.table("points-table.csv", sep = ";", dec = ",", header = TRUE)
points(mappoints[, c(1, 2)], pch = 19, col = "black", cex = 5)

# Adding pie charts
# z=c(...) for size of portions of each group in pie chart
# x & y are coordinates for the pie chart
# Radius for the size of the pie chart
# alpha for colour, and number for opacity of the colour
# Labels can be included inside if wanted

add.pie(z = c(33, 20, 8, 7, 3, 13, 8, 5), x= - 55, y = - 26, radius = sqrt(0.2),
        col = c(alpha("#810F7c", 1), alpha("#0868AC", 1), alpha("#c51b7d", 1), 
                alpha("#006d2c"), alpha("#252525"), alpha("#d6604d"), 
                alpha("#fe9929"), alpha("#8c510a")), labels = "")

