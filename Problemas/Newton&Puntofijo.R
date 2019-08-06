puntofijo=function(g,x0,tolerancia,Maxiter){
  xi=g(x0)
  x0=xi
  err=abs(xi-x0)
  i=1
  while (err > tolerancia ||i<(Maxiter-1))
  { 
    cat("x_",i,"=",g(x0),"\n")
    xi=g(x0)
    x0=xi
    err=abs(xi-x0)
    i=i+1
    
  }
  
  if(err>tolerancia){
    cat("no hubo convergencia")
  }
  if (err<=tolerancia){ 
  cat("x* es aproximadamente",xi,"con un error < ",tolerancia)
  
 }
}
  
