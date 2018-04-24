### MAPS WITH GEOGRAPHICAL LOCATIONS AND PIE CHARTS###
### Basic functions ###

# Libraries required
# ggplot2  is required for plot functions
# rgdal is required for readOGR function and compassRose function (as it loads sp package)
# maps is required for map.axes and map.scale functions
# mapplots is required for add.pie function

library(ggplot2)
library(rgdal)
library(maps)
library(mapplots)

# Read the shapefile of interest and create an object, here called "map" 
# File is specificied in "Shapefile.shp"
# readOGR includes a standard projection on shapefile

map <- readOGR("Shapefile.shp")

# plot map using shapefile
# maps.axes for including longitude and latitude axes
# map.scale for including scale
# lwd defines border thickness
# relwidht defines scale size, x and y coordinates define scale position on image
# compassRose position defined by coordinates (e. g. -55, -22.98)
# compassRose rose rotation (rot), character expansion (cex) for defining size


plot(map, lwd=2.5, border=alpha("black"), col="#252525")
map.axes()
map.scale(ratio=F, relwidth = 0.1, x=-49, y=-23, lwd=5)
compassRose(-55,-22.98,rot=0,cex=0.5)

# Adding geographical points
# Read a csv table, sep indicates what separates columns (e. g. ";" symbol)
# dec indicates decimal separator, and if table has a header, specify with TRUE
# points plots the geographical points on map, reading columns specified by "[,c(1,2)]"
# cex indicates size for dots, col indicates colour, pch is point format
mappoints <- read.table("Mappoints.csv", sep=";", dec=",", header=TRUE)
points(mappoints[,c(1,2)],pch=19,col="black",cex=5)

# Adding the pie charts
# z=c(...) indicates the portions of the pie charts filled by each given type of information
# x & y are coordinates for the pie chart
# Radius is to designate the size of the circle for the pie chart
# alpha designates colour, and number is the opacity of the colour
# labels can be included inside if wanted

add.pie(z=c(33,20,8,7,3,13,8,5), x=-55, y=-26, radius=sqrt(0.2), col=c(alpha("#810F7c", 1), alpha("#0868AC", 1), alpha("#c51b7d", 1), alpha("#006d2c"), alpha("#252525"), alpha("#d6604d"), alpha("#fe9929"), alpha("#8c510a")), labels="")

