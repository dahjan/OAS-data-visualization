library(shiny)
library(dplyr)
library(ggplot2)

# Source plot theme
source("helpers.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # Load the requested dataset
    plot_input <- reactive({
        # Load file
        file_loc <- paste0("data/", input$dataset, "/df_",
                           input$dataset, ".RData")
        df <- readRDS(file_loc)

        return(df)
    })

    # Load the fullly joined dataset
    full_input <- reactive({
        # Load file
        file_loc <- paste0("data/", input$dataset, "/df_",
                           input$dataset, "_", input$meta,
                           ".RData")
        df <- readRDS(file_loc)

        return(df)
    })


    output$n_seq <- renderText({
        # Get number of sequences
        n <- sum(plot_input()$n)

        # Format the number
        f <- format(n, big.mark="'")

        paste("The", input$dataset, "dataset contains <strong>", f, "sequences</strong>.")
    })

    output$bar_plot <- renderPlot({
        # Get df from plot_input
        df <- plot_input() %>%
            dplyr::rename(x = author_short)

        # Largest group
        max <- max(df$n)

        # Barplot, ordered by n
        if(input$scale_overview == 1) {
            # Log scale plot
            create_bar_plot(df, label="Sequence count (log)") +
                scale_y_log10(limits = c(0.5, 1.5*max)) +
                mytheme()
        } else {
            # No log scale
            create_bar_plot(df, label="Sequence count") +
                scale_y_continuous(labels = scales::scientific,
                                   limits = c(0, 1.1*max)) +
                mytheme()
        }
    })

    output$meta_title <- renderText({
        paste("Metadata visualization for the", input$dataset, "dataset")
    })

    output$meta_plot <- renderPlot({
        # Get df from plot_input
        df <- full_input()

        # Largest group
        max <- max(df$n)

        # Barplot, ordered by n
        if(input$scale_meta == 1) {
            # Log scale plot
            create_bar_plot(df, label="Sequence count (log)") +
                scale_y_log10(limits = c(0.5, 1.5*max)) +
                mytheme()
        } else {
            # No log scale
            create_bar_plot(df, label="Sequence count") +
                scale_y_continuous(labels = scales::scientific,
                                   limits = c(0, 1.1*max)) +
                mytheme()
        }

    })

})