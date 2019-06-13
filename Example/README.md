# Data and script sharing examples

Have you completed a manuscript and are keen to share your data and script, but don't really know what that *looks like*? 
Here is a basic example that is more than enough to make an engaging, useful, and *clear* supplemental data folder you can upload with your manuscript as a `.zip` file. 

## Getting started 

Your best bet is to download the entire DaytaShayR Example folder as a `.zip` file and unzip it to your desktop or thumb drive. 
Put it in a folder you can find later because you need to update the `R` script with a file path to the folder to get the most out of the example scripts. 

*Note of course this whole thing assumes you have `R` installed on your machine. 
If not, run over to [https://www.r-project.org/](https://www.r-project.org/) and get it. 
While you are at it, you might as well install [R studio](https://www.rstudio.com/products/rstudio/download/), too.*

## What's included

The Example folder has several files and a folder. 
The folder, `data`, has a made-up dataset that I use in my [Analysis of Ecosystems](https://github.com/devanmcg/rangeR/tree/master/Analysis%20of%20Ecosystems) course to demonstrate why ecologists often must use linear mixed-effect regression instead of ordinary least-squares regression (and get better results doing so). 
It is saved in the `.Rdata` format (there should also be a `.csv` file in there, too). 

There are three script files:

* `ExampleBasicScript.R` is an example of the bare minimum type of file one should include with data when uploading as supplementary material. 
This is really where one starts to turn the perfunctory nod to 'data transparency' into an enthusiastic head-waggle of analytical reproducibility. 
With both your data *and* your script, your fans (and, alas, your jealous haters) can pull the hood off your Methods section and see how you did those brilliant analyses, and if you care to share, how you made those stunning graphs. (And even before that, your editor and even reviewers can have confidence you did things right, and if not, might be able to give you specific tips for improvement rather than reject your paper outright.)
The file I've included here has two qualities: 
  + It is heavily commented.
  This might mostly be for your benefit, dear reader; you probably don't have to walk everyone through your script in such detail, but it can't hurt. 
  + It 'flows' well enough that it can be `source`d as-is (or at least once the user has specified local file paths). 
  This point leads us to the second file:
* `ExampleBasicRmarkdownScript.R` has just two `R`unnable commands -- it installs the `rmarkdown` package and renders the `ExampleBasicScript.R` file into an .`html` (or Word) document that allows one to see the output of the script in the order in which it is run. 
Especially for those `R` users not using R studio or who are not yet familiar with the 'knit' button, This is a convenient way for folks to see your data in action. 
* `ExampleBetterRmarkdown.Rmd` is a full-fledged R markdown file. 
It can be compiled with the `render` function as above, or with the 'knit' button in R studio. 
It leverages the full functionality of markdown to combine written text and `R` script (distinguished as such by specific code 'chunks') to see both `R` inputs and outputs. 
This is probably overkill for the basic goal of sharing data and script as supplemental files for a manuscript, but it is a great way to prepare more content-oriented supplemental material and appendices.
