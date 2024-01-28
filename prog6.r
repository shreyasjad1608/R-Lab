library(forecast)

sales_data<-data.frame(
  month<-seq(as.Date("2023-01-01"),as.Date("2023-12-01"),by="months"),
  sales<-c(12000,15000,18000,16000,20000,22000,23000,25000,29000,32000,35000,37000)
)

print(sales_data)
print(sales_data$month)
print(sales_data$sales)

sales_ts<-ts(sales_data$sales,frequency = 12)
print(sales_ts)

arima_model<-auto.arima(sales_ts)

forecast_result<-forecast(arima_model,h=4)

print(forecast_result)
plot(forecast_result)