#   P A C K A G E   P R E P 
#
# Check if pacman package is installed, 
# and if not, R will install it. 
# Subsequent package loading in this script
# uses pacman. 
# You should read about its advantages. 
  if (!require("pacman")) install.packages("pacman")
#
#   D A T A   L O A D I N G
#
# Help R find the files. 
# Here are two options: 
  # Either set your working directory to the
  # folder where you saved the files from github, e.g.
    # setwd('C:/Users/Me/Documents/R') # remove initial comment (#) to use
  # Or define this path as a variable you can build 
  # complete file paths from in specific load() calls. 
  # This option is better for compatibility with 
  # knitr, for which setwd() can create problems. 
    LocalPath <- 'C:/Users/Me/Documents/R'
#
# Now load the files, one way or the other:
  # via the working directory:
    # load('./data/MyData.Rdata') # remove initial comment (#) to use
  # via full file path (suitable for .Rmd files, etc)
    load(paste(LocalPath, "/data/MyData.Rdata", sep=""))
#
#   D I s T R I B U T I O N S 
#
# Everyone should check distributions and other assumptions prior to analysis. 
# Maybe put some script for that here?
#
#   A N A L Y S I S
#
# I bet you ran some stats. Put that script here. 
# Use comments to orient to hypotheses or Methods sub-sections 
#
# G R A P H S 
#
# If you are so included, share your figure script here. 
# Use comments to refer to figure numbers in the paper. 