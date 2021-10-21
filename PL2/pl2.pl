% Questao 1

% a
conta_soma([],0,0).
conta_soma([H|T],S,C):-
    conta_soma(T,S1,C1),S is S1+H, C is C1+1.

media(L,R):- conta_soma(L,S,C), R is S/C.

% b
saber_menor([X],X).
saber_menor([H|T],M):-
    saber_menor(T,M1),(H < M1 , M is H; M is M1).

% c
contar_par_impar([],0,0).
contar_par_impar([H|T],P,I):-
    contar_par_impar(T,P1,I1),K is H mod 2,(K==0,(P is P1+1,I is I1);(I is I1+1,P is P1)).

% d
membro(X,[X|_]).
membro(X,[_|L]):-membro(X,L).

saber_iguais([]):-fail.
saber_iguais([H|T]):-
    membro(H,T),!;saber_iguais(T).

% e
apaga(_,[],[]).
apaga(X,[X|L],L):-!.
apaga(X,[Y|L],[Y|M]):-apaga(X,L,M).

menor_frente(L,L1):- saber_menor(L,M), apaga(M,L,L2), L1 = [M|L2],!.

% f
concat(L1, L2, R):- append(L1, L2, R).

% g
flt([],[]).
flt([H|L],[H|X]):-not(is_list(H)),flt(L,X),!.
flt([H|L],X):-append(R,F,X),flt(H,R),!,flt(L,F).

% h
apaga_1_occorencia(_,[],[]).
apaga_1_occorencia(X,[X|L],L):-!.
apaga_1_occorencia(X,[Y|L],[Y|M]):-apaga_1_occorencia(X,L,M).

% i
apaga_numero(_,[],[]):-!.
apaga_numero(X,[X|L],M):-!,apaga_numero(X,L,M).
apaga_numero(X,[Y|L],[Y|M]):-apaga_numero(X,L,M).

% j
muda_numero(_,_,[],[]):-!.
muda_numero(X,Z,[X|L],[Z|M]):-!,muda_numero(X,Z,L,M).
muda_numero(X,Z,[Y|L],[Y|M]):-muda_numero(X,Z,L,M).

% k
insere_numero(_,_,[],[]):-!.
insere_numero(N,P,[Y|L],[N|[Y|M]]):-P==1,P1 is P-1,!,insere_numero(N,P1,L,M).
insere_numero(N,P,[Y|L],[Y|M]):-P1 is P-1,insere_numero(N,P1,L,M).

% l
inverte(L,LI):-inverte(L,[],LI).
inverte([],L,L).
inverte([X|L],L2,L3):- inverte(L,[X|L2],L3).

% m
uniao([ ],L,L).
uniao([X|L1],L2,LU):-membro(X,L2),!,uniao(L1,L2,LU).
uniao([X|L1],L2,[X|LU]):-uniao(L1,L2,LU).

% n
intersecao([ ],_,[ ]).
intersecao([X|L1],L2,[X|LI]):-membro(X,L2),!,intersecao(L1,L2,LI).
intersecao([_|L1],L2, LI):- intersecao(L1,L2,LI).

% o
diferenca_beta([ ],_,[ ]).
diferenca_beta([X|L1],L2,[X|LI]):-not(membro(X,L2)),!,diferenca_beta(L1,L2,LI).
diferenca_beta([_|L1],L2,LI):-diferenca_beta(L1,L2,LI).

diferenca(L1,L2,L3):-diferenca_beta(L1,L2,L4),diferenca_beta(L2,L1,L5),uniao(L4,L5,L3).

