/* Maksim Jaroslavcevas 4 kursas 2212160 */

/* Kuprinės uždavinys.
5. Duoti akmenų svoriai, duotas kuprinių talpų sąrašas. Nustatykite, kaip galima 
sutalpinti visus akmenis į kuprines (kuprinės gali likti ir ne pilnai užpildytos):
    5.1 be papildomų apribojimų;
*/
rasti_sprendini(Akmenys, Talpos, Solution) :-
    paruosti_kuprines(Talpos, 1_000, PradinesKuprines),
    paskirstyti_akmenis(Akmenys, PradinesKuprines, Solution).

paruosti_kuprines([], _, []).
paruosti_kuprines([X|XS], Id, [[Id, X, []] | LikusiosK]) :-
    NextId is Id + 1,
    paruosti_kuprines(XS, NextId, LikusiosK).

paskirstyti_akmenis([], XS, XS).
paskirstyti_akmenis([X|XS], EsamosKuprines, Result) :-
    ideti_akm(X, EsamosKuprines, NaujosKuprines),
    paskirstyti_akmenis(XS, NaujosKuprines, Result).

ideti_akm(Svoris, [[Id, Capacity, Akmenys] | XS], [[Id, NewCapacity, [Svoris|Akmenys]] | XS]) :-
    Svoris =< Capacity,
    NewCapacity is Capacity - Svoris.

ideti_akm(Svoris, [X | XS], [X | LikusiosNaujos]) :-
    ideti_akm(Svoris, XS, LikusiosNaujos).

/*
Query examples
/*  rasti_sprendini([5, 4, 3, 2], [7, 8], S). */

*/
