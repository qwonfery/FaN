%%%-------------------------------------------------------------------
%%% @author nikit
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. апр. 2023 17:06
%%%-------------------------------------------------------------------
-module(counter).
-author("nikit").

%% API
%%-export([start/0, incr/0, stop/0]).
-compile(export_all).

%%-spec start() -> string().
%%
%%-spec incr() -> string().
%%
%%-spec stop() -> string().

start(Time, Fun) ->
  register(clock, spawn(fun() -> tick(Time, Fun) end)).

stop() -> clock ! stop.

tick(Time, Fun) ->
  receive
    stop ->
      void
  after Time ->
    Fun(),
    tick(Time, Fun)
  end.