# ***Analiza Obrazów - Krzysztof Okarma***

## Pierwszy wykład [07.10.2021]

### Metody binaryzacji obrazów

Binaryzacja - proces konwersji obrazu kolorowego lub w skali szarości do postaci binarnej.

- obraz monochromatyczny - obraz binarny,
- binaryzacja prowadzi do znacznej oszczędności pamięci oraz redukcji złożoności obliczeniowej dalszej analizy obrazów,
- podczas binaryzacji następuje nieodwracalna utrata pewnej części informacji bazowej - binaryzację najlepiej wykonywać, gdy zależy nam m.in. na kształcie obrazu,
- celowe jest poszukiwanie algorytmów binaryzacji, które nie powodują zmian kształtu obiektów widocznych na obrazie,
- binaryzacja stanowi jeden z zasadniczych elementów przetwarzania obrazów, który ma ogromny wpływ na wyniki póżniejszej analizy obrazu
    1. np. rozpoznawanie tekstu
- można wyróżnić metody globalne, lokalne oraz blokowe (mieszane)

### Rozpoznawanie znaków (OCR)

W celu weryfikacji metod progowania stosowane są specjalne bazy tekstowe np. DIBCO zawierające obrazy zniszczonych dokumentów, a także obrazy binarne tzw. "ground-truth"

- Bazy tekstowe:
    1. DIBCO -
    2. Bickley Diary dataset - zniekształcenia dotyczące różnego kontrastu atramentu
    3. Nabuco
    4. LiveMemory

- Metody:
    1. Otsu - nie radzi sobie na zacienionych obrazach,
    2. Niblack - radzi sobie dobrze (najlepiej z tych trzech),
    3. Sauvola - radzi sobie trochę gorzej niż Niblack

### Macierz Pomyłek

Macierz Pomyłek stostuje się do klasyfikacji do okreslenia ile elementów z jakiej klasy zostało prawidłowo sklasyfikowanych.

Macierz pomyłek można formować na dwóch poziomach:

- na poziomie pojedynczych pikseli,
- na poziomie poprawnego rozpoznawania znaków (OCR).

(Ogarnąć później zdjęcie + opisy)

### Metody Binaryzacji Globalnej

1. Balanced Histrogram Thresholding (BHT)
    - metoda globalna zakładająca dobór progru w taki sposób, aby suma "wag" histogramu po obu stronach progu była jednakowa
2. Otsu
    - metoda globalna dążąca do maksymalizacji wariancji
3. Johanssen
4. Kapur

wariancja

### Kittler & Illingworth

Znana jako minimum error thresholding, metoda zakłada rozkład normalny jasności pikseli obrazu obiektów i tła

(wzorki)

Próg binaryzacji wybrany jest w taki sposób, aby zminimalizować wyrażenie stanowiące funkcję celu

(wzorek)

### Metody binaryzacji adaptacyjnej

1. Niblack
    - NICK ??
2. Sauvola & Pietikainen
    - z dodatkowym zakresem dynamicznym R odchylenia standardowego s (wzorek)
3. Wolf & Jolion
4. Feng
5. Bernsen
6. Phansalkar
7. Bradley & Roth
8.

---

## Drugi wykład [12.10.2021]

Stack of region - zastosowanie stosu wzajemnie przesuniętych obszaróœ w celu wyznaczenia średniego progu dla "pokrywających" piskel obszarów. Każdy z progów dla obszarów wyznaczany jest z zależności `T = a * mean(X) - b` (parametry a, b podlegają optymalizacji)

Analiza obrazów binarnych

### Pomiary i ekstrakcja cech geometrycznych

Zasadniczny cel: pozyskanie skondensowanej informacji związanej z kształtem poszczególnych obiektów widocznych na obrazie -> efektywna **klasyfikacja figur na podstawie kształtu** bez konieczności pełnej analizy obrazu

Podział cech geometrycznych:

- **parametry lokalne (związane z pojedynczymi obiektami)** - mogą być to np. współczynniki kształtu, cyrkularności itp. określane dla poszczególnych figur, często przy założeniu, iż na obrazie widoczny jest tylko jeden obiekt
- **parametry globalne (cechy zbiorcze)** - związane np. z liczebnością elementów, średnim polem powierzchni itp.

Parametry globalne są wielkściami względnymi (np. liczba elementów na jednostkę powierzchni, udział procentowy)

Szybka estymacja cech geometrycznych jest możliwa dzięki metodzie **Monte Carlo**.

Poprawnie przeprowadzona analiza kształtów powinna pozwalać na odseparowanie klas obiektów o różnych kształtach przy jednoczesnej klasyfikacji obiektów o podobnych kształtach do wspólnej grupy -> konieczny odpowiedni dobór **deskryptorów kształtu**

Problem: obecność zakłóceń

Stosowane są współczynniki charakteryzujące się **inwariantnością** względem typowych przekształceń geometrycznych (skalowanie, rotacja, trnaslacja)

Podstawowe parametry np. obwód, pole powierzchni nie spełniają warunki inwariantności

Jednym z podstawowych parametrów globalnych jest **liczebność elementów** wyznaczana dla fragmentu obrazu

### Czyszczenie brzegu

Poprawność pomiaru liczebności elementów jest często uwarunkowana wykonaniem morfologicznego czyszczenia brzegu (wyznaczenie obiektów przeciętych przez brzegi - mogą być zliczane z wagą 1/2 lub 1/4 zależnie od położenia), *czynności wykonywane kolejno*:

- tworzenie markerów (znaczników) - część wspólna brzegu obrazu oraz niego samego
- rekonstrukcja obiektów przecinających brzeg za pomocą dulatacji oraz iloczynu (AND) z obrazem źródłowym aż do braku zmian w obrazie
- odejmowanie obrazów (wynik)

## Trzeci wykład [19.10.2021]

### Wypełnianie (zalewanie) otworów

Zastosowanie:
- zliczanie otworów, analiza ich wielkości i kształtu
- eliminacja otworów (mogą być wynikiem zmian oświetlenia lub kierunkowego odbicia światła np. od metalowej kulki)
- szacowanie parametrów zewnętrznych obiektów

1. Obraz wyjściowy
2. Negatyw obrazu wyjściowego
3. Negatyw z wyczyszczonym brzegiem (zostają same otwory wewnątrz obiektów)
4. Obraz wynikowy (początkowy obraz, z usuniętymi otworami)

### Indeksacja obrazu (labelling)

Przeglądanie obrazu metodą linia po linii - każdy piksel reprezentujący obiekt ("1") otrzymuje pierwszą wolną etykietę z listy numerowanej, chyba że sąsiadujące z nim piksele posiadają już nadaną etykietę - wówczas otrzymuje on etykietę zgodną z pikselami sąsiadującymi.

Algorytm prowadzi pośrednio do **zliczenia obiektów**, których liczba jest równa najwyższej zastosowanej etykiecie. Obiekt może mieć więcej niż jedną etykietę (wówczas te dwie są traktowane jako jedna)

Problem kolizji -> **tablica sklejeń** lub **wektor sklejeń**

!! NA EGZAMINIE BĘDZIE WEKTOR/TABLICA SKLEJEŃ (te obrazki)

Najwyższa etykieta to liczba obiektów + 1.

Trzeba rozrysować sobie drzewko zanim zaczniemy wypełniać tabelę, żeby lepiej zwizualizować sobie powiązania między etykietami.

### Pole powierzchni i długość krawędzi

Wyznaczanie **pola powierzchni** figur po indeksacji - zliczenie pikseli z identyczną określoną etykietą.

Dokładność uzależniona jest od rozdzielczości obrazu oraz algortymu binaryzacji.

Oszacowanie **długości krawędzi** figur - (...)

**Formuła Craftona**

### Średnice Fereta

Różnice pomiędzy maksymalną i minimalną współrzędną poziomą lub pionową punktów należących do figury

W przypadku koła lub kwadratu współczynnik fereta wyniesie 1.

### Momenty bezwładności

Momenty I rzędu określają położenie **środka ciężkości** figury, zaś momenty II rzędu stanowią miarę jej **bezwładności**.

(wzorki)

### Współczynniki kształtu

**Cechy współczynników kształtu:**

- możliwe do szybkiego wyliczenia
- inwariantność (skalowanie, translacja, rotacja)
- dobre różnicowanie figur o różnych kształtach
- zmienność i wrażliwość na zmianę kształtu przy małej wrażliwości na zmianę skali
- zwykle bezwymiarowość
- współczynniki możliwe do szybkeigo wyliczenia są z reguły mniej dokładne

Współczynniki:

- Fereta
- cyrkularności
- Malinowskiej
- bezwymiarowy współczynnik kształtu
- Blaira-Blissa
- Haralicka
- Danielssona

### Współczynniki kształtu - sposób obliczeń


