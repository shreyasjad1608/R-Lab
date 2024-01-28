library(dplyr)

#create dataframe to store details
student_data <- data.frame(
  usn = numeric(0),
  Name = character(0),
  math_score = numeric(0),
  science_score = numeric(0),
  history_score = numeric(0),
  average_score = numeric(0),
  attendance = numeric(0)
)

#function to add new student
add_student <- function(usnn, name, math, science, history, atten) {
  avg <- (math + science + history) / 3
  new_student <- data.frame(
    usn = usnn,
    Name = name,
    math_score = math,
    science_score = science,
    history_score = history,
    average_score = avg,
    attendance = atten
  )
  student_data <<- bind_rows(student_data, new_student)
  cat("Student details updated\n")
}


identify_low_attendance <- function(threshold) {
  low_attendance <- filter(student_data, attendance < threshold)
  if (nrow(low_attendance) == 0) {
    cat("No students have less attendance\n")
  } else {
    cat("Attendance shortage\n")
    print(select(low_attendance, usn, Name, attendance))
  }
}

generate_report <- function() {
  cat("Performance Report\n")
  print(select(student_data, usn, Name, average_score, attendance))
  cat("Attendance Shortage\n")
  identify_low_attendance(70)
}

#main program
while (TRUE) {
  cat("\n1. Add Student\n2. Generate Report\n3. Exit\n")
  choice <- as.integer(readline("Enter choice: "))
  if (choice == 1) {
    usnn <- as.integer(readline("Enter USN: "))
    name <- readline("Enter name: ")
    math_score <- as.integer(readline("Enter math score: "))
    science_score <- as.integer(readline("Enter science score: "))
    history_score <- as.integer(readline("Enter history score: "))
    atten <- as.integer(readline("Enter attendance: "))
    add_student(usnn, name, math_score, science_score, history_score, atten)
  } else if (choice == 2) {
    generate_report()
  } else if (choice == 3) {
    break
  } else {
    cat("Invalid choice entered\n")
  }
}
