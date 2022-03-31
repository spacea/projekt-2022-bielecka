library(dplyr)


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

Œniadania = menu %>%
  filter(ID == "S") %>% 
  select (NAZWA,CENA)
Œniadania

Przek¹ska = menu%>%
  filter(ID == "PR") %>%
  select(NAZWA,CENA)
Przek¹ska 


k = sample(menu$ID, 3, replace = TRUE )
k

losowanie = (k){
  if(k == "S"){
    print(sample(Œniadania, 1))
  } else (k == "O"){
    print(sample(Dania,1))
  } else (k == "N"){
    print(sample(Napoje, 1))
  } else (k == "D"){
    print(sample(Dodatki, 1))
  } else (k == "DS"){
    print(sample(Deser, 1))
  }else (k == "K"){
    print(sample(Kanapki, 1))
  }else (k == "P"){
    print(sample(Pizza, 1))
  }else (k == "PR"){
    print(sample(Przek¹ska, 1))
  }}


##2 XD 


losowanie = function(k){
  k = sample(menu$ID, 3)
    if(k == "O"){
      zo = sample(menu$NAZWA[ menu$ID == "O"], 1)
      print(zo)
    }
  else  if(k == "P"){
    zk = sample(menu$NAZWA[ menu$ID == "P"], 1)
    print(zk)
  }
  else if(k == "S"){
    zs = sample(menu$NAZWA[ menu$ID == "S"], 1)
    print(zs)
  }
  else if(k == "PR"){
    zpr = sample(menu$NAZWA[ menu$ID == "PR"], 1)
    print(zpr)
  }
  else if(k == "DS"){
    zds = sample(menu$NAZWA[ menu$ID == "DS"], 1)
    print(zds)
  }
  else if(k == "D"){
    zd = sample(menu$NAZWA[ menu$ID == "D"], 1)
    print(zd)
  }
  else if(k == "N"){
    zn =  sample(menu$NAZWA[ menu$ID == "N"], 1)
    print(zn)
  }
} 
losowanie(k)


#3 :) 

?choose












