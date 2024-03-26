CREATE TABLE agent (
  `agent_id` int(11) DEFAULT NULL,
  `agent_code` varchar(13) DEFAULT NULL,
  `agent_name` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE case_definition (
  `case_id` int(11) DEFAULT NULL,
  `date_raised` timestamp DEFAULT NULL,
  `date_closed`timestamp DEFAULT NULL,
  `case_status` int(11) DEFAULT NULL,
  `case_summary` varchar(500) DEFAULT NULL,
  `case_comments` varchar(500) DEFAULT NULL,
  `customer_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE customer (
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(21) DEFAULT NULL,
  `customer_address` varchar(27) DEFAULT NULL,
  `phone_number` varchar(17) DEFAULT NULL,
  `customer_code` varchar(12) DEFAULT NULL,
  `job_title` varchar(36) DEFAULT NULL,
  `other_details` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE problem (
  `problem_code` int(11) DEFAULT NULL,
  `problem_description` varchar(41) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE service_call (
  `call_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `problem_code` int(11) DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `date_ticket_issued` datetime DEFAULT NULL,
  `date_call_received` datetime DEFAULT NULL,
  `other_details` varchar(250) DEFAULT NULL,
  `caller_phone` varchar(17) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `customer_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE service_location (
  `id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `business_name` varchar(12) DEFAULT NULL,
  `service_location` varchar(22) DEFAULT NULL,
  `other_details` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE status_code (
  `code_id` int(11) DEFAULT NULL,
  `code_description` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
