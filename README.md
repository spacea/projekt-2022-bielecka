[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-8d59dc4de5201274e310e4c54b9627a8934c3b88527886e3b421487c677d23eb.svg)](https://classroom.github.com/a/6D3hpOQ5)

# Tytuł projektu: Bistro Morasko oczami programisty 

#### Autorzy: Martyna Bielecka, Dagmara Kramarczyk 

## Ogólny cel projektu:
Wykonanie różnorodnych działań i funkcji związanych z danymi pochodzącymi z bistro, zlokalizowanego na Wydziale Nauk Geograficznych i Geologicznych Uniwersytetu Adama Mickiewicza na Morasku, w Poznaniu. A następnie utworzenie aplikacji interaktywnej, z możliwością wylosowania zestawu.

### Bazy danych:
Dane zebrane są w dwóch bazach danych w plikach o formacie .csv, o nazwach: "menu", oraz "stare_menu". 

- Baza `menu.csv` zawiera aktualne informacje (na dzień 26.03.2022r.) takie jak: `NAZWA` (nazwa danego produktu), `CENA` (cena danego produktu), `WEGE` (jeżeli w komórce znajduje się litera "W" - oznacza to, że dany produkt jest wegetariański), `SKŁADNIKI` (kolumna przeznaczona tylko dla pizz, zawiera informacje o składnikach, jakie znajdują się na danej pizzy), `ID` (ID danego produktu*, czyli kategoria do jakiej należy)
 <br /> *znaczenie ID: "O" - obiad, "P" - pizza, "S" - śniadanie, "K" - kanapka, "PR" - przekąska słona, "DS" - deser, "D" - dodatki, "N" - napój

- Baza `stare_menu.csv` zawiera nazwy oraz ceny dań głównych, na podstawie zdjęcia z dnia 13.10.2020r. Służy głównie temu, by móc porównać ceny obecne z cenami sprzed pół roku, oraz za ich pomocą obliczyć prognozę wzrostu cen w najbliższych latach. 
 
### Działania:
- Prognoza wzrostu cen w przeciągu najbliższych lat (na podstawie zmiany średniej cen dań głównych na przestrzeni 6 miesięcy)  - działanie opiera się na obliczeniu średnich cen dań głównych, na stan obecny oraz stan sześć miesięcy wstecz, a następnie różnicy otrzymanych rezultatów. Z naszych obliczeń wynika, że jest to w przybliżeniu średnio 1,37 zł wzrostu na podstawie dań głównych serwowanych w bistro, czyli 11.15%. <br /> Ma to na celu obliczenie przybliżonej prognozy procentowej, z jaką bedą bedą wzrastać ceny na przestrzeni najbliższych lat (2021-2026). Na stan z dnia 13.10.2020r. danie główne kosztowało średnio 10,96 zł, w dniu 13.10.2021r. już 12,33 zł,więc idąc tym tropem, z prognozy wynika, że w 2026 r. może kosztować już średnio 17,81 zł. 
Następnie załączony jest wykres liniowy, który prezentuje otrzymane wyniki, wraz z opisanymi osiami. 

- ceny maksymalne - działanie ma na celu wyświetlenie wykresu słupkowego, przedstawiającego maksymalne ceny w danych kategoriach, wraz z opisanymi osiami.

- ceny minimalne - działanie ma na celu wyświetlenie wykresu słupkowego, przedstawiającego minimalne ceny w danych kategoriach, wraz z opisanymi osiami.

### Funkcje:
- ```najdroższe(kategoria)``` - funkcja ma na celu wyznaczenie najdroższego produktu w zależności kategorii produktów. <br/> Odbywa się to za pomocą przelitrowania bazy danych, oraz wyznaczenia wartości maksymalnej w kolumnie cena, dla wybranego ID. Oraz wyświetlenia nazwy uzyskanego wyniku. <br /> Dla przykładu: w kategorii napój najdroższym produktem jest latte macchiato z ekspresu w cenie 9zł.

- ```najtańsze(kategoria)``` - funkcja ma na celu wyznaczenie najtańszego produktu w zależności od kategorii produktów. <br/> Odbywa się to za pomocą przelitrowania bazy danych, oraz wyznaczenia wartości minimalnej w kolumnie cena, dla wybranego ID. Oraz wyświetlenia nazwy uzyskanego wyniku. <br /> Dla przykładu: w kategorii napój najtańszym produktem jest tymbark mały w cenie 2,50 zł.

- ```Wege(kategoria)``` - funkcja ma na celu pokazanie listy produktów, które są wegetariańskie w zależności od kategorii. <br /> Odbywa się to za pomocą przefiltrowania bazy danych w określonej w funkcji kategorii i wyświetleniu nazw produktów, które w kolumnie `WEGE` mają literkę "W". <br /> Dla przykładu: wegetariańskie śniadania to: <br /> 
 `1.` jajecznica na maśle z 2 jaj
 `2.` jajecznica na maśle z 4 jaj
 `3.` tosty z susz. pomidorami i camembertem
 `4.` tosty wegetariańskie
 
 - ```na_co_wystarczy(kategoria, kwota)``` - funkcja ma na celu wyświetlenie listy produktów z danej kategorii, które mieszczą się w podanej przez uzytkownika kwocie. <br /> Odbywa się to za pomocą przefiltrowania bazy danych w określonej w funkcji kategorii i wyświetleniu nazw produktów, których cena jest niższa, bądź równa podanenj w funkcji kwocie. <br /> Dla przykładu napoje do 3zł to: `1.` tymbark mały `2.` woda `3.` kompot
 
 - ```zestaw(kwota)``` - funkcja ma na celu wylosowanie zestawu, na podstawie wybranej przez użytkownika kwoty, w której dany zestaw ma się mieścić (np. 20) - kwota w domyśle traktowana jest jako złotówki. Zestaw składa się z dania głównego, deseru oraz napoju. <br/> Odbywa się to za pomocą przefiltrowania bazy danych i wyznaczenia produktów w danych kategoriach, a następnie wylosowania po jednej pozycji z danej kategorii. Jako kolejne następuje sprawdzenie, czy suma cen danych produktów mieści się w ustalonej wyżej kwocie. Jeżeli tak jest funkcja wyświetla wylosowany zestaw.

- ```zestaw_wege(kwota)``` - funkcja ma na celu wylosowanie zestawu wegetariańskiego, na podstawie wybranej przez użytkownika kwoty, w której dany zestaw ma się mieścić (np. 20) - kwota w domyśle traktowana jest jako złotówki. Zestaw składa się z dania głównego, deseru oraz napoju. <br/> Odbywa się to za pomocą przefiltrowania bazy danych i wyznaczenia produktów w danych kategoriach, które w kolumnie `WEGE` mają literę "W", a następnie wylosowania po jednej pozycji z danej kategorii. Jako kolejne następuje sprawdzenie, czy suma cen danych produktów mieści się w ustalonej wyżej kwocie. Jeżeli tak jest funkcja wyświetla wylosowany wegetariański zestaw.



### Shiny
Załączony jest również plik `shiny.R` który zawiera skrypt aplikacji interaktywnej. Głównym celem aplikacji jest losowanie zestawu. Użytkownik ma do wyboru następujące pola: <br/>

#### Panel boczny 

- `Zaznacz kwotę, w której ma się mieścić zestaw:` - w tym polu numerycznym użytkownik ma możliwość wyboru kwoty (w zakresie od 20zł do 50zł) - domyślnie traktowanej jako złotówki, w której ma się mieścić wylosowany przez niego zestaw. 

- `Zaznacz jeśli jesteś wegeterianinem.` - w tym polu w postaci switcha użytkownik ma możliwość wyboru czy dany zestaw ma być w opcji wegetariańskiej.

- `Jaki wykres chcesz wyświetlić?` - w tym polu użytkownik ma wybór w postaci trzech radio buttonów. W zależności od tego, który wybierze wyświetli mu się odpowiedni wykres. Dostępne opcje to: `1.` Procentowy wzrost średniej ceny, na podstawie dania głownego. `2.` Maksymalne ceny produktów w danych kategoriach. `3.` Minimalne ceny produktów w danych kategoriach.

- `kliknij tutaj by wylosować` - ostatni z przycisków w bocznym panelu. Jego wciśnięcie powoduje uruchomienie wszytskich wymienionych wyżej procesów. 

#### Panel główny

W panelu głównym wyświetla się napis "Twój wylosowany zestaw to:", poniżej niego wylosowany przez użytkownika zestaw na podstawie wybranych wcześniej kategorii, oraz pożądany przez użytkownika wykres.
