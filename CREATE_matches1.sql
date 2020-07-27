-- Table: public.matches

-- DROP TABLE public.matches;

CREATE TABLE public.matches
(
    id bigint NOT NULL DEFAULT nextval('matches_id_seq'::regclass),
    loser_age real,
    loser_id integer NOT NULL,
    loser_name character varying COLLATE pg_catalog."default",
    loser_rank integer,
    winner_age real,
    winner_id integer NOT NULL,
    winner_name character varying COLLATE pg_catalog."default",
    winner_rank integer,
    CONSTRAINT matches_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.matches
    OWNER to postgres;