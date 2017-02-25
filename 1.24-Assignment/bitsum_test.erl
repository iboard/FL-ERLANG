%% Andreas Altendorfer, <andreas@altendorfer.at>
%% FUNCITIONAL PROGRAMMING IN ERLANG - MOOC @ THE UNIVERSITY OF KENT
%% Assignment 1.24
%%
%% Tests for `bitsum.erl`
-module(bitsum_test).
-include_lib("eunit/include/eunit.hrl").

%% 0 = 2#0
bitsum_0_test() -> 
  0 = bitsum:bits_tail(0),
  0 = bitsum:bits_recursive(0).

%% 1 = 2#1
bitsum_1_test() -> 
  1 = bitsum:bits_tail(1),
  1 = bitsum:bits_recursive(1).

%% 2 = 2#10
bitsum_2_test() -> 
  1 = bitsum:bits_tail(2),
  1 = bitsum:bits_recursive(2).

%% 3 = 2#11
bitsum_3_test() -> 
  2 = bitsum:bits_tail(3),
  2 = bitsum:bits_recursive(3).

%% 4 = 2#100
bitsum_4_test() -> 
  1 = bitsum:bits_tail(4),
  1 = bitsum:bits_recursive(4).

%% 5 = 2#101
bitsum_5_test() -> 
  2 = bitsum:bits_tail(5),
  2 = bitsum:bits_recursive(5).

%% 6 = 2#110
bitsum_6_test() -> 
  2 = bitsum:bits_tail(6),
  2 = bitsum:bits_recursive(6).

%% 7 = 2#111
bitsum_7_test() -> 
  3 = bitsum:bits_tail(7),
  3 = bitsum:bits_recursive(7).

%% 8 = 2#1000
bitsum_8_test() -> 
  1 = bitsum:bits_tail(8),
  1 = bitsum:bits_recursive(8).

%% 15 = 2#1111
bitsum_15_test() -> 
  4 = bitsum:bits_tail(15),
  4 = bitsum:bits_recursive(15).

%% 29 = 2#11101
bitsum_29_test() -> 
  4 = bitsum:bits_tail(29),
  4 = bitsum:bits_recursive(29).

