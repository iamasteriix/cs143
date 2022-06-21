SELECT
    '#' || tag AS tag,
    count(*)
FROM (
    SELECT
        DISTINCT t1.data ->> 'id' AS id_tweets,
        jsonb_array_elements(coalesce(t1.data -> 'entities' -> 'hashtags', '[]') || coalesce(t1.data -> 'extended_tweet' -> 'entities' -> 'hashtags', '[]')) ->> 'text' AS tag
    FROM tweets_jsonb t1
    WHERE
        t1.data -> 'entities' -> 'hashtags' @@ '$[*].text == "coronavirus"'
        OR t1.data -> 'extended_tweet' -> 'entities' -> 'hashtags' @@ '$[*].text == "coronavirus"'
    ) t
GROUP BY (1)
ORDER BY count DESC, tag
LIMIT 1000;
