calculate_fine<-function(days)
{
  if(days<=7)
    fine<-0
  else if(days<=30){
    fine_per_day<-2
    fine<-fine_per_day*(days-7)
  }
  else
    fine<-50
  return(fine)
}
calculate_fine2<-function(days)
{
  if(days<=7){
    fine<-0
  }else if(days>8 && days<=15){
    fine<-(days-7)*2
  }else if(days>16 && days<=30){
    fine<-(8*2)+(days-15)*3
  }else if(days>31 && days<=50){
    fine<-(8*2)+(15*3)+(days-30)*5
  }else{
    fine<--1
  }
  return(fine)
}

#main program
days=as.integer(readline("enter number of days after taking book"))
fine_amount<-calculate_fine(days)
fine_amount2<-calculate_fine2(days)
cat("fine amount1:",fine_amount,"\n")
cat("fine amount2:",fine_amount2,"\n")
if(fine_amount==0){
  cat("No FIne\n")
}else if(days<=50){
  cat("please pay fine\n")
}else
  cat("Maximum cap reached")