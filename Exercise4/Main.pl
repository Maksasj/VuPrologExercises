/* Maksim Jaroslavcevas 4 kursas 2212160 */

/* Kuprinės uždavinys.
5. Duoti akmenų svoriai, duotas kuprinių talpų sąrašas. Nustatykite, kaip galima 
sutalpinti visus akmenis į kuprines (kuprinės gali likti ir ne pilnai užpildytos):
    5.1 be papildomų apribojimų;
*/
rasti_sprendini(Akmenys, Talpos, Solution) :-
    paruosti_kuprines(Talpos, 1_000_000, StartKuprines),
    paskirstyti_akmenis(Akmenys, StartKuprines, Solution).

paruosti_kuprines([], _, []) :- !.
paruosti_kuprines([X|XS], Id, [[Id, X, []] | LikusiosK]) :-
    NextId is Id + 1,
    paruosti_kuprines(XS, NextId, LikusiosK).

paskirstyti_akmenis([], XS, XS) :- !.
paskirstyti_akmenis([X|XS], CurrentKuprines, Result) :-
    ideti_akm(X, CurrentKuprines, NewKuprines),
    paskirstyti_akmenis(XS, NewKuprines, Result).

ideti_akm(Svoris, [[Id, Capacity, Akmenys] | XS], [[Id, NewCapacity, [Svoris|Akmenys]] | XS]) :-
    Svoris =< Capacity,
    NewCapacity is Capacity - Svoris.

ideti_akm(Svoris, [X | XS], [X | LikusiosNaujos]) :-
    ideti_akm(Svoris, XS, LikusiosNaujos).

print_solution(Akmenys, Talpos) :-
    rasti_sprendini(Akmenys, Talpos, Solution),
    print_kuprine(Solution).

print_kuprine([]) :- !.
print_kuprine([[Id, Laisva, Akmenys] | Likusios]) :-
    format('Kuprines Id. ~w: Akmeno ~w, liko vietos ~w~n', [Id, Akmenys, Laisva]),
    print_kuprine(Likusios).

/*
Query examples
1. ?- rasti_sprendini([5, 4, 3, 2], [7, 8], R). 
        R = [[1000, 0, [2, 5]], [1001, 1, [3, 4]]] ;
        R = [[1000, 0, [3, 4]], [1001, 1, [2, 5]]] ;
        R = [[1000, 1, [2, 4]], [1001, 0, [3, 5]]] ;
        false.

2. ?- print_solution([5, 4, 3, 2], [7, 8]).
    Kuprine Nr. 1000: Akmenys [2,5], liko vietos 0
    Kuprine Nr. 1001: Akmenys [3,4], liko vietos 1
    true ;
    Kuprine Nr. 1000: Akmenys [3,4], liko vietos 0
    Kuprine Nr. 1001: Akmenys [2,5], liko vietos 1
    true ;
    Kuprine Nr. 1000: Akmenys [2,4], liko vietos 1
    Kuprine Nr. 1001: Akmenys [3,5], liko vietos 0
    true ;

3. ?- rasti_sprendini([10], [7], R).
        false.

4. ?- rasti_sprendini([7], [10], R).
        R = [[1000, 3, [7]]] ;
        false.

5. ?- rasti_sprendini([1, 1, 1, 1, 1], [5], R).
    R = [[1000, 0, [1, 1, 1, 1, 1]]] ;
*/
