-module(main).
-export([count_words/1]).

count_words(FilePath) ->
    {ok, File} = file:open(FilePath, [read, raw, binary]),
    WordCount = count_words_in_stream(File, 0),
    file:close(File),
    FinalWordCount = if
        WordCount > 0 -> WordCount + 1;
        true -> WordCount
    end,
    io:format("Number of words in the file: ~p~n", [FinalWordCount]).

count_words_in_stream(File, WordCount) ->
    case file:read(File, 1) of
        {ok, <<Char/binary>>} ->
            NewWordCount = case Char of
                <<32>> -> % space
                    WordCount + 1;
                <<10>> -> % \n
                    WordCount + 1;
                <<9>> -> % \t
                    WordCount + 1;
                _ ->
                    WordCount
            end,
            count_words_in_stream(File, NewWordCount);
        eof ->
            WordCount
    end.
