/* 
Apibrėžkite paskirtus du predikatus pagal nurodytas sąlygas. 
Atkreipkite dėmesį į amžino ciklo galimybę vykdymo metu. 
Nustatykite, kokioms laisvų ir suvaržytų kintamųjų kombinacijoms 
gali būti užduodami tikslai. Pirmajam paskirtajam predikatui 
(1.x arba 2.x užduoties variantui) pateikite paaiškinantį 
brėžinį: 1.x variantui - kelių žemėlapį, 2.x variantui - studentų amžiaus sąryšio diagramą. 
Brėžinį braižyti galima ir popieriuje arba kuria nors kompiuterių programa (pvz., Gimp). 
Atkreipkite dėmesį, kad ir nubraižytą brėžinį reikia įkelti į virtualią mokymosi aplinką. 
Mokėkite paaiškinti, kaip Prolog vykdo programą, kaip vykdoma paieška. 
Mokėkite naudoti ir paaiškinti trasavimą (trace.).
*/

/* 1. Duotas miestus jungiančių kelių tinklas. 
Keliai vienakrypčiai, nesudarantys ciklų. 
Kiekvienas kelias turi savo ilgį. 
Ši informacija išreiškiama faktais 
kelias(Miestas1, Miestas2, Atstumas).
Apibrėžkite predikatą „galima nuvažiuoti iš miesto X į miestą Y“: */

/* 1.2 nuvažiavus lygiai L kilometrų */
kelias(shroomland, candyland, 100).

kelias(candyland, berryville, 30).
kelias(candyland, bebonetown, 50).

kelias(bebonetown, jingleburg, 220).

nuvaziuoti(X, Y, L0) :- kelias(X, Y, L0).
nuvaziuoti(X, Y, L0) :- kelias(X, A, L1), nuvaziuoti(A, Y, L2), L0 is L1 + L2.

nuvaziuoti_lyg_L(X, Y, L) :- nuvaziuoti(X, Y, L0), L0 =:= L.

/* 6. Natūralieji skaičiai yra modeliuojami termais nul, s(nul), s(s(nul)),… (žr. paskaitos medžiagą). 
Apibrėžkite predikatą: */

/* 6.1 suma(X, Y, Z) -
dviejų skaičių suma lygi trečiajam skaičiui. Pavyzdžiui:
?- suma(s(s(s(nul))),s(s(nul)),Sum).

Sum = s(s(s(s(s(nul))))).
*/

suma(Sk1, nul, Sk1).
suma(Sk1, s(Sk2_liko), s(Suma_liko)) :- suma(Sk1, Sk2_liko, Suma_liko).