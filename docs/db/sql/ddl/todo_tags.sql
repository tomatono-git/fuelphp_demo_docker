DROP TABLE IF EXISTS public.todo_tags
;

CREATE TABLE IF NOT EXISTS public.todo_tags
(
    id serial,
    tag character varying(200) NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_user integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_user integer,
    CONSTRAINT todo_tags_pkey PRIMARY KEY (id)
)
;
