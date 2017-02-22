-module(second_test).
-include_lib("eunit/include/eunit.hrl").

perimeter_test() ->
  0.0 = second:perimeter(0,0),
  52.3606797749979 = second:perimeter(10,20).

area_test() ->
  0.0 = second:area(0,0),
  99.99999999999999 = second:area(10,20).

% don't test private functions!
% hypotenuse_test() ->
%   22.360679774997898 = second:hypotenuse(10,20).

