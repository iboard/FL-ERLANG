-module(second).
-export([
         perimeter/2,
         area/2
        ]).

perimeter(A,B) ->
  C = hypotenuse(A,B),
      A+B+C.

area(A,B) ->
  C = hypotenuse(A,B),
      first:area(A,B,C).

hypotenuse(A,B) ->
  C2 = first:square(A) + first:square(B),
       math:sqrt(C2).

