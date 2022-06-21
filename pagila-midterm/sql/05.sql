-- PART 1:
-- Rewrite the SQL table below to use a maximally efficient column order.
-- You may directly modify this table.


CREATE TABLE project (
    developer_id UUID,
    author_id BIGINT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMPTZ,
    id SERIAL PRIMARY KEY,
    target_id INTEGER,
    project_id INTEGER NOT NULL UNIQUE,
    action SMALLINT NOT NULL,
    target_type VARCHAR(2),
    developer_addr INET,
    title CHAR(256),
    data TEXT
);


-- PART 2:
-- Complete the table below describing the number of bytes used by the row created by the following insert statement.
-- Use the original column order defined above,
-- and not your modified order from part 1.

INSERT INTO project VALUES (
    0,						-- 4 bytes
    55,						-- 8 bytes
    NULL,					-- 0 bytes
    NULL,					-- 0 bytes
    NULL,					-- 0 bytes
    'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',	-- 16 bytes
    NULL,					-- 0 bytes
    NULL,					-- 0 bytes
    88,						-- 4 bytes
    12,						-- 2 bytes
    'now',					-- 8 bytes
    '2022-03-09T18:34:27+00:00'			-- 8 bytes
);

-- Header:	32 bytes
-- Data:	56 bytes
-- Padding:	0 bytes
-- Total:	88 bytes
