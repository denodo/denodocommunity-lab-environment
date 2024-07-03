/*************************
 TPC-DS DATASET 
 *************************/
CREATE USER denodo WITH PASSWORD 'denodo';
CREATE DATABASE tpc_ds OWNER denodo;
GRANT ALL PRIVILEGES ON DATABASE tpc_ds TO denodo;

\c tpc_ds
\i /mnt/schemas/tpc-ds/tpcds_postgresql_tables.sql
\i /mnt/schemas/tpc-ds/tpcds_postgresql_tables_ri.sql

COPY date_dim        FROM '/mnt/data/tpc-ds/date_dim.dat'        DELIMITER '|' CSV;
COPY time_dim        FROM '/mnt/data/tpc-ds/time_dim.dat'        DELIMITER '|' CSV;
COPY inventory       FROM '/mnt/data/tpc-ds/inventory.dat'       DELIMITER '|' CSV;
COPY web_sales       FROM '/mnt/data/tpc-ds/web_sales.dat'       DELIMITER '|' CSV;
COPY web_returns     FROM '/mnt/data/tpc-ds/web_returns.dat'     DELIMITER '|' CSV;
COPY catalog_sales   FROM '/mnt/data/tpc-ds/catalog_sales.dat'   DELIMITER '|' CSV;
COPY catalog_returns FROM '/mnt/data/tpc-ds/catalog_returns.dat' DELIMITER '|' CSV;
COPY store_sales     FROM '/mnt/data/tpc-ds/store_sales.dat'     DELIMITER '|' CSV;
COPY store_returns   FROM '/mnt/data/tpc-ds/store_returns.dat'   DELIMITER '|' CSV;

GRANT ALL PRIVILEGES ON date_dim TO denodo;
GRANT ALL PRIVILEGES ON time_dim TO denodo;
GRANT ALL PRIVILEGES ON inventory TO denodo;
GRANT ALL PRIVILEGES ON web_sales TO denodo;
GRANT ALL PRIVILEGES ON web_returns TO denodo;
GRANT ALL PRIVILEGES ON catalog_sales TO denodo;
GRANT ALL PRIVILEGES ON catalog_returns TO denodo;
GRANT ALL PRIVILEGES ON store_sales TO denodo;
GRANT ALL PRIVILEGES ON store_returns TO denodo;

/*************************
 HUMAN-RESOURCES DATASET 
 *************************/
CREATE USER human_resources WITH PASSWORD 'human';
CREATE DATABASE human_resources OWNER human_resources;
GRANT ALL PRIVILEGES ON DATABASE human_resources TO human_resources;

\c human_resources
\i /mnt/schemas/human-resources/hr_postgresql_tables.sql

COPY "REGIONS"     FROM '/mnt/data/human-resources/regions.csv'     WITH (FORMAT CSV, DELIMITER ',', FORCE_NULL("REGION_ID"));
COPY "JOBS"        FROM '/mnt/data/human-resources/jobs.csv'        DELIMITER ',' CSV;
COPY "COUNTRIES"   FROM '/mnt/data/human-resources/countries.csv'   DELIMITER ',' CSV;
COPY "LOCATIONS"   FROM '/mnt/data/human-resources/locations.csv'   WITH (FORMAT CSV, DELIMITER ',', FORCE_NULL("COUNTRY_CODE"));;
COPY "DEPARTMENTS" FROM '/mnt/data/human-resources/departments.csv' WITH (FORMAT CSV, DELIMITER ',', FORCE_NULL("DEPARTMENT_ID"));
COPY "EMPLOYEES"   FROM '/mnt/data/human-resources/employees.csv'   DELIMITER ',' CSV;

ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID") REFERENCES "EMPLOYEES" ("EMPLOYEE_ID");

GRANT ALL PRIVILEGES ON "REGIONS" TO human_resources;
GRANT ALL PRIVILEGES ON "JOBS" TO human_resources;
GRANT ALL PRIVILEGES ON "COUNTRIES" TO human_resources;
GRANT ALL PRIVILEGES ON "LOCATIONS" TO human_resources;
GRANT ALL PRIVILEGES ON "DEPARTMENTS" TO human_resources;
GRANT ALL PRIVILEGES ON "EMPLOYEES" TO human_resources;

/*************************
 WEB ORDERS DATASET 
 *************************/
CREATE USER website_sys WITH PASSWORD 'website';
CREATE DATABASE website_sys OWNER website_sys;
GRANT ALL PRIVILEGES ON DATABASE website_sys TO website_sys;

\c website_sys
\i /mnt/schemas/web-orders/wo_postgresql_tables.sql

COPY "CUSTOMER"   FROM '/mnt/data/web-orders/customers.csv'   WITH (FORMAT CSV, DELIMITER ',',FORCE_NULL("MAIN_POSTCODE"));
COPY "STORAGES"   FROM '/mnt/data/web-orders/storages.csv'    DELIMITER ',' CSV ;
COPY "ORDERS"     FROM '/mnt/data/web-orders/orders.csv'      WITH (FORMAT CSV, DELIMITER ',',FORCE_NULL("DATE_DELIVERED"));
COPY "STOCK"      FROM '/mnt/data/web-orders/stock.csv'       WITH (FORMAT CSV, DELIMITER ',');
COPY "ORDER_ITEM" FROM '/mnt/data/web-orders/order_items.csv' WITH (FORMAT CSV, DELIMITER ',');
COPY "EMPLOYEES"  FROM '/mnt/data/human-resources/employees.csv'   DELIMITER ',' CSV;

GRANT ALL PRIVILEGES ON "CUSTOMER" TO website_sys;
GRANT ALL PRIVILEGES ON "STORAGES" TO website_sys;
GRANT ALL PRIVILEGES ON "ORDERS" TO website_sys;
GRANT ALL PRIVILEGES ON "STOCK" TO website_sys;
GRANT ALL PRIVILEGES ON "ORDER_ITEM" TO website_sys;
GRANT ALL PRIVILEGES ON "EMPLOYEES" TO website_sys;

CREATE USER wxinc WITH PASSWORD 'incident';
CREATE DATABASE wxinc OWNER wxinc;
CREATE USER incident_cc WITH PASSWORD 'incident';

GRANT ALL PRIVILEGES ON DATABASE wxinc TO wxinc;
GRANT ALL PRIVILEGES ON DATABASE wxinc TO incident_cc;

\c wxinc
\i /mnt/schemas/web-orders/wo_postgresql_pl.sql

COPY "OL_SERVICE_REQUEST" FROM '/mnt/data/web-orders/ol_service_request.csv' (FORMAT CSV, DELIMITER ',', FORCE_NULL("CASE_CLOSED_DATE"));

GRANT ALL PRIVILEGES ON "OL_SERVICE_REQUEST" TO wxinc;
GRANT SELECT ON "OL_SERVICE_REQUEST" TO incident_cc;

/*************************
 HISTORICAL ORDERS DATASET 
 *************************/
CREATE DATABASE historical_orders OWNER website_sys;
GRANT ALL PRIVILEGES ON DATABASE historical_orders TO website_sys;

\c historical_orders
\i /mnt/schemas/historical-orders/ho_postgresql_tables.sql

COPY "ORDERS"     FROM '/mnt/data/historical-orders/orders.csv'     WITH (FORMAT CSV, DELIMITER ',');
COPY "ORDER_ITEM" FROM '/mnt/data/historical-orders/order_item.csv' WITH (FORMAT CSV, DELIMITER ',');
COPY "CUSTOMER"   FROM '/mnt/data/web-orders/customers.csv'        WITH (FORMAT CSV, DELIMITER ',',FORCE_NULL("MAIN_POSTCODE"));

GRANT ALL PRIVILEGES ON "ORDERS" TO website_sys;
GRANT ALL PRIVILEGES ON "ORDER_ITEM" TO website_sys;
GRANT ALL PRIVILEGES ON "CUSTOMER" TO website_sys;

/*************************
 METER_READING DATASET 
 *************************/
CREATE USER udstutorial WITH PASSWORD 'udstutorial';
CREATE DATABASE meter_reading OWNER udstutorial;
GRANT ALL PRIVILEGES ON DATABASE meter_reading TO udstutorial;

\c meter_reading
\i /mnt/schemas/tutorial/tutorial_meter_reading_postgresql_tables.sql

/*COPY meter_reading_train FROM '/mnt/data/tutorial/competition/train.csv' CSV HEADER;
COPY meter_reading_test  FROM '/mnt/data/tutorial/competition/test.csv' CSV HEADER;*/
COPY date_dim            FROM '/mnt/data/tpc-ds/date_dim.dat'        DELIMITER '|' CSV;

GRANT ALL PRIVILEGES ON meter_reading_train TO udstutorial;
GRANT ALL PRIVILEGES ON meter_reading_test TO udstutorial;
GRANT ALL PRIVILEGES ON date_dim TO udstutorial;