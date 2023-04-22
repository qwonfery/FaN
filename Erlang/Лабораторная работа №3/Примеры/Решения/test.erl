%%%-------------------------------------------------------------------
%%% @author nikit
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. апр. 2023 10:10
%%%-------------------------------------------------------------------
-module(test).
-author("nikit").
-import(pquery,[view/1,empty/0,insert/3,extract_minimum/1]).
%% API
-compile(export_all).

test_pquery() -> [{1,aboba},{2,abeba},{3,booba},{4,foo},{-5,bar}].

test_extract() -> extract_minimum([{1,aboba},{2,abeba},{3,booba},{4,foo},{-5,bar}]).
