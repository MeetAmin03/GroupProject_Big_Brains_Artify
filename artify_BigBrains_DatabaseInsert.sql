-- Inserting data into `customers` table
INSERT INTO `art_gallery`.`customers` (`name`, `email`) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Michael Johnson', 'michael.johnson@example.com'),
('Emily Brown', 'emily.brown@example.com'),
('David Lee', 'david.lee@example.com'),
('Sarah Wilson', 'sarah.wilson@example.com'),
('James Taylor', 'james.taylor@example.com'),
('Emma Martinez', 'emma.martinez@example.com'),
('Daniel Anderson', 'daniel.anderson@example.com'),
('Olivia Garcia', 'olivia.garcia@example.com');

-- Inserting data into `address` table
INSERT INTO `art_gallery`.`address` (`customer_id`, `street`, `city`, `state`, `zipcode`) VALUES
(1, '123 Main St', 'New York', 'NY', '10001'),
(2, '456 Elm St', 'Los Angeles', 'CA', '90001'),
(3, '789 Oak St', 'Chicago', 'IL', '60601'),
(4, '101 Pine St', 'Houston', 'TX', '77001'),
(5, '234 Maple St', 'Phoenix', 'AZ', '85001'),
(6, '567 Cedar St', 'Philadelphia', 'PA', '19101'),
(7, '890 Walnut St', 'San Antonio', 'TX', '78201'),
(8, '111 Birch St', 'San Diego', 'CA', '92101'),
(9, '222 Cherry St', 'Dallas', 'TX', '75201'),
(10, '333 Spruce St', 'San Jose', 'CA', '95101');

-- Inserting data into `artists` table
INSERT INTO `art_gallery`.`artists` (`name`, `nationality`, `style`) VALUES
('Pablo Picasso', 'Spanish', 'Cubism'),
('Vincent van Gogh', 'Dutch', 'Post-Impressionism'),
('Leonardo da Vinci', 'Italian', 'Renaissance'),
('Michelangelo', 'Italian', 'High Renaissance'),
('Claude Monet', 'French', 'Impressionism'),
('Georgia O\'Keeffe', 'American', 'Modernism'),
('Salvador Dalí', 'Spanish', 'Surrealism'),
('Frida Kahlo', 'Mexican', 'Surrealism'),
('Rembrandt', 'Dutch', 'Baroque'),
('Andy Warhol', 'American', 'Pop Art');

-- Inserting data into `art_pieces` table
INSERT INTO `art_gallery`.`art_pieces` (`title`, `medium`, `year_created`, `price`, `artist_id`) VALUES
('Guernica', 'Oil on canvas', '1937', 1000000, 1),
('Starry Night', 'Oil on canvas', '1889', 1500000, 2),
('Mona Lisa', 'Oil on poplar panel', '1503', 2000000, 3),
('David', 'Marble sculpture', '1504', 2500000, 4),
('Water Lilies', 'Oil on canvas', '1916', 1200000, 5),
('Jimson Weed/White Flower No. 1', 'Oil on canvas', '1932', 800000, 6),
('The Persistence of Memory', 'Oil on canvas', '1931', 900000, 7),
('The Two Fridas', 'Oil on canvas', '1939', 700000, 8),
('The Night Watch', 'Oil on canvas', '1642', 3000000, 9),
('Campbell\'s Soup Cans', 'Acrylic on canvas', '1962', 1800000, 10);

-- Inserting data into `customer_art_pieces` table
INSERT INTO `art_gallery`.`customer_art_pieces` (`customer_id`, `art_piece_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting data into `sales_status` table
INSERT INTO `art_gallery`.`sales_status` (`status_name`) VALUES
('Pending'),
('Complete'),
('Cancelled');

-- Inserting data into `sales` table
INSERT INTO `art_gallery`.`sales` (`customer_id`, `art_piece_id`, `sale_date`, `price`, `status_id`) VALUES
(1, 1, '2024-04-01', 1000000, 4),
(2, 2, '2024-04-02', 1500000, 4),
(3, 3, '2024-04-03', 2000000, 5),
(4, 4, '2024-04-04', 2500000, 6),
(5, 5, '2024-04-05', 1200000, 4),
(6, 6, '2024-04-06', 800000, 4),
(7, 7, '2024-04-07', 900000, 4),
(8, 8, '2024-04-08', 700000, 5),
(9, 9, '2024-04-09', 3000000, 5),
(10, 10, '2024-04-10', 1800000, 6);

select * from sales;

-- Inserting data into `payment` table
INSERT INTO `art_gallery`.`payment` (`customer_id`, `amount`, `payment_date`, `sales_sale_id`) VALUES
(1, 1000000, '2024-04-11', 11),
(2, 1500000, '2024-04-12', 12),
(3, 2000000, '2024-04-13', 13),
(4, 2500000, '2024-04-14', 14),
(5, 1200000, '2024-04-15', 15),
(6, 800000, '2024-04-16', 16),
(7, 900000, '2024-04-17', 17),
(8, 700000, '2024-04-18', 18),
(9, 3000000, '2024-04-19', 19),
(10, 1800000, '2024-04-20', 11);


