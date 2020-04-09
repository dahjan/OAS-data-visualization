library(shiny)
library(dplyr)
library(shinycssloaders)

# Define UI for application that draws a histogram
shinyUI(navbarPage("OAS",
    
    # Dataset overview  -----------------------------------------------
    
    tabPanel("Overview",
    
        # Application title
        titlePanel("Overview OAS datasets"),
        
        # Sidebar
        sidebarLayout(
            
            sidebarPanel(
                selectInput("dataset", 
                            label = "Choose a dataset to display",
                            choices = c("Human light-chain (LCH)" = "LCH",
                                        "Murine heavy-chain (HCM)" = "HCM",
                                        "Human heavy-chain (HCH)" = "HCH"),
                            selected = "LCH"),
                radioButtons("scale_overview", 
                             label = "Use log scale?",
                             choices = c("Yes" = 1,
                                         "No" = 0),
                             selected = 1)
            ),
            
            # Main panel for displaying outputs
            mainPanel(
                tags$p(htmlOutput("n_seq")),
                plotOutput("bar_plot") %>%
                    withSpinner(color="#0dc5c1")
            )
        )
    ),
    
    tabPanel("Metadata",
             
        # Application title
        titlePanel(htmlOutput("meta_title")),
        
        # Sidebar
        sidebarLayout(
            
            sidebarPanel(
                selectInput("meta", 
                            label = "Choose a metadata entry",
                            choices = c("Age",
                                        "Disease",
                                        "B-Cell source" = "BSource",
                                        "B-Cell subset" = "BType",
                                        "Isotype"),
                            selected = "Age"),
                radioButtons("scale_meta", 
                             label = "Use log scale?",
                             choices = c("Yes" = 1,
                                         "No" = 0),
                             selected = 1)
            ),
            
            # Main panel for displaying outputs
            mainPanel(
                plotOutput("meta_plot") %>%
                    withSpinner(color="#0dc5c1")
            )
        )
    )
))

# Murine heavy-chain data  -----------------------------------------------

# Human heavy-chain data  -----------------------------------------------