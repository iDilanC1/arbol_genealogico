

hombre(lalo).
hombre(luis).
hombre(sebastian).
hombre(martin).
hombre(alejo).
hombre(ignacio).
hombre(lautaro).

mujer(patricia).
mujer(laura).
mujer(carolina).
mujer(jimena).
mujer(victoria).
mujer(constanza).
mujer(fiorella).


% hijos de Sebastían
progenitor_de(sebastian,alejo).
progenitor_de(sebastian,lautaro).
progenitor_de(sebastian,victoria).
progenitor_de(sebastian,constanza).

% hijos de Martin
progenitor_de(martin,ignacio).
progenitor_de(martin,fiorella).

% hijos de Luis
progenitor_de(luis,carolina).
progenitor_de(luis,jimena).

% hijos de Lalo y Patricia
progenitor_de(lalo,sebastian).
progenitor_de(patricia,sebastian).

% hijos de Carolina
progenitor_de(carolina,victoria).
progenitor_de(carolina,constanza).
progenitor_de(carolina,alejo).
progenitor_de(carolina,lautaro).

% hijos de Jimena
progenitor_de(jimena,ignacio).
progenitor_de(jimena,fiorella).


% madre y padre
padre(X,Y):-hombre(X),progenitor_de(X,Y).
madre(X,Y):-mujer(X),progenitor_de(X,Y).


% hijo e hija
hijo(X,Y):-hombre(X),progenitor_de(Y,X).
hija(X,Y):-mujer(X),progenitor_de(Y,X).


% distinto de
distinto_de(X,Y):-not(X==Y).


% hermanos, primos, tios, nietos y abuelos
pareja(X,Y):-progenitor_de(X,Z),progenitor_de(Y,Z).

hermanos(X,Y):-progenitor_de(Z,X),progenitor_de(Z,Y),distinto_de(X,Y).
hermano(X,Y):-hombre(X),hermanos(X,Y).
hermana(X,Y):-mujer(X),hermanos(X,Y).


primo(X,Y):-hombre(X),progenitor_de(Z,X),progenitor_de(V,Y),hermanos(Z,V).
prima(X,Y):-mujer(X),progenitor_de(Z,X),progenitor_de(V,Y),hermanos(Z,V).
primos(X,Y):-progenitor_de(Z,X),progenitor_de(V,Y),hermanos(Z,V).


cunados(X,Y):-((pareja(X,Z),hermanos(Z,Y));(pareja(Y,Z),hermanos(Z,X))).
cunado(X,Y):-hombre(X),cunados(X,Y).
cunada(X,Y):-mujer(X),cunados(X,Y).


tio(X,Y):-progenitor_de(Z,Y),(hermano(X,Z);cunado(X,Z)).
tia(X,Y):-progenitor_de(Z,Y),(hermana(X,Z);cunada(X,Z)).


nieto(X,Y):-hombre(X),progenitor(Y,Z),progenitor(Z,X).
nieta(X,Y):-mujer(X),progenitor(Y,Z),progenitor(Z,X).


abuelo(X,Y):-padre(X,Z),progenitor_de(Z,Y).
abuela(X,Y):-madre(X,Z),progenitor_de(Z,Y).
