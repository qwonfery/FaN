-module(module2).
-compile(export_all).
%%-export([for/4, test/2]).

for(Init, Cond(I), Step(I), Body(I)) -> Body(I).

Foo(X) -> X + 1.
Bar(Y) -> Y - 1.

test(Foo(X), Bar(Y)) -> Foo(x),Bar(y)