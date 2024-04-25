create table meter_reading_train (
	building_id integer not null,                                                          
	meter integer not null,                                                                
	timestamp timestamp not null,                                                          
	meter_reading numeric
);

create table meter_reading_test (
	row_id integer primary key,
	building_id integer not null,
	meter integer not null,
	timestamp timestamp not null
);

CREATE TABLE date_dim (
	d_date_sk integer NOT NULL,
	d_date_id character(16) NOT NULL,
	d_date date,
	d_month_seq integer,
	d_week_seq integer,
	d_quarter_seq integer,
	d_year integer,
	d_dow integer,
	d_moy integer,
	d_dom integer,
	d_qoy integer,
	d_fy_year integer,
	d_fy_quarter_seq integer,
	d_fy_week_seq integer,
	d_day_name character(9),
	d_quarter_name character(6),
	d_holiday character(1),
	d_weekend character(1),
	d_following_holiday character(1),
	d_first_dom integer,
	d_last_dom integer,
	d_same_day_ly integer,
	d_same_day_lq integer,
	d_current_day character(1),
	d_current_week character(1),
	d_current_month character(1),
	d_current_quarter character(1),
	d_current_year character(1)
);

CREATE UNIQUE INDEX idx1 ON public.meter_reading_test USING btree (timestamp, building_id, meter);
CREATE INDEX idx2 ON public.meter_reading_test USING btree (date_trunc('day', timestamp), building_id, meter);