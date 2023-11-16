-module(main).
-export([count_words/1]).

count_words(FilePath) ->
    {ok, BinaryData} = file:read_file(FilePath),
    Text = binary_to_list(BinaryData),
    Words = count_words_in_text(Text),
    io:format("Number of words in the file: ~p~n", [Words]).

count_words_in_text(Text) ->
    Words = string:tokens(Text, " \t\n"),
    length(Words).
