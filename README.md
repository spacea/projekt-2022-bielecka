
# Tytuł projektu: Bistro Morasko oczami programisty 

#### Autorzy: Martyna Bielecka, Dagmara Kramarczyk 

## Ogólny cel projektu:
Wykonanie różnorodnych działań i funkcji związanych z danymi pochodzącymi z bistro, zlokalizowanego na Wydziale Nauk Geograficznych i Geologicznych Uniwersytetu Adama Mickiewicza na Morasku, w Poznaniu.

### Bazy danych:
Dane zebrane są w dwóch bazach danych w plikach o formacie .csv, o nazwach: "menu", oraz "stare_menu". 

- Baza `menu.csv` zawiera aktualne informacje (na dzień 26.03.2022r.) takie jak: `NAZWA` (nazwa danego produktu), `CENA` (cena danego produktu), `WEGE` (jeżeli w komórce znajduje się litera "W" - oznacza to, że dany produkt jest wegetariański), `SKŁADNIKI` (kolumna przeznaczona tylko dla pizz, zawiera informacje o składnikach, jakie znajdują się na danej pizzy), `ID` (ID danego produktu*, czyli kategoria do jakiej należy)
 <br /> *znaczenie ID: "O" - obiad, "P" - pizza, "S" - śniadanie, "K" - kanapka, "PR" - przekąska słona, "DS" - deser, "D" - dodatki, "N" - napój

- Baza `stare_menu.csv` zawiera nazwy oraz ceny dań głównych, na podstawie zdjęcia z dnia 13.10.2021r. Służy głównie temu, by móc porównać ceny obecne z cenami sprzed pół roku, oraz za ich pomocą obliczyć prognozę wzrostu cen w najbliższych latach. 
 
### Działania:
- Prognozy na przyszłość - działanie opiera się na obliczeniu średnich cen dań głównych, na stan obecny oraz stan sześć miesięcy wstecz, a następnie różnicy otrzymanych rezultatów. Z naszych obliczeń wynika, że jest to w przybliżeniu średnio 1,37 zł wzrostu na podstawie dań głównych serwowanych w bistro. <br /> Ma to na celu obliczenie przybliżonej prognozy, z jaką bedą bedą wzrastać ceny na przestrzeni najbliższych lat (2022-2026). Na stan z dnia 13.10.2021r. danie główne kosztowało średnio 10,96 zł, w dniu 13.10.2021r. już 12,33 zł,więc idąc tym tropem, z prognozy wynika, że w 2026 r. może kosztować już średnio 17,81 zł. 
Następnie załączony jest wykres, który prezentuje otrzymane wyniki, wraz z opisanymi osiami. 


### Funkcje:
- ```najdroższe(kategoria)``` - funkcja ma na celu wyznaczenie najdroższego produktu w zależności kategorii produktów. <br/> Odbywa się to za pomocą przelitrowania bazy danych, oraz wyznaczenia wartości maksymalnej w kolumnie cena, dla wybranego ID. Oraz wyświetlenia nazwy uzyskanego wyniku. <br /> Dla przykładu: w kategorii napój najdroższym produktem jest latte macchiato z ekspresu w cenie 9zł.

- ```najtańsze(kategoria)``` - funkcja ma na celu wyznaczenie najtańszego produktu w zależności od kategorii produktów. <br/> Odbywa się to za pomocą przelitrowania bazy danych, oraz wyznaczenia wartości minimalnej w kolumnie cena, dla wybranego ID. Oraz wyświetlenia nazwy uzyskanego wyniku. <br /> Dla przykładu: w kategorii napój najtańszym produktem jest tymbark mały w cenie 2,50 zł.

- ```Vege(kategoria)``` - funkcja ma na celu pokazanie listy produktów, które są wegetariańskie w zależności od kategorii. <br /> Odbywa się to za pomocą przefiltrowania bazy danych w określonej w funkcji kategorii i wyświetleniu nazw produktów, które w kolumnie `WEGE` mają literkę "W". <br /> Dla przykładu: wegetariańskie śniadania to: <br /> 
 `1.` jajecznica na maśle z 2 jaj
 `2.` jajecznica na maśle z 4 jaj
 `3.` tosty z susz. pomidorami i camembertem
 `4.` tosty wegetariańskie
 
 - ```na_co_wystarczy(kategoria, kwota)``` - funkcja ma na celu wyświetlenie listy produktów z danej kategorii, które mieszczą się w podanej przez uzytkownika kwocie. <br /> Odbywa się to za pomocą przefiltrowania bazy danych w określonej w funkcji kategorii i wyświetleniu nazw produktów, których cena jest niższa, bądź równa podanenj w funkcji kwocie. <br /> Dla przykładu napoje do 3zł to: `1.` tymbark mały `2.` woda `3.` kompot
 
 ### Niedopracowane funkcje:
 - ```zestaw(?)``` - funkcja będzie miała na celu wylosowanie zestawu, na podstawie wybranych przez użytkownika kategorii (np. kanapka i napój). Bez problemów przychodzi nam wylosowanie jednego produktu z danej kategorii za pomocą funkcji ```sample```, bądź wylosowanie kilku produktów, jednak w określonych z góry kategoriach. Trudności przysparza jednak danie użytkownikowi możliwości wyboru dowolnej liczby kategorii (1-7), z których ma składać się zestaw i losowaniu na ich podstawie. 

- ```jaka_pizza(składnik)``` - funkcja będzie miała na celu wyświetlenie listy pizz, zawierających pożądany przez użytkownika składnik. <br /> Będzie odbywało się to za pomocą przefiltrowania kolumny `SKŁADNIKI` w celu znalezienia określonego w funkcji składnika za pomocą funkcji ```grep```, a następnie wyświetleniu nazw odpowiednich pizz. Filtrowanie poza funkcją działa bez zarzutów, jednak problem leży w umiejscowieniu filtru w funkcji, tak by działała na podstawie wywołanego wcześniej składnika.

### Shiny
Załączony jest również plik `shiny.R` który zawiera skrypt aplikacji, w której pojawiają się checkboxy z kategoriami do wyboru przez użytkownika. <br /> W docelowej wersji chciałybyśmy, aby po zaznaczeniu danych kategorii, w panelu użytkownika wyświetlał się wylosowany zestaw na podstawie zaznaczonych kategorii. Mamy jednak problem z zaimplementowaniem funkcji do outputu po stronie serwera. <br /> W dalszych planach, jeśli pozwoliłby na to czas, chciałybyśmy dodać w aplikacji okno wyboru kwoty, w jakiej ma się mieścić dany zestaw oraz wykres przedstawiający prognozę wzrostu cen w ciągu najbliższych lat.
