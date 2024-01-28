library(dplyr)
df=data.frame(
  id=c(1,2,3,4,5),
  name=c("Aadavan","Abhinou","Aryan","jedi","Shreyas"),
  age=c(20,20,20,20,21),
  score=c(78,88,98,88,76)
)


selected<-select(df,id,name,age)

mutated_df<-mutate(df,score_adjusted=score*1.1)

grouped_df<-group_by(df,age)

summarised_data<-summarise(grouped_df,avg_score=mean(score),max_age=max(age))

arranged_data<-arrange(df,age,desc(score))

df2=data.frame(
  id=c(3,4,5),
  gender=c("M","M","M")
)

joined_data<-left_join(df,df2,by="id")

print(selected)
print(mutated_df)
print(summarised_data)
print(arranged_data)
print(joined_data)