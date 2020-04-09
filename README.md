# Visualization of the Observed Antibody Space
The Observed Antibody Space is a Ig-seq collection from 58 experiments, covering over half a billion sequences. This effort was undertaken by Aleksandr Kovaltsuk et al., in The Journal of Immunology October 15, 2018, 201 (8) 2502-2509.

The goal of this Shiny application is to visualize the dataset together with its metadata. In the following, the different parts of the app are summarized.

------------

## Overvie

Barplot visualization of sequences found in all of the separate studies. Visualizations can be performed with or without a log-scaled y-axis. The total number of sequences in the currently selected dataset is shown at the top. If the text on top of the bars overlaps, make the application window larger.

## Metadata

Visualization of different metadata entries as bar plots. Again, an optional log-scale representation is available. Currently, this only works for human light-chain sequences; the rest will be added at a later point.

## Usage

In RStudio, open either server.R or ui.R, and press the button 'Run App', found at the top right of the script window.

In R, change to the directory with the aforementioned files, and run the command runApp().

## Required packages

shiny, shinycssloaders, dplyr, ggplot2

Those can be loaded with the command library(package).