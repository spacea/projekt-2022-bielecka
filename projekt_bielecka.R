library(tidyverse)
library(dplyr)

### 

menu = read.csv("MENU2.csv", encoding = "UTF-8")
menu

class(menu)
attributes(menu)

menu_stare = read.csv("ceny1.csv", encoding = "UTF-8")
menu_stare


#Prognoza wzrostu cen w przeciągu najbliższych lat (na podstawie zmiany średniej cen dań głównych na przestrzeni 6 miesięcy) 

nowe_ceny = mean(menu$CENA[1:41])
nowe_ceny
wzrost = menu$CENA[1:41] - menu_stare$CENA
wzrost
zmiana = mean(wzrost)
zmiana 
wzrost_roczny=1.37
srednia_stare_ceny= mean(menu_stare$CENA)
srednia_stare_ceny = 10.96
prognoza =  c(srednia_stare_ceny, srednia_stare_ceny+1.37, srednia_stare_ceny+(2*1.37), srednia_stare_ceny+(3*1.37), srednia_stare_ceny+(4*1.37), srednia_stare_ceny+(5*1.37))
lata= (2021.5:2026) 
lata

wzrost_cen = data.frame(cena = c(sr, sr+1.37, sr+(2*1.37), sr+(3*1.37), sr+(4*1.37), sr+(5*1.37)),
                   rok = 2021:2026)




ggplot(wzrost_cen, aes(x=cena,
                 y=rok)) + stat_smooth()  + geom_point()


##
#funkcje pozwalające na wyodrębnienie ceny najtańszego i najgroższego elementu z danej kategorii 
 
najtańsze = function(kategoria){
  if (kategoria == "N"){
    min(menu$CENA[menu$ID == "N"])}
  else if (kategoria == "O"){
    min(menu$CENA[menu$ID == "O"])}
  else if (kategoria == "P"){
    min(menu$CENA[menu$ID == "P"])}
  else if (kategoria == "PR"){
    min(menu$CENA[menu$ID == "PR"])}
  else if (kategoria == "DS"){
    min(menu$CENA[menu$ID == "DS"])}
  else if (kategoria == "D"){
    min(menu$CENA[menu$ID == "D"])}
  else if (kategoria == "S"){
    min(menu$CENA[menu$ID == "S"])}
  
}

najtańsze("N")

###

najdroższe = function(kategoria){
  if (kategoria == "N"){
  max(menu$CENA[menu$ID == "N"])}
  else if (kategoria == "O"){
  max(menu$CENA[menu$ID == "O"])}
  else if (kategoria == "P"){
  max(menu$CENA[menu$ID == "P"])}
  else if (kateoria == "PR"){
  max(menu$CENA[menu$ID == "PR"])}
  else if (kategoria == "DS"){
  max(menu$CENA[menu$ID == "DS"])}
  else if (kategoria == "D"){
  max(menu$CENA[menu$ID == "D"])}
  else if (kategoria == "S"){
  max(menu$CENA[menu$ID == "S"])}
}
  
najdroższe("O")




#funkcja pozwalająca na wyodrębnienie pozycji wegetariańskich 


Vege = function(kategoria){
    if (kategoria == "O"){
    menu$NAZWA[menu$ID == "O" & menu$CZY_VEGE == "V"]}
    else if (kategoria == "P"){
    menu$NAZWA[menu$ID == "P" & menu$CZY_VEGE == "V"]}
    else if (kategoria == "PR"){
    menu$NAZWA[menu$ID == "PR" & menu$CZY_VEGE == "V"]}
    else if (kategoria == "DS"){
    menu$NAZWA[menu$ID == "DS"& menu$CZY_VEGE == "V"]}
    else if (kategoria == "D"){
    menu$NAZWA[ menu$ID == "D" &menu$CZY_VEGE == "V"]}
    else if (kategoria == "S"){
    menu$NAZWA[menu$ID == "S" & menu$CZY_VEGE == "V"] }
    }
  
Vege("S")




#Funkcja pozwalająca sprawdzić użytkownikowi na jakie produkty z danej kategorii go stać 

na_co_wystarczy = function(kategoria, kwota){
  
  if (kategoria == "N"){
    menu$NAZWA[menu$CENA <= kwota &  menu$ID == "N"]}
  else if (kategoria == "O"){
    menu$NAZWA[menu$CENA <= kwota &  menu$ID == "O"]}
  else if (kategoria == "P"){
    menu$NAZWA[menu$CENA <= kwota &  menu$ID == "P"]}
  else if (kategoria == "PR"){
    menu$NAZWA[menu$CENA <= kwota &  menu$ID == "PR"]}
  else if (kategoria == "DS"){
    menu$NAZWA[menu$CENA <= kwota &  menu$ID == "DS"]}
  else if (kategoria == "D"){
    menu$NAZWA[menu$CENA <= kwota &  menu$ID == "D"]}
  else if (kategoria == "S"){
    menu$NAZWA[menu$CENA <= kwota &  menu$ID == "S"]}
  else if (!is.character(kwota)){
    print("Masz do wyboru kategorie: 'O' -obiad, 'P' - Pizza, 'S' - śniadanie, 'PR' - przekąska słona, 'DR' - deser, 'D' - dodatki, 'N' - Napój.")
  }
  
}
na_co_wystarczy("D", 2)


#ZESTAW 

#funckja pozwalająca wylosować użytkownikowi zestaw na podstawie wybranych przez niego kategorii 

zestaw = function(A,B,D){
  A == menu$ID
  B == menu$ID
  D == menu$ID
  sample(c(sample(menu$NAZWA[menu$ID == A],1), sample(menu$NAZWA[menu$ID == B],1), sample(menu$NAZWA[menu$ID == D],1)))
  }
zestaw("O","N","DS")




#jaka_pizza
##funkcja służąca do wyszukiwania możliwej do zakupu pizzy na podstawie podanego składnika 


grep("ananas", menu$SKŁADNIKI , value = TRUE)


jaka_pizza = function(skladnik){
  grep("skladnik", menu$SKŁADNIKI , value = TRUE)
  menu$NAZWA[menu$ID == "P"]
}

jaka_pizza(ananas)
   






