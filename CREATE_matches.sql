-- Table: public.players

-- DROP TABLE public.players;

CREATE TABLE public.players
(
	player_id integer NOT null,
	first_name character varying COLLATE pg_catalog."default",
	last_name character varying COLLATE pg_catalog."default",
	hand char,
	country_code character varying COLLATE pg_catalog."default",
    CONSTRAINT players_pkey PRIMARY KEY (player_id)
)

TABLESPACE pg_default;

ALTER TABLE public.players
    OWNER to postgres;