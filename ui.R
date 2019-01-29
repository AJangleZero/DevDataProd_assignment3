#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("UV-Vis spectra synthesis"),
  sidebarLayout(
    sidebarPanel(
       numericInput("pKas",
                   "Number of pKa values:",
                   min = 1,
                   max = 30,
                   value = 1),
       sliderInput("seed", "Set the seed: ",
                   min=1,
                   max=100,
                   value=10),
       submitButton("Submit")
    ),
    
    mainPanel(
       h4("UV-Vis spectra: "),
       plotOutput("spectra"),
       h4("pKa value(s) are: "),
       tableOutput("text"),
       
       h3("DOCUMENTATION: "),
       h4("This app is primarily intended for analytical chemist for for usage in chemical analysis. The output of this analysis are the plot of UV-Vis spectra and the table of it's pKa values. The output of the app depends on two input parameters: number of pKa values and set seed value that ensures the reproducibility. With given input, the app constructs a spectra for 20 randomly chosen pH values and creates UV-Vis spectra as sum of Gaussian functions for given number of pKa values. The pKa values are randomly given in the interval 0-14. Analytical chemists can use this given data to test their own prediction algorithms to predict pKa values, which could in turn be deployed in drug development or biotech companies as part of quality control systems. Please click SUBMIT to see changes in the app. More infor about the app can be found in: ")
    )
  )
))
