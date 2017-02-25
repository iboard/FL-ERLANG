%% Andreas Altendorfer, <andreas@altendorfer.at>
%% FUNCITIONAL PROGRAMMING IN ERLANG - MOOC @ THE UNIVERSITY OF KENT
%% Assignment 1.24
%%
%% Tests: see `bitsum_test.erl`
-module(bitsum).
-export([bits_tail/1, bits_recursive/1]).

%% BITS API

%% Tail Recursion Approach
bits_tail(N) ->
  sum_tail({N,0}).

%% recursive Recursion Approach
bits_recursive(N) ->
  recursive(N).

%% BITS IMPLEMENTATION

%% Tail Approach

sum_tail({0,Count}) ->
  Count;
sum_tail({N,Count}) when N > 0 ->
  sum_tail({N bsr 1, Count + N band 1}). 

%% Recursive Approach

recursive(0) ->
  0;
recursive(N) when N > 0 ->
  (N band 1) + recursive(N bsr 1).
  
