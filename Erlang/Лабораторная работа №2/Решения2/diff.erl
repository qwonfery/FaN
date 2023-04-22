-module(diff).
-author("nikit").

%% API
-compile(export_all).

diff(Fun, Dx) -> fun(X) -> (Fun(X + Dx) - Fun(X))/Dx end.

ex() -> diff(fun(X) -> X*X end, 0.001). %% F1(1.0) => 2.000 (приближенно)