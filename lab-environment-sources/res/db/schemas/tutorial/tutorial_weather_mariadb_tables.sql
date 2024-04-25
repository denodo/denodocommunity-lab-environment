create table weather_test (
	site_id integer not null,                    
	timestamp DATETIME ,                         
	air_temperature VARCHAR(10),                 
	cloud_coverage VARCHAR(10),                  
	dew_temperature VARCHAR(10),                 
	precip_depth_1_hr VARCHAR(10),               
	sea_level_pressure VARCHAR(10),              
	wind_direction VARCHAR(10),                  
	wind_speed VARCHAR(10)                       
);

create table weather_train (
	site_id integer not null,
	timestamp DATETIME ,
	air_temperature VARCHAR(10),
	cloud_coverage VARCHAR(10),
	dew_temperature VARCHAR(10),
	precip_depth_1_hr VARCHAR(10),
	sea_level_pressure VARCHAR(10),
	wind_direction VARCHAR(10),
	wind_speed VARCHAR(10) 
);

alter table weather_test add primary key(`site_id`,`timestamp`);