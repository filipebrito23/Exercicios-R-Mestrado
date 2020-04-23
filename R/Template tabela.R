install.packages("devtools")
install.packages("formattable")

df <- data.frame(
  id = 1:10, 
  Nomes = c("Sofia", "Kiara", "Dunki", "Edgar", "Emilia","Gertrudes", "Genovena", "Champanhe", "Amora", "Penelope"),
  Kilos = accounting(c(20000, 30000, 50000, 70000, 47000,80000,45000,35000,20000,25000), format = "d"),
  Crescimento = percent(c(0.1, 0.2, 0.5, 0.95, 0.97,0.45,0.62,0.57,0.37, 0.3), format = "d"),
  Suficiente = formattable(c(T, F, T, F, T,F,F,T,T,F), "Sim", "Não")
)

formattable(df, list(
  id = color_tile("white", "orange"),
  Suficiente = formatter("span", style = x ~ ifelse(x == T, 
                                                    style(color = "green", font.weight = "bold"), NA)),
  area(col = c(Kilos)) ~ normalize_bar("lightgrey", 0.2),
  Crescimento = formatter("span",
                          style = x ~ style(color = ifelse(rank(-x) <= 3, "green", "gray")),
                          x ~ sprintf("%.2f (rank: %02g)", x, rank(-x)))
))