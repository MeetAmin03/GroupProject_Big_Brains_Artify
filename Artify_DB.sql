-- Table structure for table `artists`
CREATE TABLE `artists` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `nationality` VARCHAR(255),
  `style` VARCHAR(255),
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `art_pieces`
CREATE TABLE `art_pieces` (
  `art_piece_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `medium` VARCHAR(255),
  `year_created` VARCHAR(255),
  `price` INT,
  `image` LONGBLOB,
  `artist_id` INT,
  PRIMARY KEY (`art_piece_id`),
  FOREIGN KEY (`artist_id`) REFERENCES `artists`(`artist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `customers`
CREATE TABLE `customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `messages`
CREATE TABLE `messages` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT,
  `name` VARCHAR(255),
  `email` VARCHAR(255),
  `phone_number` VARCHAR(12),
  `message` VARCHAR(500),
  PRIMARY KEY (`message_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `sales`
CREATE TABLE `sales` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT,
  `art_piece_id` INT,
  `sale_date` DATE,
  `price` INT,
  PRIMARY KEY (`sale_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE CASCADE,
  FOREIGN KEY (`art_piece_id`) REFERENCES `art_pieces`(`art_piece_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
