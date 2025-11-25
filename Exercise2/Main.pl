/* Maksim Jaroslavcevas 4 kursas 2212160 */

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

/* 
Query examples (1.2 variant)
1. Galima nuvaziuoti is Shroomland, Berryville lygiai 130 kilometru
    ?- nuvaziuoti_lyg_L(shroomland, berryville, 130).
    true

2. Galima nuvaziuoti is Shroomland, Berryville lygiai 100 kilometru
    ?- nuvaziuoti_lyg_L(shroomland, berryville, 100).
    false.

3. Galima nuvaziuoti is Berryville,  Shroomland lygiai 130 kilometru
    ?- nuvaziuoti_lyg_L(berryville, shroomland, 130).
    false.

Query examples (6.1 variant)
1. 3 + 2 = 5
    ?- suma(s(s(s(nul))), s(s(nul)), Sum).
    Sum = s(s(s(s(s(nul))))) .

2. 0 + 1 = 1
    ?- suma(nul,s(nul),Sum).
    Sum = s(nul) .

3. 1 + 0 = 0
    ?- suma(s(nul),nul,Sum).
    Sum = s(nul) .
*/