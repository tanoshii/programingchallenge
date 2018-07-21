main(Filename) :-
    open(Filename, read, Input),
    open("salida.txt", write, Output),
    read_number(Input, N),
    process_file(Input, Output, 0, N).

process_file(Input, Output, T, T) :-
    close(Input), 
    close(Output), !.

process_file(Input, Output, C, T) :-
    read_digits(Input, N),
    calculate_number(N, O),
    C1 is C + 1,
    print_case(Output, C1, N, O),
    process_file(Input, Output, C1, T).

calculate_number(N, O) :-
    ordered_index(N, 0, I), !,
    process(N, I, O), !.

ordered_index([_|[]], _, -1).

ordered_index([X|Z], N, I) :-
    [Y|_] = Z,
    N1 = N + 1,
    (X > Y -> I is N; ordered_index(Z, N1, I)).

process(N, -1, N).

process(N, I, O) :-
    build_number(N, 0, I, Z),
    remove_zeros(Z, O).

build_number([], _, _, []).
    
build_number([X|Z], N, I, A) :-
    N1 is N + 1,
    (N < I -> 
        (build_number(Z, N1, I, [Y1|Y]), fix_number(X, Y1, Y, A));
        (X1 is X - 1, replace_with_nines(Z, Y), A = [X1|Y])), !.

fix_number(X, Y1, Y, A) :-
    (X > Y1 -> 
        (X1 is X - 1, A = [X1, 9|Y]); 
        (A = [X, Y1|Y])).
    
replace_with_nines(Z, R) :-
    length(Z, N),
    length(R, N),
    maplist(=(9), R).

remove_zeros([0|Z], Z).
remove_zeros([X|Z],[X|Z]) :- X > 0.
    
print_case(Output, C, N, O) :-
    atomic_list_concat(N, N1),
    atomic_list_concat(O, O1),
    format(Output, "Case ~w N=~w O=~w~n", [C, N1, O1]).
    
read_number(File, N) :-
    read_digits(File, D),
    atomic_list_concat(D, S),
    atom_number(S, N).

read_digits(File, D) :-
    read_line_to_codes(File, Line),
    maplist(plus(48),D, Line).
