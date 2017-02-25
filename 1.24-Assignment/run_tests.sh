#!/bin/bash

erlc *.erl && erl -noshell -pa ebin \
  -eval "eunit:test(shapes_test,[verbose]),eunit:test(bitsum_test,[verbose])." \
  -s init stop


