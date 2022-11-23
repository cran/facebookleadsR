## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_facebookleads_data.RData")

## ----setup--------------------------------------------------------------------
library(facebookleadsR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_facebookleads_data <-
#    fetch_facebookleads(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_facebookleads_data)

## -----------------------------------------------------------------------------
ggplot(my_facebookleads_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_facebookleads_data, family = "poisson")
summary(lmod)

