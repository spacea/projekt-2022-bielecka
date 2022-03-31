menu = read.csv("MENU2.csv", encoding = "UTF-8")
menu

class(menu)
attributes(menu)

menu_stare = read.csv("ceny1.csv", encoding = "UTF-8")
menu_stare


#PROGNOZY NA PRZYSZLOSC 

##############
nowe_ceny = mean(menu$CENA[1:41])
nowe_ceny
wzrost = menu$CENA[1:41] - menu_stare$CENA
wzrost
zmiana = mean(wzrost)
zmiana 
wr=1.37
sr= mean(menu_stare$CENA)
sr = 10.96
p =  c(sr, sr+1.37, sr+(2*1.37), sr+(3*1.37), sr+(4*1.37), sr+(5*1.37))
y= (2021.5:2026) 
y

menu3 = data.frame(cena = c(sr, sr+1.37, sr+(2*1.37), sr+(3*1.37), sr+(4*1.37), sr+(5*1.37)),
                   rok = 2021:2026)
menu3



ggplot(menu3, aes(x=cena,
                 y=rok)) + stat_smooth()  + geom_point()

length(x) 
length(y)

plot(x,y[1:length(x)], type = "l", main = "Prognoza wzrostu cen w bufecie WNGiG", col = "red",
      xlab = "cena w złotówkach", ylab = "lata")

library(tidyverse)






##################



library(dplyr)


#NAJTAŃSZE_I_NAJDROŻSZE 

Deser = menu %>%
  filter(ID == "DS") %>%
  select(NAZWA, CENA, CZY_VEGE)
Deser

Napoje = menu %>% 
  filter(ID=="N") %>%
  select(NAZWA,CENA, CZY_VEGE)
Napoje 

Dodatki = menu %>%
  filter(ID=="D") %>%
  select(NAZWA,CENA, CZY_VEGE)
Dodatki 

Dania = menu %>% 
  filter (ID == "O") %>%
  select(NAZWA,CENA, CZY_VEGE)
Dania

Kanapki = menu %>%
  filter(ID =="K") %>% 
  select(NAZWA,CENA, CZY_VEGE)

Pizza = menu %>%
  filter(ID == "P") %>%
  select(NAZWA,CENA, CZY_VEGE)
Pizza 

sniadania = menu %>%
  filter(ID == "S") %>% 
  select (NAZWA,CENA, CZY_VEGE)
sniadania 


plot()

max  = max(sniadania$NAZWA[sniadania$CENA])

#SORTOWANIE POZYCJI WEGE 

##################

Vege_menu = menu %>%
  filter(CZY_VEGE == "V") %>%
  select(NAZWA, CENA)
Vege_menu 

Deser_V = Deser%>%
  filter(CZY_VEGE == "V") %>%
  select(NAZWA,CENA)
Deser_V

Dodatki_V = Dodatki %>%
  filter(CZY_VEGE == "V") %>%
  select(NAZWA,CENA)
Dodatki_V 

Dania_V = Dania %>% 
  filter (CZY_VEGE == "V") %>%
  select(NAZWA,CENA)
Dania_V

Kanapki_V = Kanapki %>%
  filter(CZY_VEGE == "V") %>% 
  select(NAZWA,CENA)
Kanapki_V

Pizza_V = Pizza %>%
  filter(CZY_VEGE == "V") %>%
  select(NAZWA,CENA)
Pizza_V 

sniadania_V = sniadania %>%
  filter(CZY_VEGE == "V") %>% 
  select (NAZWA,CENA)
sniadania_V



#WYKRES PROCENT VEGE DAN 

#############

menu_2 = menu$NAZWA[menu$ID != "N"]
menu_2

menu
nrow(menu)
length(menu_2)

procent_vege = (length(menu_2)/nrow(menu))*100
procent_vege




menu_2


#ZESTAW 

#funckja pozwalająca wylosować użytkownikowi zestaw na podstawie wybranych przez niego kategorii 

zestaw = function(A,B,D){
  A == menu$ID
  B == menu$ID
  D == menu$ID
  sample(c(menu$NAZWA[menu$A], menu$NAZWA[menu$B], menu$NAZWA[menu$D]), 1)
  }
zestaw("O","N","DS")

zestaw = c((sample(menu$NAZWA[ menu$ID == "N"], 1)), sample(menu$NAZWA[ menu$ID == "DS"], 1), sample(menu$NAZWA[menu$ID == "O"],1))
zestaw




#jaka_pizza
##funkcja służąca do wyszukiwania możliwej do zakupu pizzy na podstawie podanego składnika 


jaka_pizza = function(składnik){
  grep("składnik", menu$SKŁADNIKI , value = TRUE)
  }
jaka_pizza(ser)


grep("ananas", menu$SKŁADNIKI , value = TRUE)
   






