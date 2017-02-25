# Functional Programming In Erlang

## 1.24 Pulling it all together (Assignment)
Andreas Altendorfer, <andreas@altendorfer.at>

### Source

There are two files available as [Gists][] at

- shapes.erl
- shapes_test.erl

### Install

    mkdir shapes && cd shapes
    erlc shapes.erl shapes_test.erl \
    && erl -noshell -pa ebin \
       -eval "eunit:test(shapes_test, [verbose])" \
       -s init stop

Output should read as


    ======================== EUnit ========================
    module 'shapes_test'
    shapes_test: perimeter_test...[0.001 s] ok
    shapes_test: area_test...ok
    [done in 0.007 s]
    =======================================================
    2 tests passed.


## Solution

  - `shapes.erl` ....... source
  - `shapes_test.erl ... tests

You can test the code using `erl` or by running the tests as explained above.

### Shapes

The module exports the `perimeter/1` and `area/1` functions.
The functions can be called with `{rectangle,{H,W}}` or `{triangle,{A,B,C}}` 
to calculate the area and perimeter of the given shape.

#### Acceptence Criteria
  - Types other than `rectangle`, `triangle` MUST fail.
  - Valid calls calculates proper result
    - `shapes:area({rectangle,{10,20}})`
    - `shapes:perimeter({rectangle,{10,20}})`
    - `shapes:area({triangle,{10,20,15}})`
    - `shapes:perimeter({triangle,{10,20,15}})`



[Gists]: https://gist.github.com/iboard/2f4a2163cebc1dc39b534a1b2007d4ee
