library(ggplot2)
library(tidyr)

student_data<-data.frame(
  name<-c("Aadavan","Abhinou","Aryan","Shreyas"),
  marks<-c(89,98,88,98),
  attendance<-c(88,78,68,77)
)

print(student_data)

a<-ggplot(student_data,aes(x=marks,y=attendance))+geom_point(aes(color=name))+
  theme_minimal()+labs(title="Marks VS Attendance",x="marks",y="attendance")
print(a)

#barplot

b<-ggplot(student_data,aes(x=name,y=marks))+geom_bar(stat = "identity",fill="blue")+labs(x="Names",y="Marks",title="Distribution of marks")
print(b)



#histrpgram
c<-ggplot(student_data,aes(x=marks))+geom_histogram(binwidth = 5,color="orange")+labs(title="Distribution of makrs",x="MArks",y="Frequnecy")
print(c)

#line plot
student_data$time<-seq_len(nrow(student_data))
line_plot<-ggplot(student_data,aes(x=time,y=marks,group=1))+geom_line(color="blue")
print(line_plot)

library(gridExtra)
grid.arrange(a,b,c,line_plot,ncol=2)