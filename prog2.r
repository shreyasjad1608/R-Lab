#assing number of students and course
num_students<-5
num_courses<-5

student_names<-c("Aadavan","Abhinou","Aryan","Anirudh","Jadhav")

course_marks<-matrix(c(
  80,90,89,91,89,
  90,87,85,75,89,
  92,75,87,90,86,
  94,67,99,78,80,
  89,91,93,72,97
),nrow=num_students,byrow=TRUE)

print(course_marks)

student_records<-list()

for(i in 1:num_students)
{
  name<-student_names[i]
  #calculate marks
  total_marks<-sum(course_marks[i,])
  average_marks<-total_marks/num_courses
  
  #determining grade
  grade<-ifelse(average_marks>=90,"A",
                ifelse(average_marks>=80,"B",
                       ifelse(average_marks>=70,"C",
                              ifelse(average_marks>=60,"D",
                                     ifelse(average_marks>=50,"E","F")))))
  #updating records
  record<-list(name=name,marks=course_marks[i,],total=total_marks,
               avg=average_marks,grade=grade)
  student_records<-append(student_records,list(record))
}


#displaying student information
cat("\nSTUDENT INFORMATION\n")
cat(sprintf("Name \t total marks \t average marks \t grade\n"))
for(i in student_records)
{
  cat(sprintf("Name:%s\n",i$name))
  cat("Marks:",i$marks,"\n")
  cat("Total and avg marks:",i$total,i$avg,"\n")
  cat("Grade:",i$grade,"\n")
}