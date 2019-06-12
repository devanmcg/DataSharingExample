# This R script demonstrates a case in which linear mixed-effect regression 
# is a better analytical solution than ordinary least-squares regression
# 
# Posted to https://github.com/devanmcg/DaytaShayR as an example of 
# using R and R files to share data and script. 
#
# Shared under CC BY 4.0 by Devan Allen McGranahan (devan.mcgranahan@gmail.com)
#
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
    LocalPath <- "C:/Users/Devan.McGranahan/GoogleDrive/DaytaShayR/Example" # 'C:/Users/Me/Documents/R'
#
# Now load the files, one way or the other:
  # via the working directory:
    # load('./data/ExampleFireResponse.Rdata') # remove initial comment (#) to use
  # via full file path (suitable for .Rmd files, etc)
    load(paste(LocalPath, "/data/ExampleFireResponse.Rdata", sep=""))
#
#   O L S   R E G R E S S I O N   w/ lm()
#
# A basic boxplot
#
  ggplot(FireResponse) + theme_bw(16) +
    geom_boxplot(aes(x=burn.season, 
                     y=biomass)) + 
    geom_point(data= . %>%
                 group_by(burn.season) %>%
                  summarize(biomass = mean(biomass)), 
               aes(x=burn.season, y=biomass), 
               pch=24, size=5, stroke=2) 
#
# A basic linear regression
  lm1 <- lm(biomass ~ burn.season, FireResponse) 
  anova(lm1)
#
#   L I N E A R   M I X E D - E F F E C T   R E G R E S S I O N   w/ lmer()
#
# Plot variability by two different sampling locations (pastures w/in ranches)
#
  ggplot(FireResponse) + theme_bw(16) +
    geom_boxplot(aes(x=pasture, 
                     y=biomass, 
                     fill=burn.season)) + 
    geom_point(data= . %>%
                 group_by(ranch, pasture, burn.season) %>%
                 summarize(biomass = mean(biomass)), 
               aes(x=pasture, y=biomass, 
                   fill=burn.season), 
               pch=24, color="black", 
               size=3, stroke=1.5,
              position = position_dodge(width=0.75)) + 
    facet_wrap(~ranch) 
#
# Fit a lmer model that accounts for spatial nestedness (non-independence)
#
  pacman::p_load(lme4)
  resp.lmer <- lmer(biomass ~ burn.season + (1|ranch/pasture), 
                    data=FireResponse, REML=FALSE)
# View a plot of the residuals    
  pacman::p_load(broom)
  augment(resp.lmer) %>%
    ggplot(aes(x = .fitted, y = .resid)) + theme_bw(14) +
      geom_hline(yintercept = 0, lty=2) +
      geom_point() +
      geom_smooth(method="lm") 
# Retrieve fixed-effect coefficients
  fixef(resp.lmer) 
# View ANOVA table
  anova(resp.lmer) 
# Use car::Anova to get a P value from the ANOVA table
  pacman::p_load(car)
  Anova(resp.lmer)
# Or  fit a null (intercept-only) model
# For AIC-based comparison:
  resp.null <- lmer(biomass ~ 1 + (1|ranch/pasture), 
                    data=FireResponse, REML=FALSE)
  anova(resp.null, resp.lmer)
# Calculate 95% confidence intervals for regression parameters 
  confint(resp.lmer)
# Calculate a goodness-of-fit statistic 
# (pseudo R-squared from package MuMIn)
  pacman::p_load(MuMIn)
  r.squaredLR(resp.lmer)