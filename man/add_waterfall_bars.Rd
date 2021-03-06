% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/column_chart_functions.R
\name{add_waterfall_bars}
\alias{add_waterfall_bars}
\title{Add waterfall style bars to the column chart}
\usage{
add_waterfall_bars(
  svg_string,
  df,
  x,
  series,
  bar_width,
  styles = NULL,
  pos_color = "rgb(64,64,64)",
  neg_color = "black",
  add_result_bar = TRUE,
  result_bar_pos = "1",
  positive_prefix = "",
  result_bar_color = NULL,
  result_title = NULL,
  ref_value = 0,
  translate_vec = c(0, 0)
)
}
\arguments{
\item{svg_string}{the svg string to br appended, need to be finalized after}

\item{df}{data to be plotted - data frame in wide format}

\item{x}{vector to be on x axis}

\item{series}{character vector of column names representing series to split bars by it}

\item{bar_width}{the width of plotted bar}

\item{styles}{vector of styles of the bars}

\item{pos_color}{color to be associated with positive values (in string format)}

\item{neg_color}{color to be associated with negative values (in string format)}

\item{add_result_bar}{boolean flag to add result bar as the last bar or not.}

\item{result_bar_pos}{flag indicating position of the result bar. 1 - bar offset 1/9 category width right from the last bar. 2 - result bar as completely new bar. If add_result_bar is false, it is ignored.}

\item{positive_prefix}{how to indicate positive value, ie. "+" or ""(empty string).}

\item{result_bar_color}{color of result bar. If add_result_bar is false, it is ignored.}

\item{result_title}{title of result bar to be on x axis. If add_result_bar is false, it is ignored.}

\item{ref_value}{first bar starts from this value, intended to be used with add_first_bar function.}

\item{translate_vec}{2 element translation vector. By setting this parameter you can translate bars and legend.}
}
\value{
svg string with appended waterfall bars
}
\description{
Add waterfall style bars to the column chart
}
