/* 1.1, 2.2, 3.3, 4.9 */

/* Paprasti predikatai su sveikųjų skaičių sąrašais

1.1 did(S) - teisingas, kai duoto sveikųjų skaičių sąrašo S elementai išdėstyti didėjimo tvarka. Pavyzdžiui:

?- did([4,18,23,100]).
    true.
*/

/* Paprasti nearitmetiniai predikatai:

2.2 apjungti(SS,R) - sąrašas R gaunamas iš duotojo sąrašų sąrašo SS, sujungus pastarojo sąrašus į bendrą sąrašą. Giliuosius sąrašus apdoroti nėra būtina. Pavyzdžiui:

?- apjungti([[a,b],[c],[d,[e,f], g]],R).
        R = [a,b,c,d,[e,f],g].
*/

/* Sudėtingesni predikatai:

3.3 nesikartoja(S,R) - sąrašas R gaunamas iš duotojo sąrašo S pašalinus pasikartojančius elementus. Pavyzdžiui:

?- nesikartoja([a,b,a,d] ,R).
    R = [a,b,d].
*/

/* Operacijos su natūraliaisiais skaičiais, išreikštais skaitmenų sąrašais. Skaitmenų sąrašo elementai turi būti 
natūralūs skaičiai nuo 0 iki 9 (ne simboliai '0', '1',...). Nenaudokite Prolog konvertavimo tarp sąrašo ir skaičiaus 
predikatų (number_chars/2, number_codes/2 ir kt...):

4.9 didesnis(S1, S2) - S1 ir S2 yra skaičiai, vaizduojami skaitmenų sąrašais. Predikatas didesnis(S1,S2) teisingas tada ir tiktai data, kai pirmasis skaičius yra didesnis už antrąjį. Pavyzdžiui:

?- didesnis([1,4,6,1,3,4],[9,8]).
    true.
*/