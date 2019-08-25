#Análisis numérico
#Taller 2
#Fabián Pallares
#Santiago Jaramillo

library(pracma)
library(Matrix)
library(BB)
library(plot3D)

#PUNTO 1
#1A. FUNCIONES
n=4

D1<-eye(n, m = n)
D2<-ones(n, m = n)
D3<-zeros(n, m = n)

print(D1)
print(D2)
print(D3)

A = matrix(c(-8.1, -7, 6.123, -2, -1, 4,
             -3, -1, 0, -1, -5, 0.6,
             -1, 0.33, 6, 1/2), nrow=4, byrow=TRUE)
print("A")
print(A)

#1B. MATRIZ DE TRANSICIÓN
diagonalM <- function(mat) {
  
  mat[col(mat)!=row(mat)] <- 0
  
  return(mat)
}

D = diagonalM(A)
L = tril(A,k=-1)
U = triu(A,k=1)

T = (-solve(D))%*%(L+U)
print(T)
#Norma
print(norm(T,"F"))


#PUNTO 2
#2B. GAUSS-SEIDEL
print("Gauss-Seidel:")
b = matrix(c(1.45,3,5.12,-4), nrow=n, byrow=TRUE)
print(b)
tole = 1e-9
r = itersolve(A, b, tol=tole , method = "Gauss-Seidel")
print(r)

#2C. ITERACIONES DE JACOBI

jacobi2c <- function(A,b, x_k, tol){
  
  it = 0
  repeat
  {
    m1 = matrix(b-((L+U)%*%x_k))
    D1 = (solve(D))
    x_k1 = D1%*%m1
    cat("Error ",it," ",norm(x_k1-x_k,"F")/norm(x_k),"\n")
    x_k = x_k1
    it = it + 1
    if(it == tol)
      break
  }
  cat("Solución: ",x_k,"\n")
}

x0 = c(1,1,1,1)
x_k = matrix(x0)
tole = 5
jacobi2c(A, b, x_k, tole)

#PUNTO 3

#3A. ALGORITMO MODIFICADO


tril1 <- function(M, k = 0) {
  M[col(M)==row(M)] <- 0
  return(M)
}

M = matrix(c(7, 5, 8, 4, 2, 3, 4, 7, 6),nrow=3)
print(M)
print(tril2(M, k=1))

#3B.MATRIZ DIAGONAL DE A
diagonalM <- function(M) {
  M[col(M)!=row(M)] <- 0
  return(M)
}

M = matrix(c(7, 5, 8, 4, 2, 3, 4, 7, 6),nrow=3)
print(M)
print(diagonalM(M))

#Punto 4

#4. NUMERO DE MULTIPLICACIONES DE GAUSS JORDAN
numMultip = function(A, b){
  res = 0
  n = nrow(A)
  
  Ab = cbind(A, b)
  print(Ab)
  
  for (i in 1:(n-1)) {
    if (Ab[i, i] == 0){
      f = which(Ab[i, ] != 0)[1]
      Ab[c(i, f), ] = Ab[c(f, i), ]
    }
    for (j in (i+1): n){
      Ab[j, ] = Ab[j, ] - Ab[j, i] / Ab[i, i]*Ab[i, ]
      res = res + 2*(ncol(Ab))
    }
  }
  
  it = rep(NA, times = n)
  it[n] = Ab[n, n+1] / Ab[n, n]
  res = res + n + 1
  
  for (i in (n-1):1){
    x[i] = (Ab[i, n+1] - sum(Ab[i, (i+1):n] * it[(i+1):n])) / Ab[i, i]
    res = res + 2*(n-2)
  }
  cat("\nNumero de multiplicaciones: ", res, "\n")
  
}
A = matrix(c(-8.1, -7, 6.123, -2, -1, 4,
             -3, -1, 0, -1, -5, 0.6,
             -1, 0.33, 6, 1/2, 5, 7, 3, 2,
             5, 6, 7, 6, 9), nrow=5, byrow=TRUE)
b = matrix(c(1, 3, 5, 7, 9), nrow=5, byrow=TRUE)
numMultip(A, b)


#PUNTO 5

#5A. VALORES DE ALPHA Y BETA
#Primero hallamos los valores de alpha y beta
#con operaciones de suma de acuerdo a su posición en la matriz:
beta = 0 #beta + 1 < 2
alpha = 3 #alpha > 1+1 

A = matrix(c(2, 0, 1,
             beta,2 , -1,
             -1, 1, alpha), nrow=3, byrow=TRUE)
B = matrix (c(1,2,1),nrow=3, byrow=TRUE)
Ab = cbind(A,B)

print(Ab)

#5B Y 5C.

diagonalM <- function(M) {
  
  M[col(M)!=row(M)] <- 0
  
  return(M)
}

jacobi5b <- function(A, b, x_k, tole){
  it = 0
  repeat
  {
    m1 = matrix(b-((L+U)%*%x_k))
    D1 = (solve(D))
    x_k1 = D1%*%m1
    cat("Error ",it," ",norm(x_k1-x_k,"F")/norm(x_k),"\n")
    x_k = x_k1
    
    x[[it+1]] = x_k[1]
    y[[it+1]] = x_k[2]
    z[[it+1]] = x_k[3]
    cat("Solucion iteracion ",it+1,": ",x[[it+1]]," ",y[[it+1]]," ",z[[it+1]],"\n")
    it = it + 1
    
    if(it == tole)
      break
  }
  lines3D(x, y, z, colvar = z, col = NULL, add = FALSE, theta = 20, phi = 20)
  cat("Solucion a ", tol ," iteraciones: ",x_k,"\n")
}

D = diagonalM(A)
L = tril(A,k=-1)
U = triu(A,k=1)

x = 0
y = 0
z = 0

x0 = c(1,2,3)
x_k = matrix(x0)
jacobi5b(A, B, x_k, 10)


#PUNTO 6
#6. Descomponer y factorizar matriz
A = matrix(c(-8.1, -7, 6.123, -2,
             -1, 4,-3, -1,
             0, -1, -5, 0.6,
             -1, 0.33, 6, 1/2), nrow=4, byrow=TRUE)
print(A)
b = matrix(c(1.45,3,5.12,-4), nrow=4, byrow=TRUE)
print(b)

Ab = cbind(A,b)
print(Ab)

#DIAGONALES
L = tril(A,k=-1)
U = triu(A,k=1)
print(L) 
print(U)


#FACTORIZACION
g = gramSchmidt(A)
Q = g$Q
R = g$R
print(Q)
print (R)
print(Q%*%R)

#PUNTO 7
#7A. INTERSECCION
inter_ec <- function(x) {
  n = length(x)
  F = rep(NA, n)
  F[1] = x[1] - x[2]
  F[2] = x[1]^2 + x[2]^2 -1
  F
}
p0 = c(1,1) 
res = BBsolve(par=p0, fn=inter_ec)
res$par

plot(res$par)
plot(inter_ec)
funx <- function(x) x

plot(NULL, xlab = "x", ylab= "y", xlim = c(-1,1), ylim = c(-1,1))
theta = seq(0, 2*pi, length = 1000)
radius = 1
lines(-1:1,funx(-1:1),type = 'l', new = FALSE, xlim = c(-1,1), ylim = c(-1,1))
lines(x = radius * cos(theta), y = radius * sin(theta))
lines(res$par, col="red")

#7B. AnNALIZAR Y COMENTAR CÓDIGO
#Declaración de la función
trigexp = function(x) {
  #Tamaño del vector que llega como parametro
  n = length(x)
  #Se crea un vector vacío en donde irán las ecuaciones
  F = rep(NA, n)
  #Se declara la expresión a usar
  F[1] = 3*x[1]^2 + 2*x[2] - 5 + sin(x[1] - x[2]) * sin(x[1] + x[2])
  #Secuencia en la cual se evaluará. Desde 2 hasta n-1 (Siendo n el tamaño del vector)
  tn1 = 2:(n-1)
  #Evaluación tn1 veces
  F[tn1] = -x[tn1-1] * exp(x[tn1-1] - x[tn1]) + x[tn1] *
    ( 4 + 3*x[tn1]^2) + 2 * x[tn1 + 1] + sin(x[tn1] -
                                               x[tn1 + 1]) * sin(x[tn1] + x[tn1 + 1]) - 8
  #Se evalúa individualmente la última ecuación
  F[n] = -x[n-1] * exp(x[n-1] - x[n]) + 4*x[n] - 3
  F
}
#Intervalo de números que se usarán (0, 10000)
n = 10000
#Numeros aleatorios del 0 al 10000
p0 = runif(n) # n initial random starting guesses
#Solución del sistema trigexp
sol = BBsolve(par=p0, fn=trigexp)
#Solución encontrada con BBSolve
sol$par

#PUNTO 8
#8. PROBAR TRANSICION Y GAUSS - SEIDEL
n = 3
A <- Diag(rep(3,n)) + Diag(rep(-2, n-1), k=-1) + Diag(rep(-1, n-1), k=1)
x0 <- rep(0, n)
b = c(1, 2, 3)
res = itersolve(A, b, tol=1e-9 , method = "Gauss-Seidel")

D = diagonalM(A)
L = tril(A, k=-1)
U = triu(A, k = 1)
T = ((-solve(D)*-1)%*%U)%*%(-solve(diag(nrow=n)  + (L%*%-solve(D))))
print(T)
print(res)
