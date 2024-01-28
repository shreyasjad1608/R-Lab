library(ggplot2)

matrix_A=matrix(runif(9,min = 1,max=10),nrow=3,ncol=3)
matrix_B=matrix(runif(9,min=1,max=10),nrow=3,ncol=3)

cat("Matrix A:",matrix_A,"\n")
cat("Matrix B:",matrix_B,"\n")

matrix_sum<-matrix_A+matrix_B
cat("Matrix sum:",matrix_sum,"\n")

scalar<-6
matrix_mul_sclar=matrix_A*scalar
cat("Scalar multipluication ",matrix_mul_sclar,"\n")

cat("Transpose of matrix A ",t(matrix_A),"\n")

cat("Hadamard multiplication ",matrix_A*matrix_B,"\n")

cat("Matrix multiplication of A and B is ",matrix_A%*%matrix_B,"\n")

cat("Sum of matrix A",sum(matrix_A),"\n")
cat("Mean of matrix A",mean(matrix_A),"\n")
cat("SD of matrix A",sd(matrix_A),"\n")




rows_sum<-rowSums(matrix_A)
barplot(rows_sum,main="Sum of Rows",xlab="Column",ylab="Frequency",col = "lightcoral")
col_sums<-colSums(matrix_B)
barplot(col_sums,main="Sum of Columns",xlab="Columns",ylab="Frequency",col = "yellow")
heatmap(matrix_A,main="Heatmap of Matrix A",xlab="Rows",ylab="Columns")
