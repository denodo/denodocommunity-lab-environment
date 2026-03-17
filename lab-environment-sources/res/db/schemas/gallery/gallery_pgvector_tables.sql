CREATE EXTENSION IF NOT EXISTS vector;
COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';
SET default_tablespace = '';
SET default_table_access_method = heap;

CREATE TABLE photos (
    id integer NOT NULL,
    filename character varying(255) NOT NULL,
    file_path character varying(255) NOT NULL,
    description character varying(2048) NOT NULL,
    embedding vector(1536)
);

ALTER TABLE photos OWNER TO postgres;

CREATE SEQUENCE photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE photos_id_seq OWNER TO postgres;
ALTER SEQUENCE photos_id_seq OWNED BY photos.id;

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);

SELECT pg_catalog.setval('photos_id_seq', 11, true);

ALTER TABLE ONLY photos ADD CONSTRAINT photos_pkey PRIMARY KEY (id);
