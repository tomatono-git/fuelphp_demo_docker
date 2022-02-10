-- Table: public.migration

DROP TABLE IF EXISTS public.migration;


CREATE TABLE IF NOT EXISTS public.migration
(
    id serial,
    type varchar(25) NOT NULL,
    name varchar(50) NOT NULL,
    migration varchar(100) NOT NULL DEFAULT ''
)
;
-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.migration
--     OWNER to app_dev;

-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id serial,
    name character varying(100) NOT NULL,
    email character varying(200) NOT NULL,
    password character varying(100) NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    create_user integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_user integer,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk_user_email UNIQUE (email),
    CONSTRAINT uk_user_name UNIQUE (name)
)
;
-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.users
--     OWNER to app_dev;
