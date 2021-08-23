## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(dplyr)

## ----setup, message=FALSE-----------------------------------------------------

# install from CRAN
# install.packages(tidycharts)

library(tidycharts)


## ----data---------------------------------------------------------------------
data_barchart <- data.frame(
  dep = c('Services', 'Production', 'Marketing', 'Purchasing'),
  profit = c(12, 15, 2, -3),
  operational = c(9, 7, 1.5, -0.4),
  property = c(2, 4, 0.5, -0.6),
  bonus = c(1, 4, 0, -2),
  prev_year = c(10, 16, 4, -1),
  plan = c(11, 13, 2, -2.5)
)

## ----base-barchart------------------------------------------------------------

bar_chart(data = data_barchart, cat = data_barchart$dep, series = 'profit') %>% 
  SVGrenderer()


## ----barchart-title-----------------------------------------------------------
bar_chart(data = data_barchart, cat = data_barchart$dep, series = 'profit') %>% 
  add_title('The company XYZ', 'Profit', 'in mEUR', 'by departments, 2020') %>% 
  SVGrenderer()

## ----barchart-stacked---------------------------------------------------------
bar_chart(data = data_barchart, cat = data_barchart$dep, 
              series = c('operational', 'property', 'bonus')) %>%  
  add_title('The company XYZ', 'Profit', 'in mEUR', 'by departments, 2020') %>% 
  SVGrenderer()

## ----barchart-normalized------------------------------------------------------
bar_chart_normalized(data = data_barchart, cat = data_barchart$dep,
                         series = c('operational', 'property', 'bonus')) %>% 
  SVGrenderer()

## ----barchart-index-----------------------------------------------------------
bar_chart_reference(data = data_barchart,
                    cat = data_barchart$dep, series = 'profit', 
                    ref_val = 10, ref_label = 'PY best result') %>% 
  SVGrenderer()

## ----barchart-grouped---------------------------------------------------------

styles <- data.frame(profit = rep('actual', 4),
                     plan = rep('plan', 4),
                     prev_year = rep('previous',4))

bar_chart_grouped(data = data_barchart,
                  cat = data_barchart$dep,
                  foreground = 'prev_year',
                  background = 'profit',
                  markers = 'plan',
                  series_labels = c('PY', 'AC', 'PL'),
                  styles = styles) %>% 
  SVGrenderer()

## ----barchart-abs-variance----------------------------------------------------
bar_chart_absolute_variance(cat = data_barchart$dep, 
                                baseline = data_barchart$plan,
                                real = data_barchart$profit,
                                y_title = 'Plan vs. actual',
                                y_style = 'plan') %>% 
  SVGrenderer()

## ----barchart-rel-variance----------------------------------------------------
bar_chart_relative_variance(cat = data_barchart$dep, 
                                baseline = data_barchart$plan,
                                real = data_barchart$profit,
                                y_title = 'Plan vs. actual',
                                y_style = 'plan') %>% 
  SVGrenderer()


## ----scatter-data-------------------------------------------------------------
scatter_data <- mtcars[c('hp','qsec','cyl', 'wt')]

## ----scatter------------------------------------------------------------------
scatter_plot(scatter_data, x = scatter_data$hp, y = scatter_data$qsec, 
             legend_title = '') %>% SVGrenderer()


## ----scatter2-----------------------------------------------------------------
scatter_plot(scatter_data, x = scatter_data$hp,
             y = scatter_data$qsec, 
             cat = scatter_data$cyl, 
             legend_title = 'No. cylinder') %>% SVGrenderer()


## ----bubble-------------------------------------------------------------------
scatter_plot(scatter_data, x = scatter_data$hp,
             y = scatter_data$qsec, 
             cat = scatter_data$cyl, 
             bubble_value = scatter_data$wt,
             legend_title = 'No. cylinders') %>% SVGrenderer()

## -----------------------------------------------------------------------------
data_time_series <- data.frame(
  time = month.abb,
  Poland = 2 + 0.5 * sin(1:12),
  Germany = 3 + sin(3:14),
  Slovakia = 2 + 2 * cos(1:12)
)

## ----columnchart-basic--------------------------------------------------------
column_chart(data_time_series, x = 'time', 
             series = c('Poland', 'Germany', 'Slovakia'), interval = 'months') %>% 
  SVGrenderer()

## ----columnchart-waterfall----------------------------------------------------
data_time_series %>% group_by(time) %>%
  summarise(Sales = sum(Poland, Germany, Slovakia)) %>%
  arrange(match(time, month.abb)) %>% 
  mutate(Sales = round(cumsum(Sales), 2)) -> df_summarized

column_chart_waterfall(df_summarized, x = 'time', series = 'Sales') %>% 
  SVGrenderer()

## ----linechart-basic----------------------------------------------------------
set.seed(123)
data_companies <- data.frame(
  time = 2010:2020,
  Alpha.inc = 25 + round(1:11 + rnorm(11)),
  Beta.inc = round(40 + rnorm(11, sd = 2)),
  Gamma.inc = round(50 + rnorm(11, sd = 5))
)

line_chart_markers(data_companies, x = data_companies$time,
          series = c('Alpha.inc', 'Beta.inc', 'Gamma.inc'),
          series_labels = c('Alpha.inc', 'Beta.inc', 'Gamma.inc'),
          interval = 'years') %>% 
  SVGrenderer()

## ----linechart_dense----------------------------------------------------------

data_dense <- data.frame(
  dates = seq.Date(as.Date('2019-01-01'), as.Date('2019-12-31'), by = 1),
  Warsaw = 7 + 9 * sin((365:1 - 60)/ 365 * 2 * pi) + rnorm(365, sd = 2),
  London = 8 + 5 * sin((365:1 - 55)/ 365 * 2 * pi) + rnorm(365, sd = 1.2)
)

line_chart_dense(data_dense, 'dates', c('Warsaw', 'London')) %>%
  add_title('Temperature in European Cities', 'Daily mean', 'in deg. C', 'In 2019') %>% 
  SVGrenderer()

