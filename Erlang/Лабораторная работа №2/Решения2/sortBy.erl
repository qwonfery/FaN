%%%-------------------------------------------------------------------
%%% @author nikit
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. апр. 2023 21:39
%%%-------------------------------------------------------------------
-module(sortBy).
-author("nikit").

%% API
-compile(export_all).

comparator(X,Y) when X < Y -> less;
comparator(X,Y) when X == Y -> equal;
comparator(X,Y) when X > Y -> greater;
comparator(X,Y) -> 0.

sortBy(Comparator, List) -> quickSort(Comparator, List).

quickSort(Comparator, []) -> [];

quickSort(Comparator, [H|[]]) -> [H];

quickSort(Comparator, [H|T]) -> quickSort(Comparator, T, H, [], [H], []);

quickSort(Comparator, H) -> [H].


quickSort(Comparator, [], End, [], MiddleList, []) -> MiddleList;

%%quickSort(Comparator, [], End, LeftList, MiddleList, RightList) -> LeftList ++ [MiddleList] ++ RightList;
quickSort(Comparator, [], End, LeftList, MiddleList, RightList) -> quickSort(Comparator, LeftList) ++ quickSort(Comparator, MiddleList) ++ quickSort(Comparator, RightList);

quickSort(Comparator, [N|[]], First, [],[First|[]], []) ->
  case Comparator(N, First) of
    less -> [N,First];
    _ -> [First,N]
  end;

quickSort(Comparator, [H|T], First, LeftList, MiddleList, RightList) ->
  case Comparator(H, First) of
    less -> quickSort(Comparator, T, First, [H | LeftList],MiddleList, RightList);
    greater -> quickSort(Comparator, T, First, LeftList,MiddleList, [H | RightList]);
    equal -> quickSort(Comparator, T, First, LeftList, [H | MiddleList], RightList)
  end.

%%test(N) -> number;
test([H|[]]) -> yes;
test([H|T]) -> T;
test(N) -> number.

ex() -> sortBy(fun sortBy:comparator/2,[9,8,3,4,1,3,0]).