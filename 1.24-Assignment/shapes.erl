%% Andreas Altendorfer, <andreas@altendorfer.at>
%% FUNCITIONAL PROGRAMMING IN ERLANG - MOOC @ THE UNIVERSITY OF KENT
%% Assignment 1.24
%%
%% Tests for `shapes.erl`
-module(shapes).
-export([perimeter/1, area/1, enclose/1]).

% Calculate the perimeter of a triangle by the length of it's sides
perimeter({triangle, {A,B,C}}) ->
  A + B + C;
% Calculate the perimeter of a rectangle by height and width
perimeter({rectangle, {H,W}}) ->
  2 * H + 2 * W.


% Calculate the area of a triangle by the length of it's sides
area({triangle, Params}) ->
  {A,B,C} = Params,
  S = perimeter({triangle, Params}) / 2,
  math:sqrt(S * (S-A) * (S-B) * (S-C));
% Calculate the area of a rectangle by height and width
area({rectangle, {H,W}}) ->
  H * W.


% Calculate the smallest possible rectangle enclosing the given shape
enclose({rectangle,{H,W}}) ->
  {rectangle,{H,W}};
enclose({triangle,Params}) ->
  Width = longest_side({triangle,Params}),
  Height  = 2 * ( area({triangle,Params}) / Width ),
  {rectangle,{Height,Width}}.
 

% Little Helpers

longest_side({triangle,{A,B,C}}) ->
  [L|_Tail] = lists:sort( fun(S1,S2) -> S1 >= S2 end, [A,B,C]),
  L.
