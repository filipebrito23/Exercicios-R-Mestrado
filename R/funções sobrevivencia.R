# Kumaraswamy Wb

pdf_KWW <- function(par,x){ #Par = Parâmetro
  lambda=par[1]
  a = par[2]
  b = par[3]
  k = par[4]
  g <- (k/lambda)*(x/lambda)^(k-1)
  G <- 1 - exp(-(x/lambda)^k)
  a*b*g*(G^(a-1))*(1-G^a)^(b-1)
}
cdf_KWW <- function(par, x){
  lambda=par[1]
  a = par[2]
  b = par[3]
  k = par[4]
  G <- 1 - exp(-(x/lambda)^k)
  (1-(1-G^a)^b)
}


filipe <-  c(264.9, 314.1, 364.6, 379.8, 419.3, 457.4,459.4, 460.0, 490.3, 
             490.6, 502.2, 525.2, 526.8, 528.6, 528.6, 537.7, 539.6, 540.8,
             551.0, 573.5, 579.2, 588.2, 588.7, 589.7, 592.1, 592.8, 600.8, 
             604.4, 608.4, 609.8,619.2, 626.4, 629.4, 636.4, 645.2, 657.6, 
             663.5, 664.9, 671.7, 673.0, 682.6, 689.8,698.0, 698.6, 698.8, 
             703.2, 755.9, 786.0, 787.2, 798.6, 850.4, 895.1)
hist(filipe)
set.seed(20)
result_1= goodness.fit(pdf = pdf_KWW,cdf = cdf_KWW, 
                      starts = c(4,3,4,6), data = filipe,
                      method = "PSO",domain = c(0, Inf),
                      mle = NULL,lim_inf=c(0,0,0,0),
                      lim_sup=c(10,10,10,10),S=50,prop=0.1,N=40)
x = seq(0,50,length.out = 100)
hist(filipe, probability = TRUE, ylim = c(0,0.5))
lines(x, pdf_KWW(par= result_1$mle, x), col = "red")
curve(pdf_KWW(par=result_1$mle,x), add = T)
result_1

