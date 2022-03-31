menu = read.csv("MENU2.csv", encoding = "UTF-8")
menu

class(menu)
attributes(menu)

menu_stare = read.csv("ceny1.csv", encoding = "UTF-8")
menu_stare

wzrost = menu$CENA[1:41] - menu_stare$CENA
wzrost
zmiana = mean(wzrost)
zmiana 


w=1.37 
w

for (i in 2021:2024) {
  print(w+1.37)
  
  
}



prognoza
rok
prognoza







library(dplyr)

Vege_menu = menu %>%
  filter(CZY_VEGE == "V") %>%
  select(NAZWA, CENA)
Vege_menu 


Deser = menu %>%
  filter(ID == "DS") %>%
  select(NAZWA, CENA)
Deser

Napoje = menu %>% 
  filter(ID=="N") %>%
  select(NAZWA,CENA)
Napoje 

Dodatki = menu %>%
  filter(ID=="D") %>%
  select(NAZWA,CENA)
Dodatki 

Dania = menu %>% 
  filter (ID == "O") %>%
  select(NAZWA,CENA)
Dania

Kanapki = menu %>%
  filter(ID =="K") %>% 
  select(NAZWA,CENA)

Pizza = menu %>%
  filter(ID == "P") %>%
  select(NAZWA,CENA)
Pizza 

?niadania = menu %>%
  filter(ID == "S") %>% 
  select (NAZWA,CENA)
?niadania 

zestaw = c((sample(menu$NAZWA[ menu$ID == "N"], 1)), sample(menu$NAZWA[ menu$ID == "DS"], 1), sample(menu$NAZWA[menu$ID == "O"],1))
zestaw

skladnik = "pieczarki"


jaki_sk?adnik = grep("pieczarki", menu$SK?ADNIKI , value = TRUE)
jaki_sk?adnik