CREATE TABLE client_type ( 
	code	   	varchar(2) NOT NULL primary key,
	type_value        	varchar(100) NULL
	)
;

CREATE TABLE client ( 
	client_id   	varchar(50) NOT NULL primary key,
	name    	varchar(100) NOT NULL,
	surname   	varchar(100) NOT NULL,
	client_type    	varchar(2) NOT NULL,
  CONSTRAINT `client_type_code`
  FOREIGN KEY (client_type)
        REFERENCES client_type(code) ON DELETE CASCADE
	)
;

CREATE TABLE address ( 
	client_fid   	varchar(50) NOT NULL,
	street      	varchar(100) NULL,
	city         	varchar(100) NULL,
	zip          	varchar(100) NULL,
	state        	varchar(100) NULL,
	primary_phone	varchar(100) NULL,
  CONSTRAINT `client_address`
  FOREIGN KEY (client_fid)
        REFERENCES client(client_id) ON DELETE CASCADE
	)
;
