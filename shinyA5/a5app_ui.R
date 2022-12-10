library(shiny)
Intro <- tabPanel(
  "Introduction",
  h1("CO2 Emissions Per Capita Across the Globe"),
  h3("Introduction"),
  p("This report will display and analyze data about C02 and Greenhouse gas emissions using data extracted from 'Our World in Data'. This report will specifically review variables such as CO2 emissions per capita by country. This page will examine several variables regarding CO2 emissions per capita across the dataset. The following page will show a chart examining the relationship between CO2 emissions per capita and the year for each country in the dataset."),
  br(),
  h3("Values of Interest"),
  p("The values of interest that I chose to specifically examine and determine were the country with the highest CO2 emissions per capita, the one with the lowest CO2 emissions per capita and the year with the highest CO2 emissions per capita. The country with the highest CO2 emissions per capita was Sint Maarten with 824.457. There were many countries that had 0 emissions per capita such as Uzbekistan, Tuvalu, Singapore, and Romania. The year that had the highest CO2 emissions was 1954."),
  )

  
#----------------------------------------------------------------------------------------------------------------

interactive_page <- tabPanel(
  "Interactive Chart",
  titlePanel("CO2 Emissions per Capita Across the World"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider2", label = h3("Year Range"), min = 1750, 
                  max = 2021, value = c(1750, 2021)),
      selectInput("Country", "Select Country", choices = unique(data$country))
    ),
    mainPanel(
      plotlyOutput(outputId = "Plot"),
      mainPanel(
        p("This chart shows the relationship between each country and the amount of CO2 emissions that they give off per capita between the years 1750 and 2021. There are two widgets on the side that allow the user to select each country to view as well as change the range of years being shown on the graph."),
        p("Some trends to note throughout this graph are the increase across the board in CO2 emissions. There is a dramatic increase around 1950 for a large majority of the countries.")
        
      )
    )
  )
)

#-----------------------------------------------------------------------------------------------------------
ui <- navbarPage("CO2 Emissions per Capita Across the World",
                 theme = shinythemes::shinytheme("readable"),
                 Intro,
                 interactive_page
                 )

