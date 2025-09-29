/* asmuo(Vardas, Lytis, Amžius, Pomėgis). */
/* mama(Mama, Vaikas). */
/* pora(Vyras, Žmona). */

/* Family tree */
asmuo(petr, male, 44, electricBusses).
asmuo(eve, female, 42, crocheting).
asmuo(mark, male, 11, candies).

asmuo(john, male, 73, bouldering).
asmuo(charlotte, female, 74, crocheting).

mama(eve, mark).
mama(charlotte, eve).

pora(petr, eve).
pora(john, charlotte).

/* Activity data */
activity_is_sport(bouldering).

/* Predicates */
/* 2. vienas_is_tevu(TevasMama, Vaikas) - Pirmasis asmuo (TevasMama) yra antrojo (Vaikas) vienas iš tėvų (tėtis ar mama); */
tevas(Tevas, Vaikas) :- pora(Tevas, Mama), mama(Mama, Vaikas).

vienas_is_tevu(TevasMama, Vaikas) :- tevas(TevasMama, Vaikas).
vienas_is_tevu(TevasMama, Vaikas) :- mama(TevasMama, Vaikas).

/* 22. zentas(Zentas, UosvisUosve) - Pirmasis asmuo (Zentas) yra antrojo (UosvisUosve) žentas (dukros vyras); */
zentas(Zentas, UosvisUosve) :- pora(Zentas, Dukte), vienas_is_tevu(UosvisUosve, Dukte).

/* 41. sporto_veteranas(Asmuo) - Asmuo Asmuo yra pakankamo (patys nuspręskite kokio) amžiaus ir mėgsta kurią nors iš sporto šakų; */
sporto_veteranas(Asmuo) :- asmuo(Asmuo, _, Amzius, Activity), Amzius > 70, activity_is_sport(Activity).

/* 43. dar_pagyvens(Asmuo) - Asmuo Asmuo mėgsta kurią nors iš sporto šakų arba yra dar nepensinio amžiaus (65 metai vyrams ir 64 metai moterims); */
dar_pagyvens(Asmuo) :- asmuo(Asmuo, _, _, Activity), activity_is_sport(Activity).
dar_pagyvens(Asmuo) :- asmuo(Asmuo, male, Amzius, _), Amzius < 65.
dar_pagyvens(Asmuo) :- asmuo(Asmuo, female, Amzius, _), Amzius < 64.