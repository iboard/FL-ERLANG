-module(first).
-export([
         double/1,
         multiply/2,
         area/3,
         square/1
        ]).

multiply(X,Y) ->
    X*Y.

double(X) ->
  multiply(2,X).

area(A,B,C) ->
  S = (A+B+C)/2,
      math:sqrt(S*(S-A)*(S-B)*(S-C)).

square(X) ->
  X*X.
