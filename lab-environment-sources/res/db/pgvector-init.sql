CREATE USER denodo WITH PASSWORD 'denodo';
CREATE DATABASE denodo_vector OWNER denodo;
GRANT ALL PRIVILEGES ON DATABASE denodo_vector TO denodo;

\c denodo_vector
CREATE EXTENSION IF NOT EXISTS vector;
COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';
SET default_tablespace = '';
SET default_table_access_method = heap;

/*************************
 BANK DATASET 
 *************************/
CREATE DATABASE bank OWNER denodo;
GRANT ALL PRIVILEGES ON DATABASE bank TO denodo;

\c bank
\i /mnt/schemas/bank/bank_postgresql_tables.sql

COPY customers     FROM '/mnt/data/bank/customers.csv'     DELIMITER ',' CSV;
COPY loan_officers FROM '/mnt/data/bank/loan_officers.csv' DELIMITER ',' CSV;
COPY properties    FROM '/mnt/data/bank/properties.csv'    DELIMITER ',' CSV;
COPY loans         FROM '/mnt/data/bank/loans.csv'         DELIMITER ',' CSV;
COPY payments      FROM '/mnt/data/bank/payments.csv'      DELIMITER ',' CSV;
COPY underwriting  FROM '/mnt/data/bank/underwriting.csv'  DELIMITER ',' CSV;
COPY rates         FROM '/mnt/data/bank/rates.csv'         DELIMITER ',' CSV;

GRANT ALL PRIVILEGES ON customers TO denodo;
GRANT ALL PRIVILEGES ON loan_officers TO denodo;
GRANT ALL PRIVILEGES ON properties TO denodo;
GRANT ALL PRIVILEGES ON loans TO denodo;
GRANT ALL PRIVILEGES ON payments TO denodo;
GRANT ALL PRIVILEGES ON underwriting TO denodo;
GRANT ALL PRIVILEGES ON rates TO denodo;

/*************************
 Gallery DATASET (PGVector)
 *************************/
CREATE DATABASE gallery OWNER denodo;
GRANT ALL PRIVILEGES ON DATABASE gallery TO denodo;

\c gallery
\i /mnt/schemas/gallery/gallery_pgvector_tables.sql

COPY photos FROM '/mnt/data/gallery/photos.csv'     DELIMITER '	' CSV;

GRANT ALL PRIVILEGES ON photos TO denodo;

