SELECT
    '#' || tag AS tag,
    count(*)
FROM (
    SELECT
        DISTINCT t1.data ->> 'id' AS id_tweets,
        jsonb_array_elements(coalesce(t1.data -> 'entities' -> 'hashtags', '[]') || coalesce(t1.data -> 'extended_tweet' -> 'entities' -> 'hashtags', '[]')) ->> 'text' AS tag
    FROM tweets_jsonb t1
    WHERE to_tsvector('english', coalesce(t1.data -> 'extended_tweet' ->> 'full_text', data ->> 'text')) @@ to_tsquery('english', 'coronavirus')
        AND t1.data ->> 'lang' = 'en'
    ) t
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;
