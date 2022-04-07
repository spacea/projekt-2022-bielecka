library(tidyverse)
library(dplyr)

### 

menu = read.csv("menu.csv", encoding = "UTF-8")
menu

class(menu)
attributes(menu)

menu_stare = read.csv("stare_menu.csv", encoding = "UTF-8")
menu_stare


#Prognoza wzrostu cen w przeciągu najbliższych lat (na podstawie zmiany średniej cen dań głównych na przestrzeni ostatniego roku) 

nowe_ceny = mean(menu$CENA[1:41])
nowe_ceny
stare_ceny = mean(menu_stare$CENA)
stare_ceny
wzrost_procentowy = 100 - (stare_ceny/nowe_ceny)*100
wzrost_procentowy
wzrost_roczny=11.15
prognoza =  c(wzrost_roczny, wzrost_roczny+11.15, wzrost_roczny+(2*11.15), wzrost_roczny+(3*11.15), wzrost_roczny+(4*11.15), wzrost_roczny+(5*11.15))
lata= (2021.5:2026) 
lata

wzrost_cen = data.frame(procent = c(wzrost_roczny, wzrost_roczny+11.15, wzrost_roczny+(2*11.15), wzrost_roczny+(3*11.15), wzrost_roczny+(4*11.15), wzrost_roczny+(5*11.15)),
                        rok = 2021:2026)


wzrost_cen

ggplot(wzrost_cen, aes(x=procent,y=rok)) + stat_smooth(method = "auto" , color="magenta")  + geom_point() +ggtitle("Procentowy wzrost średniej ceny dania głownego")+theme(plot.title=element_text(hjust=0.5))+xlab("wzrost procentowy") 

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
  else if (kategoria == "K"){
    min(menu$CENA[menu$ID == "K"])}
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
  else if (kategoria == "K"){
    min(menu$CENA[menu$ID == "K"])}
}

najdroższe("O")


###WYKRES 


library(tidyr)

dane = data.frame(nazwa = c("Danie główne","Deser","Napój","Śniadanie","Pizza","Przekąska słona","Dodatek","Kanapka"),
                  ceny_minimalne =c( min(menu$CENA[menu$ID == "O"]),min(menu$CENA[menu$ID == "DS"]),min(menu$CENA[menu$ID == "N"]),min(menu$CENA[menu$ID == "S"]),min(menu$CENA[menu$ID == "P"]),min(menu$CENA[menu$ID == "PR"]),min(menu$CENA[menu$ID == "D"]),min(menu$CENA[menu$ID == "K"])), 
                  ceny_maksymalne = c(max(menu$CENA[menu$ID == "O"]),max(menu$CENA[menu$ID == "DS"]),max(menu$CENA[menu$ID == "N"]),max(menu$CENA[menu$ID == "S"]),max(menu$CENA[menu$ID == "P"]),max(menu$CENA[menu$ID == "PR"]),max(menu$CENA[menu$ID == "D"]),max(menu$CENA[menu$ID == "K"]))) 
                 
#ceny maksymalne 

ggplot(dane, aes(nazwa,ceny_maksymalne)) + geom_bar(stat = "identity", color = "magenta") + theme_light() +
  ggtitle("Maksymalne ceny produktów z każdej kategorii")+theme(plot.title=element_text(hjust=0.5))+xlab("nazwa produktu") + ylab("cena najdroższego produktu")
  

#ceny minimalne 

ggplot(dane,aes(nazwa,ceny_minimalne)) + geom_bar(stat = "identity", color ="magenta") + theme_light() +
  ggtitle("Minimalne ceny produktów z każdej kategorii")+theme(plot.title=element_text(hjust=0.5))+xlab("nazwa produktu") + ylab("cena najtańszego produktu")

#funkcja pozwalająca na wyodrębnienie pozycji wegetariańskich 


Wege = function(kategoria){
  if (kategoria == "O"){
    menu$NAZWA[menu$ID == "O" & menu$WEGE == "W"]}
  else if (kategoria == "P"){
    menu$NAZWA[menu$ID == "P" & menu$WEGE == "W"]}
  else if (kategoria == "PR"){
    menu$NAZWA[menu$ID == "PR" & menu$WEGE == "W"]}
  else if (kategoria == "DS"){
    menu$NAZWA[menu$ID == "DS"& menu$WEGE == "W"]}
  else if (kategoria == "D"){
    menu$NAZWA[ menu$ID == "D" &menu$WEGE == "W"]}
  else if (kategoria == "S"){
    menu$NAZWA[menu$ID == "S" & menu$WEGE == "W"] }
}

Wege("S")




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



#zestaw_wege

#funckja pozwalająca wylosować użytkownikowi zestaw wegetariański na podstawie wybranej przez niego kwoty.

zestaw_wege = function(kwota){
  for (i in menu) {
    
    X = sample(menu$NAZWA[menu$ID == "O" & menu$WEGE == "W"],1)
    Y = sample(menu$NAZWA[menu$ID == "DS" & menu$WEGE == "W"],1)
    Z = sample(menu$NAZWA[menu$ID == "N" & menu$WEGE == "W"],1)
    losowanie = sum(menu$CENA[menu$NAZWA == X],menu$CENA[menu$NAZWA == Y],menu$CENA[menu$NAZWA == Z])
    if(losowanie <= kwota){
      cat(c(X,Y,Z), sep= ", ") 
      break
    }   
  }}

zestaw_wege(20) 


#funckja pozwalająca wylosować użytkownikowi zestaw na podstawie wybranej przez niego kwoty.

zestaw = function(kwota){
  for (i in menu) {
    
    X = sample(menu$NAZWA[menu$ID == "O"],1)
    Y = sample(menu$NAZWA[menu$ID == "DS"],1)
    Z = sample(menu$NAZWA[menu$ID == "N"],1)
    losowanie = sum(menu$CENA[menu$NAZWA == X],menu$CENA[menu$NAZWA == Y],menu$CENA[menu$NAZWA == Z])
    if(losowanie <= kwota){
      cat(c(X,Y,Z), sep= ", ") 
      break
    }
  }}

zestaw(20)




