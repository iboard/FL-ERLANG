# Functional Programming In Erlang

## 1.24 Pulling it all together (Assignment)

- Andreas Altendorfer, <andreas@altendorfer.at>
- 2017-02-25

### Source

The files are available in [Gist][] at Github.

1. Make and change to a directory of your choice.
`assignment-1.24` was taken for this README example.

2. [Download][] and unpack the files to the current directory

> All my source regarding FL MOOC can be forked at Github's [repository][]

#### Files

##### Part 1 / Shapes

- shapes.erl
- shapes_test.erl

##### Part 2 / Summing the bits

- bitsum.erl
- bitsum_test.erl


### Compile and run tests

    # Copy to your shell from here --------
    erlc ./**/*erl \
    && erl -noshell -pa ebin \
       -eval "eunit:test(shapes_test,[verbose]),eunit:test(bitsum_test,[verbose])" \
       -s init stop
    # ----------------------------- to here
    # should show the following output

    ======================== EUnit ========================
    module 'shapes_test'
      shapes_test: perimeter_test...[0.001 s] ok
      shapes_test: area_test...ok
      shapes_test: enclose_test...ok
      [done in 0.010 s]
    =======================================================
      All 3 tests passed.
    ======================== EUnit ========================
    module 'bitsum_test'
      bitsum_test: bitsum_0_test...[0.001 s] ok
      bitsum_test: bitsum_1_test...ok
      bitsum_test: bitsum_2_test...ok
      bitsum_test: bitsum_3_test...ok
      bitsum_test: bitsum_4_test...ok
      bitsum_test: bitsum_5_test...ok
      bitsum_test: bitsum_6_test...ok
      bitsum_test: bitsum_7_test...ok
      bitsum_test: bitsum_8_test...ok
      bitsum_test: bitsum_15_test...ok
      bitsum_test: bitsum_29_test...ok
      [done in 0.035 s]
    =======================================================
      All 11 tests passed.


## Solutions

### Part 1 / Shapes

The module `shapes` exports functions `perimeter/1`, `area/1`, and `enclose/1`.
The functions can be called with `{rectangle,{H,W}}` or `{triangle,{A,B,C}}`.

The third function `enclose` calculates the smallest enclosing rectangele of 
the given shape.

#### Files

  - shapes.erl
  - shapes_test.erl


#### Acceptence Criteria

  - Types other than `rectangle`, `triangle`, `enclose` MUST fail.
  - Valid calls calculates proper result (for details see `shapes_test`)
    - Rectangle
      - `shapes:area({rectangle,{10,20}})`
      - `shapes:perimeter({rectangle,{10,20}})`
      - `shapes:enclose({rectangle,{10,20}})`
    - Triangle
      - `shapes:area({triangle,{10,20,15}})`
      - `shapes:perimeter({triangle,{10,20,15}})`
      - `shapes:enclose({triangle,{10,20,15}})`


### Tests

    perimeter_test() ->
      45 = shapes:perimeter({triangle, {10,20,15}}),
      60 = shapes:perimeter({rectangle,{10,20}}).

    area_test() ->
      72.61843774138907 = shapes:area({triangle,{10,20,15}}),
      200 = shapes:area({rectangle,{10,20}}).

    enclose_test() ->
      {rectangle, {10,20}} = shapes:enclose({rectangle,{10,20}}),
      {rectangle,{7.2618437741389075,20}} = shapes:enclose({triangle,{10,20,15}}).

    shape_test() ->
      %% missing test to ensure wrong types will fail
      %% I don't know yet how to test either an exception occours


### Part 2 / Summing the bits


The module `bitsum` exports functions `bits_tail/1` and `bits_recursive/1`.
Both functions calculates the number of set bits in a given integer.

Where `bit_tail` implements the "tail-pattern" vs `bit_recursive`.

**Tail Approach**

    sum_tail({0,Count}) ->
      Count;
    sum_tail({N,Count}) when N > 0 ->
      sum_tail({N bsr 1, Count + N band 1}).

    bits_tail(3)
    = sum_tail({3,0})
    = sum_tail({1,1})
    = sum_tail({0,2})
    = 2

**Recursive**

    recursive(0) ->
      0;
    recursive(N) when N > 0 ->
      (N band 1) + recursive(N bsr 1).

    recursive(3)
    = 1 + recursive(1)
    = 1 + 1 + recursive(0)
    = 2

I like the second approach a little bit more because
in my opinion it is simpler to read. Though I understand
that the tail-approach is better at run time.

In real life I would implement some bench-tests if not
sure about execution behavior.


#### Files

  - bitsum.erl
  - bitsum_test.erl

#### Acceptance Criteria

  - Negative integers fails
  - Test for several numbers pass

### Tests

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


[Gist]: https://gist.github.com/iboard/2f4a2163cebc1dc39b534a1b2007d4ee
[Download]: https://gist.github.com/iboard/2f4a2163cebc1dc39b534a1b2007d4ee/archive/8d76a66d1e45ea9c234f7ad9b29302e43ed56c68.zip
[repository]: https://github.com/iboard/FL-ERLANG
