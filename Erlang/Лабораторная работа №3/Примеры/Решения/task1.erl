%%%-------------------------------------------------------------------
%%% @author nikit
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. апр. 2023 16:57
%%%-------------------------------------------------------------------
-module(task1).
-author("nikit").
-import(bin_tree, [empty/0, node/3, is_empty/1, data/1, left/1, right/1, view/1]).

%% API
-compile(export_all).

count_leaves(Tree) ->
  case view(Tree) of
    {node, _, _, _} -> count_leaves(left(Tree)) + count_leaves(right(Tree));
     _ -> 1
  end.

test_tree() -> node(1,node(2,12,13),node(3,node(1,1,1),node(1,1,1))).



