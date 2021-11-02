% Questao 1

% a

% c
liga(a,c).
liga(c,g).

liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(g,h).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

% b
membro(X,[X|_]).
membro(X,[_|L]):-membro(X,L).

inverte(L,LI):-inverte(L,[],LI).
inverte([],L,L).
inverte([X|L],L2,L3):-inverte(L,[X|L2],L3).

dfs1(P1,P1,LA,C):-inverte(LA,C).
dfs1(P1,P2,LA,C):-liga(P1,P3),not(membro(P3,LA)),dfs1(P3,P2,[P3|LA],C).

dfs(P1,P2,R):-dfs1(P1,P2,[P1],R).

% d
todos_caminhos(F,L,R):-findall(R1,dfs(F,L,R1),R).

% e
list_length([],0).
list_length([_|X],L):-list_length(X,N),L is N+1.

shortest_path_beta([L],L,T):-list_length(L,T).
shortest_path_beta([X|L],R,T):-shortest_path_beta(L,R1,T1),((list_length(X,A),A < T1,T is A,R = X);(T is T1,R = R1)).
shortest_path(P1,P2,X):-todos_caminhos(P1,P2,L),shortest_path_beta(L,X,_).

% f
dfsNiveisCorte(Orig,Dest,NC,Cam):- dfs3(Orig,Dest,[Orig],NC,0,Cam).

dfs3(Dest,Dest,LA,_,_,Cam):- reverse(LA,Cam).
dfs3(Act,Dest,LA,NC,C,Cam):- C< NC, liga(Act,X), not(member(X,LA)), C1 is C+1 ,dfs3(X,Dest,[X|LA],NC,C1,Cam).

% g
bfs(Orig,Dest,Cam):-bfs2(Dest,[[Orig]],Cam).
bfs2(Dest,[[Dest|T]|_],Cam):-reverse([Dest|T],Cam).
bfs2(Dest,[LA|Outros],Cam):-LA=[Act|_],findall([X|LA], (Dest\==Act,liga(Act,X),not(member(X,LA))), Novos),append(Outros,Novos,Todos),bfs2(Dest,Todos,Cam).
