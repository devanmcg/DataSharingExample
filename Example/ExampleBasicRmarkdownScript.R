# Making documents with knitr is easy in R studio 
# but not everyone uses R studio or is familiar with knitr. 
# FOrtunately it is pretty straightforward to compile simple, 
# self-contained documents that show you the code and output
# step-by-step from an R script file. Even without R studio. 
# Just install the rmarkdown package:
  install.packages("rmarkdown")
# If one has set up the file paths in ExampleBasicSCript.R correctly
#  -- mostly pay atention to not using setwd() -- 
#  one can create an html document (or MS Word doc with "word_document")
# simply by running this line in the R console:
  rmarkdown::render(paste(LocalPath, 
                          "/ExampleBasicScript.R", sep=""),
                    "html_document")
# That works just fine. 
# but documents can be made much better-looking
# (and easier to read) 
# with an actual R markdown (.Rmd) file. 
# See the .Rmd file in the Example folder
# and a template to create your own in the Templates folder
  