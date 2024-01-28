library(ggplot2)
library(dplyr)

purchase_data<-data.frame(
  customer_id<-c(101,102,103,104,105),
  purchase_amount<-c(150,200,120,300,80)
)

#calculate statstical measures
mean_pur<-mean(purchase_data$purchase_amount)
median_pur<-median(purchase_data$purchase_amount)
sd_pur<-sd(purchase_data$purchase_amount)
q1_quartile<-quantile(purchase_data$purchase_amount,probs=0.25)
q3_quartile<-quantile(purchase_data$purchase_amount,probs=0.75)

#displaying results
#cat(sprintf("%f %f %f %f %f %f",mean_pur,median_pur,sd_pur,q1_quartile,q3_quartile))

#displaying histogram
ggplot(purchase_data,aes(x=purchase_amount))+
  geom_histogram(binwidth = 50,fill="blue",color="black")+
  labs(title="Distribution of Purchase amount",x="Purchase amount",y="Frequency")
