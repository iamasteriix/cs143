CREATE INDEX ON tweets_jsonb USING gin((data -> 'entities' -> 'hashtags'));

CREATE INDEX ON tweets_jsonb USING gin((data -> 'extended_tweet' -> 'entities' -> 'hashtags'));

CREATE INDEX ON tweets_jsonb USING gin((to_tsvector('english', coalesce(data -> 'extended_tweet' ->> 'full_text', data ->> 'text'))));
