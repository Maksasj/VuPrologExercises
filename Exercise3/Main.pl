/* Maksim Jaroslavcevas 4 kursas 2212160 */

/* 1.1, 2.2, 3.3, 4.9 */

/* Paprasti predikatai su sveikųjų skaičių sąrašais

1.1 did(S) - teisingas, kai duoto sveikųjų skaičių sąrašo S elementai išdėstyti didėjimo tvarka. Pavyzdžiui:

?- did([4,18,23,100]).
    true.
*/
did([]) :- !.
did([_]) :- !.
did([X, Y | YS]) :- X < Y, did([Y | YS]).

/* Paprasti nearitmetiniai predikatai:

2.2 apjungti(SS,R) - sąrašas R gaunamas iš duotojo sąrašų sąrašo SS, sujungus pastarojo sąrašus į bendrą sąrašą. Giliuosius sąrašus apdoroti nėra būtina. Pavyzdžiui:

?- apjungti([[a,b],[c],[d,[e,f], g]],R).
        R = [a,b,c,d,[e,f],g].
*/
append_list([], L, L) :- !.
append_list([X | L1], L2, [X | L3]) :- append_list(L1, L2, L3).

apjungti([], []) :- !.
apjungti([Pirmas | Kiti], Result) :- apjungti(Kiti, TarpinisResult), append_list(Pirmas, TarpinisResult, Result).

/* Sudėtingesni predikatai:
3.3 nesikartoja(S,R) - sąrašas R gaunamas iš duotojo sąrašo S pašalinus pasikartojančius elementus. Pavyzdžiui:

?- nesikartoja([a,b,a,d] ,R).
    R = [a,b,d].
*/
erase_all(_, [], []) :- !.
erase_all(X, [X | XS], Result) :- !, erase_all(X, XS, Result).
erase_all(X, [H | HS], [H | Result]) :- erase_all(X, HS, Result).

nesikartoja([], []) :- !.
nesikartoja([X | XS], [X | Result]) :- erase_all(X, XS, Tmp), nesikartoja(Tmp, Result).

/* Operacijos su natūraliaisiais skaičiais, išreikštais skaitmenų sąrašais. Skaitmenų sąrašo elementai turi būti 
natūralūs skaičiai nuo 0 iki 9 (ne simboliai '0', '1',...). Nenaudokite Prolog konvertavimo tarp sąrašo ir skaičiaus 
predikatų (number_chars/2, number_codes/2 ir kt...):

4.9 didesnis(S1, S2) - S1 ir S2 yra skaičiai, vaizduojami skaitmenų sąrašais. Predikatas didesnis(S1,S2) teisingas tada ir tiktai data, kai pirmasis skaičius yra didesnis už antrąjį. Pavyzdžiui:

?- didesnis([1,4,6,1,3,4],[9,8]).
    true.
*/
list_length([], 0) :- !.
list_length([_ | XS], N) :- list_length(XS, N1), N is N1 + 1.

didesnis_pagal_reiksme([X | _], [Y | _]) :- X > Y, !.
didesnis_pagal_reiksme([X | XS], [Y | YS]) :- X =:= Y, didesnis_pagal_reiksme(XS, YS).

didesnis(S1, S2) :- list_length(S1, L1), list_length(S2, L2), (L1 > L2 -> true, !; L1 =:= L2, didesnis_pagal_reiksme(S1, S2)).

/*
Query examples (1.1 variant)
1. ?- apjungti([[a,b],[c],[d,[e,f], g]],R).
        R = [a,b,c,d,[e,f],g].

Query examples (2.2 variant)
1. ?- apjungti([[a,b],[c],[d,[e,f], g]],R).
        R = [a,b,c,d,[e,f],g].

Query examples (3.3 variant)
?- nesikartoja([a,b,a,d] ,R).
    R = [a,b,d].

Query examples (4.9 variant)    
?- didesnis([1,4,6,1,3,4],[9,8]).
    true.
*/