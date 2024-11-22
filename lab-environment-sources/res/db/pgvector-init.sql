/*************************
 BANK DATASET 
 *************************/
CREATE USER denodo WITH PASSWORD 'denodo';
CREATE DATABASE bank OWNER denodo;
GRANT ALL PRIVILEGES ON DATABASE bank TO denodo;

\c bank
\i /mnt/schemas/bank/bank_pgvector_tables.sql

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
