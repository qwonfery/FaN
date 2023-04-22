%%%-------------------------------------------------------------------
%%% @author nikit
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. апр. 2023 13:40
%%%-------------------------------------------------------------------
-module(pquery_sorted).
-author("nikit").
%%-import(lists,[sort/2,sort/1]).
%% API
-export([view/1,empty/0,insert/3,extract_minimum/1]).

%% тип очередь с приоритетом

-type pquery() :: [] | [ {integer(), any()} ].

sort_query(PQuery) -> lists:sort(fun({X,_},{Y,_}) -> X < Y end, PQuery).

take_first([H|_]) -> H.

-spec view(PQuery::pquery()) -> [] |  [ {integer(), any()} ].
view(PQuery) -> sort_query(PQuery).

-spec empty() -> pquery().
empty() -> [].

%% O(N) put time
-spec insert(Key::integer(),Value::any(),PQuery::pquery()) -> pquery().
insert(Key, Value, PQuery) -> sort_query([ {Key, Value} | PQuery ]).


%% O(N) pull time
-spec extract_minimum(PQuery::pquery()) -> {integer(), any()}.
extract_minimum(PQuery) -> take_first(sort_query(PQuery)).

