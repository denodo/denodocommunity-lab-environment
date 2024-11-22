CREATE EXTENSION vector;

CREATE TABLE IF NOT EXISTS image_metadata (
    image_source VARCHAR(4000), 
    first_name VARCHAR(1000), 
    last_name VARCHAR(1000), 
	content_summary VARCHAR(65535)
);

CREATE TABLE IF NOT EXISTS customers (
	"customer_id"	INTEGER,
	"first_name"	TEXT,
	"last_name"	TEXT,
	"email"	TEXT,
	"phone_number"	TEXT,
	"address"	TEXT,
	"city"	TEXT,
	"state"	TEXT,
	"zip_code"	TEXT,
	PRIMARY KEY("customer_id")
);

CREATE TABLE IF NOT EXISTS loan_officers (
	"loan_officer_id"	INTEGER,
	"first_name"	TEXT,
	"last_name"	TEXT,
	"email"	TEXT,
	"phone_number"	TEXT,
	PRIMARY KEY("loan_officer_id")
);
CREATE TABLE IF NOT EXISTS properties (
	"property_id"	INTEGER,
	"address"	TEXT,
	"city"	TEXT,
	"state"	TEXT,
	"zip_code"	TEXT,
	"property_value"	REAL,
	PRIMARY KEY("property_id")
);
CREATE TABLE IF NOT EXISTS loans (
	"loan_id"	INTEGER,
	"customer_id"	INTEGER,
	"loan_amount"	REAL,
	"interest_rate"	REAL,
	"term"	INTEGER,
	"property_id"	INTEGER,
	"loan_officer_id"	INTEGER,
	"status"	TEXT,
	PRIMARY KEY("loan_id"),
	FOREIGN KEY("customer_id") REFERENCES customers ("customer_id"),
	FOREIGN KEY("loan_officer_id") REFERENCES loan_officers ("loan_officer_id"),
	FOREIGN KEY("property_id") REFERENCES properties ("property_id")
);
CREATE TABLE IF NOT EXISTS payments (
	"payment_id"	INTEGER,
	"loan_id"	INTEGER,
	"payment_amount"	REAL,
	"payment_date"	TEXT,
	PRIMARY KEY("payment_id"),
	FOREIGN KEY("loan_id") REFERENCES loans ("loan_id")
);
CREATE TABLE IF NOT EXISTS underwriting (
	"underwriting_id"	INTEGER,
	"loan_id"	INTEGER,
	"credit_score"	INTEGER,
	"employment_history"	TEXT,
	"financial_history"	TEXT,
	PRIMARY KEY("underwriting_id"),
	FOREIGN KEY("loan_id") REFERENCES loans ("loan_id")
);
CREATE TABLE IF NOT EXISTS rates (
	"rate_id"	INTEGER,
	"loan_type"	TEXT,
	"term"	INTEGER,
	"interest_rate"	REAL,
	PRIMARY KEY("rate_id")
);