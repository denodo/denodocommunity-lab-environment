CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dates` (
  `id` int(11) NOT NULL,
  `fulldate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ordermethods` (
  `id` int(11) NOT NULL,
  `description` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `date` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `ordermethod` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `promotion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

