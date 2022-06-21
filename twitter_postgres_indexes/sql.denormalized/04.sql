/*
SELECT count(*)
FROM tweets 
WHERE to_tsvector('english', text) @@ to_tsquery('english', 'coronavirus') AND lang = 'en';
*/

SELECT count(*)
FROM tweets_jsonb t
WHERE
    to_tsvector('english', coalesce(t.data -> 'extended_tweet' ->> 'full_text', t.data->> 'text')) @@ to_tsquery('english', 'coronavirus')
    AND t.data ->> 'lang' = 'en';

-- bc apparently "tweets" is not a table or a materialized view.
-- once again I am being attacked for presenting new ideas.
