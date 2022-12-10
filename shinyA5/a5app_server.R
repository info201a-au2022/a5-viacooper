#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)
library(plotly)
library(shiny)
library(dplyr)
library(ggplot2)
library(hrbrthemes)
library(viridis)


#intro variables



#data <- read.csv("co2-data/owid-co2-data.csv")
data <- read.csv("owid-co2-data.csv")

plot_data <- data %>%
  select(country, co2_per_capita, year) %>%
  group_by(country)
  na.omit("world")

plot <- plot_data %>%
  ggplot(aes(x=year, y=co2_per_capita, color=country)) +
  geom_col() +
  scale_color_viridis(discrete = TRUE) +
  ggtitle("CO2 Emissions Across the World from 1750-2021") +
  theme_ipsum() +
  ylab("CO2 Emissions per Capita") 

highest_co2_country <- filter(plot_data, co2_per_capita == max(co2_per_capita)) %>%
  pull(country)

lowest_co2_country <- filter(plot_data, co2_per_capita == min(co2_per_capita))%>%
  pull(country)

highest_year <- filter(plot_data, co2_per_capita == max(co2_per_capita))%>%
  pull(year)



ggplotly(plot)




server <- function(input, output) {

               
output$Plot <- renderPlotly({
    co2_plot <- plot_data %>% 
      filter(country == input$Country) %>%
      filter(between(year, input$slider2[1], input$slider2[2]))
    plot <- co2_plot %>%
      ggplot(aes(x=year, y=co2_per_capita)) +
      geom_col() +
      scale_color_viridis(discrete = TRUE) +
      ggtitle("CO2 Emissions Across the World from 1750-2021") +
      theme_ipsum() +
      ylab("CO2 Emissions per Capita")
  return(plot)
})

}


