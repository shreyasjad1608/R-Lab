library(dplyr)

student_data <- data.frame(
  usn = numeric(0),
  name = character(0),
  math_score = numeric(0),
  science_score = numeric(0),
  history_score = numeric(0),
  avg = numeric(0),
  attendance = numeric(0)
)

add_student <- function(usn, name, math, science, history, atten) {
  average <- (math + science + history) / 3
  new_student <- data.frame(
    usn = usn,
    name = name,
    math_score = math,
    science_score = science,
    history_score = history,
    avg = average,
    attendance = atten
  )
  student_data <<- bind_rows(student_data, new_student)
  cat("Updated\n")
}

low_attendance <- function(threshold) {
  low_attendance <- filter(student_data, attendance < threshold)
  if (nrow(low_attendance) == 0) {
    cat("NO student has low attendance ")
  } else {
    cat("attendance shortage list:\n")
    print(select(low_attendance, usn, name, avg, attendance))
  }
}

report <- function() {
  print("Performance Report")
  print(select(student_data, usn, name, avg, attendance))
  print("Attendance Shortage")
  low_attendance(70)
}

while (TRUE) {
  cat("\n1.add student\n2.Generate Report\n3.Exit\n")
  choice <- as.integer(readline("enter choice\n"))
  if (choice == 1) {
    usn <- as.integer(readline("enter usn\n"))
    name <- readline("enter name\n")
    math_score <- as.integer(readline("enter math score\n"))
    science_score <- as.integer(readline("enter science score\n"))
    history_score <- as.integer(readline("enter history score\n"))
    atten <- as.integer(readline("enter attendance\n"))
    add_student(usn, name, math_score, science_score, history_score, atten)
  } else if (choice == 2) {
    report()
  } else if (choice == 3) {
    break
  } else {
    cat("invalid choice\n")
  }
}
