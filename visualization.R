library(readxl)
library(plotly)

source("data_fetch.R")

data <- data_fetch("PopulationJapan/Source/")

data_p <- data
data_p$Year <- as.factor(data_p$Year)

fig <- plot_ly(data_p, x=~Month, y=~Death, color=~Year,
               mode = 'lines+markers') %>% 
        layout(title="Total Death by Month in Japan",
               legend=list(traceorder="reversed"))
fig
