#!/bin/bash

php oil g scaffold todos -f \
    title:varchar[200] \
    comment:text \
    state:int \
    due_date:date \
    due_time:time \
    created_user:int \
    updated_user:int \
    --mysql-timestamp

php oil g scaffold todo_tags -f \
    tag:varchar[200] \
    created_user:int \
    updated_user:int \
    --mysql-timestamp

# -- DROP TABLE IF EXISTS public.todos
# -- ;

# CREATE TABLE IF NOT EXISTS public.todos
# (
#     id serial,
#     name character varying(200) NOT NULL,
#     content text NOT NULL,
#     tag character varying(200) NOT NULL,
#     created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
#     created_user integer NOT NULL,
#     updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
#     updated_user integer,
#     CONSTRAINT todos_pkey PRIMARY KEY (id)
# )
# ;
