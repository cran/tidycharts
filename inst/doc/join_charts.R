## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

data_barchart <- data.frame(
  dep = c('Services', 'Production', 'Marketing', 'Purchasing'),
  profit = c(12, 15, 2, -3),
  operational = c(9, 7, 1.5, -0.4),
  property = c(2, 4, 0.5, -0.6),
  bonus = c(1, 4, 0, -2),
  prev_year = c(10, 16, 4, -1),
  plan = c(11, 13, 2, -2.5)
)

styles <- data.frame(profit = rep('actual', 4),
                     plan = rep('plan', 4),
                     prev_year = rep('previous',4))

## ----setup, message = FALSE---------------------------------------------------
library(tidycharts)

## ----barchart-join------------------------------------------------------------
join_charts(
  bar_chart_grouped(data = data_barchart,
                  cat = data_barchart$dep,
                  foreground = 'prev_year',
                  background = 'profit',
                  markers = 'plan',
                  series_labels = c('PY', 'AC', 'PL')),
  bar_chart_absolute_variance(cat = data_barchart$dep, 
                                baseline = data_barchart$plan,
                                real = data_barchart$profit,
                                y_title = 'Plan vs. actual',
                                y_style = 'plan'),
  bar_chart_relative_variance(cat = data_barchart$dep, 
                                baseline = data_barchart$plan,
                                real = data_barchart$profit,
                                y_title = 'Plan vs. actual',
                                y_style = 'plan'),
  nrows = 1,
  ncols = 3
) %>% SVGrenderer()

## ----mtcars-------------------------------------------------------------------
head(mtcars)

## ----facet--------------------------------------------------------------------
facet_chart(data = mtcars, 
            facet_by = 'cyl',
            ncols = 2,
            FUN = scatter_plot,
            x = mtcars$qsec,
            y = mtcars$hp,
            cat = mtcars$gear,
            legend_title = '',
            x_names = c('1/4 mile time', 'is s'),
            y_names = c('Horsepower', '')) %>% 
  SVGrenderer()


