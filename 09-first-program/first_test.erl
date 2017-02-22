-module(first_test).
-include_lib("eunit/include/eunit.hrl").

multiply_test() ->
  0 = first:multiply(0,0),
  1 = first:multiply(1,1),
  4 = first:multiply(2,2),
  6 = first:multiply(3,2).

double_test() ->
  0 = first:double(0),
  4 = first:double(2),
  6 = first:double(3).

area_test() ->
  94.99177595981665 = first:area(10,20,25).

square_test() ->
  9 = first:square(3),
  16= first:square(4).
