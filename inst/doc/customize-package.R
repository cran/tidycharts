## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(tidycharts)

## ----defaults-----------------------------------------------------------------
data_time_series <- data.frame(
  time = month.abb[1:8],
  Poland = round(2 + 0.5 * sin(1:8), 2),
  Germany = round(3 + sin(3:10), 2),
  Slovakia = round(2 + 2 * cos(1:8), 2)
)
column_chart(data_time_series, x = 'time', 
             series = c('Poland', 'Germany', 'Slovakia'), interval = 'months')

## ----colors-------------------------------------------------------------------
color_df <- data.frame(
  bar_colors = c("rgb(61, 56, 124)", 
                 "rgb(0,89,161)", 
                 "rgb(0,120,186)", 
                 "rgb(0,150,193)",
                 "rgb(0, 178, 184)", 
                 "rgb(0,178,184)"),
  text_colors = c("white", 
                  "white", 
                  "white", 
                  "white",
                  "white", 
                  "black")
)

## ----set-colors---------------------------------------------------------------
set_colors(color_df)

## ----customized-chart---------------------------------------------------------
column_chart(data_time_series, x = 'time', 
             series = c('Poland', 'Germany', 'Slovakia'), interval = 'months')

## ----styles-default-----------------------------------------------------------
column_chart(data_time_series, x = 'time', 
             series = 'Poland', interval = 'months',
             styles = c(rep('actual',7), 'plan'))

## ----user-styles--------------------------------------------------------------
styles_df <- rbind(
  actual = list(fill = "rgb(64,64,64)", stroke = "rgb(64,64,64)" ),
  fictual = list(fill = "rgb(221,28,119)", stroke = "rgb(136,86,167)")
)

set_styles(styles_df)

## ----styles-custom------------------------------------------------------------
column_chart(data_time_series, x = 'time', 
             series = 'Poland', interval = 'months',
             styles = c(rep('actual',7), 'fictual'))

## -----------------------------------------------------------------------------
restore_defaults()

