-module(shapes).
-export([perimeter/1, area/1]).

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
