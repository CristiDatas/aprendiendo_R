#3. Write a R program to append value to a given empty vector. 
vector<- c()
valores<-c(1,2,3,4)
vector<-valores
vector

#6. Write a R program to find Sum, Mean and Product of a Vector.
sum(vector)
mean(vector)
prod(vector)

#7. Write a R program to find Sum, Mean and Product of a Vector, ignore element like NA or NaN.
sum(vector,na.rm=TRUE)
mean(vector,na.rm=TRUE)
prod(vector,na.rm=TRUE)

#8. Write a R program to find the minimum and the maximum of a Vector.
min(vector)
max(vector)

#9. Write a R program to sort a Vector in ascending and descending order.
sort(vector)
sort(vector,decreasing = TRUE)

#10. Write a R program to test whether a given vector contains a specified element.
print(is.element(3,vector))
print(is.element(5,vector))

#12. Write a R program to access the last value in a given vector.
print(tail(vector, n=1))

#13. Write a R program to find second highest value in a given vector.
l = length(vector)
print(sort(vector, partial = l-1)[l-1])

#14. Write a R program to find nth highest value in a given vector.
n<-as.integer(readline("Dime el puesto n: "))
print(sort(vector, TRUE)[n])

#16. Write a R program to convert given dataframe column(s) to a vector.
vector2<-c(5,6,7,8)
vector3<-c(9,10,11,12)
df <- data.frame(vector=1:4, vector2=5:8, vector3=9:12)
df

#20. Write a R program to reverse the order of given vector.
rev(vector)

#23. Write a R program to convert two columns of a data frame to a named vector.
nums<-c("num1","num2","num3","num4")
named_vector<-setNames(df$vector, nums)
named_vector
