-module(zipwith).
-author("nikit").

%% API
-compile(export_all).

zipwith(_, [], []) -> [];

zipwith(Fun, [H1|T1],[H2|T2]) -> case length([H1|T1]) == length([H2|T2]) of
    false -> error;
    true -> zip(Fun, [H1|T1],[H2|T2])
    end.

zip(_, [], []) -> [];

zip(Fun, [H1|T1],[H2|T2]) -> [Fun(H1, H2) | zip(Fun, T1, T2)].

%%length([H|T]) -> length([H|T], 0).
%%length([], Counter) -> Counter;
%%length([H|T], Counter) -> length(T, Counter + 1).


ex() -> zipwith(fun(X, Y) -> {X, Y} end, [1,2,3], [4,5,6,7]). %% => [{1,4}, {2,5}, {3,6}]