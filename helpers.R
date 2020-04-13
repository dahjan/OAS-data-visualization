library(ggplot2)

mytheme <- function(){
  # Add a user-specific theme to each plot
  
  theme(
    text = element_text(size=15),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
}

create_bar_plot <- function(df, label){
  # Create a bar plot from the df, where x is equal to
  # the column labels, and n represents the count.
  # 
  # Input:
  #   df -- the dataframe to be plotted
  #   label -- the desired y-axis label

  ggplot(df, aes(reorder(x, -n), n)) +
    geom_bar(stat="identity") +
    xlab("") +
    ylab(label) +
    geom_text(aes(label = formatC(n, format="e", digits=1)),
              vjust = -0.5)
}