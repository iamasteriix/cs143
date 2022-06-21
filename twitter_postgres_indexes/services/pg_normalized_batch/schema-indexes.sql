CREATE INDEX ON tweet_tags(id_tweets, tag);

CREATE INDEX ON tweet_tags(tag);

CREATE INDEX ON tweets(id_tweets, lang);

/*
CREATE INDEX ON tweets USING rum(
    to_tsvector('english', text) rum_tsvector_addon_ops,
    lang)
WITH(
    attach='lang',
    to='to_tsvector('english', text)');
*/

CREATE INDEX ON tweets USING gin(to_tsvector('english', text));
CREATE INDEX ON tweets(lang);
