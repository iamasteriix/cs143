SELECT
    lang,
    count(*)
FROM (
    SELECT
        DISTINCT t1.data ->> 'id' AS id_tweets,
        t1.data ->> 'lang' AS lang
    FROM tweets_jsonb t1
    WHERE
        t1.data -> 'entities' -> 'hashtags' @@ '$[*].text == "coronavirus"'
        OR t1.data -> 'extended_tweet' -> 'entities' -> 'hashtags' @@ '$[*].text == "coronavirus"'
    ) t
GROUP BY (1)
ORDER BY count DESC, lang;
