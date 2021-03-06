    require("EQL")
    require("ggplot2")
    require("reshape2")
    require("EnvStats")
    
    
    #Expansão de EdgeWorth
    edgeworth_t1 =function(y,n,r3,r4){
            dnorm(y)*(1+(r3*hermite(y,3))/(6*sqrt(n))
                      +(r4*hermite(y,4))/(24*n))
                      +((r3^2)*hermite(y,6)/(72*n))
    }
    
    
    #Parâmetros da distribuição escolhida (Weibull)
    n=25 #Tamanho
    lambda=1.5 #Parâmetro de escala
    k= 2 #Parâmetro de forma
    
    
    #Momentos e Cumulantes da distribuição
    m =lambda*gamma(1+(1/k)) #Cálculo da média
    V= (lambda^2)*gamma(1+(2/k))-m^2 #Variância
    r3=log((gamma(1+(3/k))*lambda^3)-(3*m*V^2)-m^3)/(V^3) #Simetria
    r4=log((gamma(1+(4/k))*lambda^4)-(4*r3*m*V^3)-m^4)/((V^4)-3) #Curtose
    
    
    #Valores empíricos da distribuição
    
    rep = 100000
    sim= rweibull(n*rep, shape=k, scale=lambda)
    x_emp= qemp(p=seq(0,1,length=1000),obs=sim)
    y_emp= demp(x_emp,sim)
    
    #Dist. Empírica da soma estocástica da distribuição
    x_sn= replicate(n,round(rweibull(rep, shape=k,scale=lambda),4))
    sn=apply(x_sn,1,sum)
    
    #Padronização da Sn e dist. empírica (Sn*)
    snp=(sn-n*m)/(sqrt(n*V))
    x_snp=qemp(p=seq(0,1,length=100), obs=snp)
    y_snp=demp(x_snp,snp)
    
    
    #Conjunto de dados
    total=data.frame(x=x_snp,d_emp=y_snp,edgeworth=edgeworth_t1(x_snp,n,r3,r4),
                     dist_normal=dnorm(x_snp))
    
    #Uso do reshape2 para validação
    
    total_f= melt(total,id.vars="x", variable.name="dist", value.name="fdp")
    
    #Gráficos
    
    ggplot(total_f, aes(x=x, y=fdp, group=dist, colour=dist))+
    geom_line()+
      scale_x_continuous(name = "x", limits = c(-2, 2))+
    scale_y_continuous(name = "fdp", limits = c(-0.25, 0.5))
    
  #theme(legend.justification =c(1.8,2), legend.position = c(1.8,2)
     #  , legend.box.margin = c(1,1,1,1)
  
  #ggplot(total_f, aes(x = x, y = fdp, colour = dist, ylim=(0,10000))) +
 #   geom_point()
  