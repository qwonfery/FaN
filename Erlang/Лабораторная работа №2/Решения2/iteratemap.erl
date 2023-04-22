-module(iteratemap).
-author("nikit").

%% API
-compile(export_all).

iteratemap(Fun, I, L) when L == 0 -> [];

iteratemap(Fun, I, L) -> [Fun(I) | iteratemap(Fun, I + 1, L - 1)] .

ex() -> iteratemap(fun(X) -> X*10 end, 1, 4). %% => [1, 2, 4, 8]