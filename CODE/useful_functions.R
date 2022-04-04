# USEFUL_FUNCTIONS.R
#
# Julien Arino
# May 2019
#
# This file contains several useful functions that I do not want to
# include in the main Rmd files.

# Table to map region names in mainland France between French and English.
# Put as many different lists as needed.
# Make sure order is the same in each sublist.
region_names_FR = list()
region_names_FR$fr1 = c("Auvergne-Rhône-Alpes",   
                        "Bourgogne-Franche-Comté",
                        "Bretagne",               
                        "Centre",
                        "Corse",
                        "Grand-Est",
                        "Haut - de-France",       
                        "Ile-de-France",
                        "Normandie",
                        "Nouvelle -Aquitaine",
                        "Occitanie",
                        "Pays-de-Loire",
                        "PACA")
region_names_FR$fr2 = c("Auvergne-Rhône-Alpes",   
                        "Bourgogne-Franche-Comté",
                        "Bretagne",               
                        "Centre",
                        "Corse",
                        "Grand-Est",
                        "Haut-de-France",       
                        "Ile-de-France",
                        "Normandie",
                        "Nouvelle-Aquitaine",
                        "Occitanie",
                        "Pays-de-Loire",                        
                        "PACA")
region_names_FR$fr3 = c("AUVERGNE-RHONE-ALPES",
                        "BOURGOGNE-FRANCHE-COMTE",
                        "BRETAGNE",
                        "CENTRE-VAL-DE-LOIRE",
                        "CORSE",
                        "GRAND EST",                 
                        "HAUTS-DE-FRANCE",
                        "ILE-DE-FRANCE",             
                        "NORMANDIE",
                        "NOUVELLE-AQUITAINE",
                        "OCCITANIE",
                        "PAYS-DE-LA-LOIRE",
                        "PROVENCE-ALPES-COTE-D-AZUR")
region_names_FR$en = c("Auvergne-Rhône-Alpes",
                       "Bourgogne-Franche-Comté",
                       "Brittany",
                       "Centre-Val de Loire",       
                       "Corsica",
                       "Grand Est",               
                       "Hauts-de-France",
                       "Île-de-France",             
                       "Normandy",
                       "Nouvelle-Aquitaine",        
                       "Occitanie",
                       "Pays de la Loire",          
                       "Provence-Alpes-Côte d'Azur")


# MAKE_Y_AXIS
# Formats the y axis ticks and labels so that they are easier to read.
# Also returns a multiplicative factor for the plot so that the plot is on the right scale.
make_y_axis <- function(yrange) {
  y_max <- yrange[2]
  if (y_max < 1000) {
    # Do almost nothing
    factor <- 1
    ticks <- pretty(yrange)
    labels <- format(ticks, big.mark=",", scientific=FALSE)    
  } else if (y_max < 100000) {
    # Label with ab,cde
    factor <- 1
    ticks <- pretty(yrange)
    labels <- format(ticks, big.mark=",", scientific=FALSE)
  } else if (y_max < 1000000) {
    # Label with K
    factor <- 1/1000
    ticks <- pretty(yrange*factor)
    labels <- paste(ticks,"K",sep="")
  } else if (y_max < 1000000000) {
    # Label with M
    factor <- 1/1000000
    ticks <- pretty(yrange*factor)
    labels <- paste(ticks,"M",sep="")
  } else {
    # Label with B
    factor <- 1/1000000000
    ticks <- pretty(yrange*factor)
    labels <- paste(ticks,"B",sep="")
  }
  # Remove 0unit, just have 0
  if ("0K" %in% labels) {
    labels[which(labels=="0K")]="0"
  }
  if ("0M" %in% labels) {
    labels[which(labels=="0M")]="0"
  }
  if ("0B" %in% labels) {
    labels[which(labels=="0B")]="0"
  }
  y_axis <- list(factor=factor,ticks=ticks,labels=labels)
  return(y_axis)
}

# CROP_FIGURE
#
# Crop an output pdf file. Requires to have pdfcrop installed
# in the system (for example, under linux)
crop_figure = function(fileFull) {
  fileName = tools::file_path_sans_ext(fileFull)
  fileExt = tools::file_ext(fileFull)
  if (fileExt == "pdf") {
    command_str = sprintf("pdfcrop %s",fileFull)
    system(command_str)
    command_str = sprintf("mv %s-crop.pdf %s.pdf",fileName,fileFull)
    system(command_str)
  }
  if (fileExt == "png") {
    command_str = sprintf("convert %s -trim %s-trim.png",fileFull,fileName)
    system(command_str)
    command_str = sprintf("mv %s-trim.png %s",fileName,fileFull)
    system(command_str)
  }
}
