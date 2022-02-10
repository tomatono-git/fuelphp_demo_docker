CREATE TABLE IF NOT EXISTS public.users
(
    id serial,
    username varchar(50) NOT NULL,
    password varchar(255) NOT NULL,
    "group" int NOT NULL DEFAULT 1,
    email varchar(255) NOT NULL,
    last_login varchar(25) NOT NULL,
    login_hash varchar(255) NOT NULL,
    profile_fields text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)
;

CREATE TABLE IF NOT EXISTS public.users_groups
(
    id serial,
    name varchar(255) NOT NULL,
    user_id int NOT NULL DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_groups_pkey PRIMARY KEY (id)
)
;

CREATE TABLE IF NOT EXISTS public.users_group_roles
(
    group_id int NOT NULL DEFAULT 0,
    role_id int NOT NULL DEFAULT 0,
    CONSTRAINT users_group_roles_pkey PRIMARY KEY (group_id, role_id)
)
;

CREATE TABLE IF NOT EXISTS public.users_group_permissions
(
    group_id int NOT NULL DEFAULT 0,
    perms_id int NOT NULL DEFAULT 0,
    CONSTRAINT users_group_permissions_pkey PRIMARY KEY (group_id, perms_id)
)
;

CREATE TYPE role_filter AS ENUM ('', 'A', 'D')
;

CREATE TABLE IF NOT EXISTS public.users_roles
(
    id serial,
    name varchar(255) NOT NULL,
    filter role_filter DEFAULT '',
    user_id int NOT NULL DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_roles_pkey PRIMARY KEY (id)
)
;

CREATE TABLE IF NOT EXISTS public.users_role_permissions
(
    role_id int NOT NULL DEFAULT 0,
    perms_id int NOT NULL DEFAULT 0,
    CONSTRAINT users_role_permissions_pkey PRIMARY KEY (role_id, perms_id)
)
;

CREATE TABLE IF NOT EXISTS public.users_permissions
(
    id serial,
    name varchar(32) NOT NULL,
    area varchar(25) NOT NULL,
    permission varchar(25) NOT NULL,
    description varchar(255) NOT NULL,
    user_id int NOT NULL DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_permissions_pkey PRIMARY KEY (id)
)
;

CREATE TABLE IF NOT EXISTS public.users_providers
(
    id serial,
    parent_id int NOT NULL DEFAULT 0,
    provider varchar(50) NOT NULL,
    uid varchar(255) NOT NULL,
    secret varchar(255) NULL,
    access_token varchar(255) NULL,
    expires varchar(255) NULL,
    refresh_token varchar(255) NULL,
    user_id int NOT NULL DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_providers_pkey PRIMARY KEY (id)
)
;

CREATE TYPE client_status AS ENUM ('development','pending','approved','rejected')
;

CREATE TABLE IF NOT EXISTS public.users_clients
(
    id serial,
    name varchar(32) NOT NULL DEFAULT '',
    client_id varchar(32) NOT NULL DEFAULT '',
    client_secret varchar(32) NOT NULL DEFAULT '',
    redirect_uri varchar(255) NOT NULL DEFAULT '',
    auto_approve smallint NOT NULL DEFAULT 0,
    autonomous smallint NOT NULL DEFAULT 0,
    status client_status NOT NULL DEFAULT 'development',
    suspended smallint NOT NULL DEFAULT 0,
    notes text NOT NULL,
    CONSTRAINT users_clients_pkey PRIMARY KEY (id)
)
;

CREATE TYPE session_type AS ENUM ('user','auto')
;

CREATE TYPE session_stage AS ENUM ('request','granted')
;

CREATE TABLE IF NOT EXISTS public.users_sessions
(
    id serial,
    client_id varchar(32) NOT NULL DEFAULT '',
    redirect_uri varchar(255) NOT NULL DEFAULT '',
    type_id varchar(64) NOT NULL,
    type session_type NOT NULL DEFAULT 'user',
    code text NOT NULL,
    access_token varchar(50) NOT NULL DEFAULT '',
    stage session_stage NOT NULL DEFAULT 'request',
    first_requested int NOT NULL DEFAULT 0,
    last_updated int NOT NULL DEFAULT 0,
    limited_access smallint NOT NULL DEFAULT 0,
    CONSTRAINT users_sessions_pkey PRIMARY KEY (id)
)
;

CREATE TABLE IF NOT EXISTS public.users_scopes
(
    id serial,
    scope varchar(64) NOT NULL DEFAULT '',
    name varchar(64) NOT NULL DEFAULT '',
    description varchar(255) NOT NULL DEFAULT '',
    CONSTRAINT users_scopes_pkey PRIMARY KEY (id)
)
;

CREATE TABLE IF NOT EXISTS public.users_sessionscopes
(
    id serial,
    session_id int NOT NULL,
    access_token varchar(50) NOT NULL DEFAULT '',
    scope varchar(64) NOT NULL DEFAULT '',
    CONSTRAINT users_sessionscopes_pkey PRIMARY KEY (id)
)
;
