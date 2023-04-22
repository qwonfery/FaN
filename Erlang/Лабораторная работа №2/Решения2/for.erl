-module(for).
-compile(export_all).
%%-export([for/4, test/2]).

for(I, Cond, Step, Body) ->
  case Cond(I) of
    true -> [Body(I)| for(I + Step, Cond, Step, Body)];
    false -> ok
  end.

def_body(X) -> X + 1.

def_cond(X) -> X < 10.

def_for() -> for( 0, fun def_cond/1, 1, fun def_body/1).

foo(X) -> X + 1.
bar(Y) -> Y - 1.

test(X, Y) -> [foo(X), bar(Y)].