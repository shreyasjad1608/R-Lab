library(tidyr)
library(dplyr)
library(ggplot2)

set.seed(42)
customer_ids <- 1:100
# Generating 100 Random numbers from 10 to 200.
purchase_amount <- runif(100, min = 10, max = 200)
dummy_data <- data.frame(
  id= customer_ids,
  purchase_amount = purchase_amount
)
# Writing into a CSV file customer_purchases.csv
write.csv(dummy_data, "customer_purchases.csv", row.names = FALSE)

df<-read.csv("customer_purchases.csv")

total_records<-nrow(df)
unique_records<-n_distinct(df$id)

mean_p<-mean(df$purchase_amount)
mode_p<-mode(df$purchase_amount)
median_p<-median(df$purchase_amount)
sd_p<-sd(df$purchase_amount)

df$segment<-ifelse(purchase_amount<median_p,"Low spender","High spender")

print(df)

hist(df$purchase_amount,main="Distribution of Purchase Amount",xlab="Purchase amount",ylab="frequency",col="yellow",border="black")