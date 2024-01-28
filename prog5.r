library(dplyr)

#create dataframe to store detials
student_data<-data.frame(
  usn<-character(0),
  Name<-character(0),
  math_score<-numeric(0),
  science_score<-numeric(0),
  history_score<-numeric(0),
  average_score<-numeric(0),
  attendance<-numeric(0)
)

#function to add new student
add_student<-function(usnn,name,math,science,history,atten){
  avg<-(math+science+history)/3
  new_student<-data.frame(
  usn<-usnn,
  Name<-name,
  math_score<-math,
  science_score<-science,
  history_score<-history,
  average_score<-avg,
  attendance<-atten)
  student_data<-bind_rows(student_data,new_student)
  cat("Student details updated")
}


identify_low_attendance<-function(threshold){
  low_attendance<-filter(student_data,attendance<threshold)
  if(nrow(low_attendance)==0){
    cat("no students have less attendance")
  }
  else{
    cat("attendance shortage")
    print(select(low_attendance,usn,Name,attendance))
  }
}

generate_report<-function(){
  print("Performance Report")
  print(select(student_data,usn,Name,average_score,attendance))
  print("Attendance Shortage")
  identify_low_attendance(70)
}
#main program
while(TRUE){
  cat("\n1.add student/n2.Generate Report\n3.Exit\n")
  choice=as.integer(readline("enter choice\n"))
  if(choice==1){
    usnn<-as.integer(readline("enter usn"))
    name<-readline("enter name\n")
    math_score<-as.integer(readline("enter math score"))
    science_score<-as.integer(readline("enter science score"))
    history_score<-as.integer(readline("enter history score"))
    atten<-as.integer(readline("enter attendance"))
    add_student(usnn,name,math_score,science_score,history_score,atten)
  }
  else if(choice==2){
    generate_report()
  }
  else if(choice==3){
    break
  }
  else{
    cat("invalid choice enetred")
  }
}














































