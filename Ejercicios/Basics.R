#1. Write a R program to take input from the user (name and age) and display the values. Also print the version of R installation.

name = readline(prompt="Dime tu nombre: ")
age =  readline(prompt="Dime tu edad: ")
print(name)
print(age)
print(R.version)

#2. Write a R program to get the details of the objects in memory.

print(ls.str())

#3. Write a R program to create a sequence of numbers from 20 to 50 and find the mean of numbers from 20 to 60 and sum of numbers from 51 to 91.

seq(20,50)
mean(20,60)
sum(51,91)

#4.Write a R program to create a vector which contains 10 random integer values between -50 and +50.

sample(-50:50,10)

#5. Write a R program to get the first 10 Fibonacci numbers.

n1 <- 0
n2 <- 1
count <- 2
fibo<-vector()

fibo=c(fibo,n1)
fibo=c(fibo,n2)

while(count < 10) {
  nth = n1 + n2
  fibo=c(fibo,nth)
  n1 = n2
  n2 = nth
  count = count + 1
}
print("Fibonacci:")
print(fibo)

#7. Write a R program to print the numbers from 1 to 100 and print "Fizz" for multiples of 3, print "Buzz" for multiples of 5, and print "FizzBuzz" for multiples of both.

for (x in 1:100) {
  if (x%%3==0 & x%%5==0) {x<-"FizzBuzz"}
  else if (x%%3==0) {x<-"Fizz"}
  else if (x%%5==0) {x<-"Buzz"}
  print(x)
  
}
  
#9. Write a R program to find the factors of a given number.

number = as.integer(readline("Dime un número: "))

"""
Después de hacerlo he visto en la solución que factors es factores y yo he creído que eran factoriales, lo dejo aquí, ya que lo he hecho :(

fact=1
for(i in 1:number) {print(i)
    fact=fact*i}
    print(fact)
"""

for(i in 1:number) {
  if((number %% i) == 0) {
    print(i)
  }}

#10. Write a R program to find the maximum and the minimum value of a given vector.

maxmin<-c(1,2,3,4,5,6,7,8)
max(maxmin)
min(maxmin)

#13. Write a R program to create a list of random numbers in normal distribution and count occurrences of each value. COPIADO TAL CUAL DE LA SOLUCIÓN. SÓLO HE PROBADO A CAMBIAR FLOOR POR CEILING PERO, VAMOS, QUE NO SÉ DE QUÉ ME HABLAN...

n = ceiling(rnorm(1000, 50, 100))
print(n)
t = table(n)
print("Apariciones de cada valor:")
print(t)

#15. Write a R program to create three vectors numeric data, character data and logical data. Display the content of the vectors and their type.

nume<-c(1,2,3,4,5)
carac<-c("a","b","c","d","e")
logi<-c(T,T,F,F,T)

typeof(nume)
str(nume)
typeof(carac)
str(carac)
typeof(logi)
str(logi)

#22. Write a R program to create  bell curve of a random normal distribution. (n y t definidos en ejercicio 13)
barplot(t)

#25. Write a R program to create a Dataframes which contain details of 5 employees and display the details.

dff <- data.frame(Nombre=c("Cristina","Catalina","Cristino", "Catalino","Lechuguino"), Sexo=c("M","M","H","H","H"), Edad=c(47,24,64,56,18), Puesto=c("CEO","Portera","Secretario","Administrativo","Becario"))
print(dff)

#☺26. Write a R program to create a Data Frames which contain details of 5 employees and display summary of the data.

summary(dff)


