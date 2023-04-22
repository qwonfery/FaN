%%%-------------------------------------------------------------------
%%% @author nikit
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. апр. 2023 21:01
%%%-------------------------------------------------------------------
-module(pquery).
-author("nikit").

%% API
-export([view/1,empty/0,insert/3,extract_minimum/1,to_list/1]).

%% тип очередь с приоритетом

-type pquery() :: [] | [ {integer(), any()} ].

-spec view(PQuery::pquery()) -> [] |  [ {integer(), any()} ].
view(PQuery) -> PQuery.

-spec empty() -> pquery().
empty() -> [].

%% put( O(1))
-spec insert(Key::integer(),Value::any(),PQuery::pquery()) -> pquery().
insert(Key, Value, PQuery) -> [ {Key, Value} | PQuery ].

%% pull O(N)
-spec extract_minimum(PQuery::pquery()) -> {integer(), any()}.
extract_minimum([H|T]) -> extract_minimum(T, H).

extract_minimum([],{MinPriority, Value}) -> {MinPriority, Value};

extract_minimum([{Priority,Value1}|T], {MinPriority,Value2}) ->
  case Priority < MinPriority of
    true -> extract_minimum(T,{Priority, Value1});
    false -> extract_minimum(T,{MinPriority, Value2})
  end.

sort_query(PQuery) -> lists:sort(fun({X,_},{Y,_}) -> X < Y end, PQuery).

-spec to_list(PQuery::pquery()) -> [any()].
to_list(PQuery) -> lists:map(fun({_,Y}) -> Y end,sort_query(PQuery)).




