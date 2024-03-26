CREATE USER 'denodo'@'%' IDENTIFIED BY 'denodo';
CREATE DATABASE tpc_ds;

USE tpc_ds;
source /mnt/schemas/tpc-ds/tpcds_mariadb_tables.sql
source /mnt/schemas/tpc-ds/tpcds_mariadb_tables_ri.sql

LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/call_center.dat'            INTO TABLE call_center            FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/customer.dat'               INTO TABLE customer               FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/customer_address.dat'       INTO TABLE customer_address       FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/customer_demographics.dat'  INTO TABLE customer_demographics  FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/dbgen_version.dat'          INTO TABLE dbgen_version          FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/income_band.dat'            INTO TABLE income_band            FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/item.dat'                   INTO TABLE item                   FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/promotion.dat'              INTO TABLE promotion              FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/reason.dat'                 INTO TABLE reason                 FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/ship_mode.dat'              INTO TABLE ship_mode              FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/store.dat'                  INTO TABLE store                  FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/warehouse.dat'              INTO TABLE warehouse              FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/web_page.dat'               INTO TABLE web_page               FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/web_site.dat'               INTO TABLE web_site               FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/catalog_page.dat'           INTO TABLE catalog_page           FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/tpc-ds/household_demographics.dat' INTO TABLE household_demographics FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n';

GRANT ALL PRIVILEGES ON tpc_ds.* TO 'denodo'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE sales;

USE sales;
source /mnt/schemas/tutorial/tutorial_sales_mariadb_tables.sql
source /mnt/data/tutorial/tutorial_sales.sql

GRANT ALL PRIVILEGES ON sales.* TO 'denodo'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE crm;

USE crm;
source /mnt/schemas/tutorial/tutorial_crm_mariadb_tables.sql
source /mnt/data/tutorial/tutorial_crm.sql

GRANT ALL PRIVILEGES ON crm.* TO 'denodo'@'%';
FLUSH PRIVILEGES;


CREATE DATABASE calltracking;
USE calltracking;

source /mnt/schemas/call-center/cc_mariadb_tables.sql
LOAD DATA LOCAL INFILE '/mnt/data/call-center/agent.csv'            INTO TABLE agent            FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/call-center/case_definition.csv'  INTO TABLE case_definition  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/call-center/customer.csv'         INTO TABLE customer         FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/call-center/problem.csv'          INTO TABLE problem          FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/call-center/service_call.csv'     INTO TABLE service_call     FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/call-center/service_location.csv' INTO TABLE service_location FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE '/mnt/data/call-center/status_code.csv'      INTO TABLE status_code      FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

GRANT ALL PRIVILEGES ON calltracking.* TO 'phone'@'%' identified by 'phone';
GRANT ALL PRIVILEGES ON calltracking.* TO 'denodo'@'%';
FLUSH PRIVILEGES;
