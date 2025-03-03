# pw_3_bmdp
projektus

-- inherits jest be, klucz główny txt jest git

# ograniczenia?
-lokalny id to jakieś niewiadomoco wyr reg
-oznaczenie zmiany opis źródła danych o obiekcie (np. numer umowy, numer sprawy w systemie kancelaryjnym)
1. przestrzen nazw
2. identyfikator prng
3. numer crfop

# początek na koniec i nowy początek wersji obiektu?
# uwagi, informacja_dodatkowa - autor???
# nie robimy historii???

###################################################
# czy indeksowac - jeśli uznajemy za ważne

# czy vacuumować - nie

# co z tem triggerem - się zrobi

#############################################
w WIDOKU ZMATERIALIZOWANYM indeks unikalny dla jednego atrybutu - klucz główny - indeks unikalny na jednym
left join!!!! - po prostu wszedzie?

# doc doc doc doc doc doc

1. cykl życia zaimplementowano jako początek i koniec wersji
2. https://archiwumbip.mswia.gov.pl/download/4/10397/Zalaczniknr3-SchematUMLorazschematGMLbazdanychBDOT10kiBDOO12092011.pdf
3. simc zamiast tego w voidablu
4. nie robimy Union» BT_ModelPodstawowy::BT_ReferencjaDoObiektu
5. nie robimy adja_a - powołamy się na nowego bdota - w zasadzie to powiązanie już jest przez teryt i możnamy (zrobić klucz obcy) i iść dalej iść po nitce do kłębka (jedn nadrzędna)

6. id prng - prowadzących cząstkowe bazy danych nazw geograficznych, aktualizowany przynajmniej raz do roku; w przypadku urzędowych nazw miejscowości - identyfikator miejscowości z prowadzonego w ramach rejestru TERYT systemu identyfikatorów i nazw miejscowości SIMC
7. czesc miejscowosci tylko do poligonowych
8. na razie jest on delete cascade - wywalić albo zrobić triggerek na usuwanie - albo zostawić cascade:D - w nowym nawet tego nie ma
9. w tem triggerze niby możnaby między temi aktualnościami g a itp...
