nmap <leader>rt :!erlc shapes.erl shapes_test.erl && erl -noshell -pa ebin -eval "eunit:test(shapes_test, [verbose])" -s init stop<CR>

