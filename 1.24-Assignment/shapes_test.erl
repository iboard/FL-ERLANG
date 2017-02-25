%% Andreas Altendorfer, <andreas@altendorfer.at>
%% FUNCITIONAL PROGRAMMING IN ERLANG - MOOC @ THE UNIVERSITY OF KENT
%% Assignment 1.24
%%
%% Tests for `shapes.erl`
-module(shapes_test).
-include_lib("eunit/include/eunit.hrl").

perimeter_test() ->
  45 = shapes:perimeter({triangle, {10,20,15}}),
  60 = shapes:perimeter({rectangle,{10,20}}).

area_test() ->
  72.61843774138907 = shapes:area({triangle,{10,20,15}}),
  200 = shapes:area({rectangle,{10,20}}).

enclose_test() ->
  {rectangle, {10,20}} = shapes:enclose({rectangle,{10,20}}),
  {rectangle,{7.2618437741389075,20}} = shapes:enclose({triangle,{10,20,15}}).
