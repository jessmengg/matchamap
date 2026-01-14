// work I did in SQL
CREATE DATABASE matcha_cafes;
USE matcha_cafes;

-- Create the cafe table
CREATE TABLE cafe (
	cafe_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(500),
    miles_from_neu DECIMAL(4,2),
    neighborhood VARCHAR(255)
);

-- Create the hour table
CREATE TABLE hour (
	hour_id INT PRIMARY KEY AUTO_INCREMENT,
    cafe_id INT NOT NULL, 
    day_of_week VARCHAR(20) NOT NULL, 
    open_time TIME, 
    close_time TIME, 
    FOREIGN KEY (cafe_id) REFERENCES cafe(cafe_id)
);

-- Create the drink table
CREATE TABLE drink (
    drink_id INT PRIMARY KEY AUTO_INCREMENT,
    cafe_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    is_iced CHAR(1) NOT NULL,
    FOREIGN KEY (cafe_id) REFERENCES cafe(cafe_id)
);

-- Create the price table
CREATE TABLE price (
    price_id INT PRIMARY KEY AUTO_INCREMENT,
    drink_id INT NOT NULL,
    size_in_oz INT NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (drink_id) REFERENCES drink(drink_id)
);

-- Create the reviewer table
CREATE TABLE reviewer (
    reviewer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Create the review table
CREATE TABLE review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    drink_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    rating_out_of_five INT NOT NULL,
    date DATE NOT NULL,
    source_id INT NOT NULL,
    comment TEXT,
    FOREIGN KEY (drink_id) REFERENCES drink(drink_id),
    FOREIGN KEY (reviewer_id) REFERENCES reviewer(reviewer_id),
    FOREIGN KEY (source_id) REFERENCES source(source_id),
    CHECK (rating_out_of_five BETWEEN 1 AND 5)
);

-- Create the source table
CREATE TABLE source (
    source_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(500)
);
-- Insert date into cafe table
INSERT INTO cafe (cafe_id, name, address, miles_from_neu, neighborhood) VALUES
(1, 'Tatte Bakery & Cafe', '369 Huntington Ave, Boston, MA 02115', 0.1, 'Northeastern Campus'),
(2, 'Starbucks', '360 Huntington Ave, Boston, MA 02115', 0, 'Northeastern Campus'),
(3, 'Dunkin''', '360 Huntington Ave, Boston, MA 02115', 0, 'Northeastern Campus'),
(4, 'Saxbys', '815 Columbus Ave, Boston, MA 02120', 0.3, 'Northeastern Campus'),
(5, 'The Sipping Room by Breeze', '132 Jersey St, Boston, MA 02215', 0.6, 'Fenway'),
(6, 'Matcha Cafe Maiko', '115 Jersey St, Boston, MA 02215', 0.6, 'Fenway'),
(7, 'Phinista Cafe', '96 Peterborough St, Boston, MA 02215', 0.8, 'Fenway'),
(8, 'Flour Bakery + Cafe', '30 Dalton St, Boston, MA 02115', 0.6, 'Back Bay'),
(9, 'Gong Cha', '281 Huntington Ave, Boston, MA 02115', 0.2, 'Back Bay'),
(10, 'HEYTEA', '223 Newbury St, Boston, MA 02116', 1, 'Back Bay'),
(11, 'Blank Street', '647 Boylston St, Boston, MA 02116', 0.9, 'Back Bay'),
(12, 'Jaho Coffee Roaster & Wine Bar', '116 Huntington Ave, Boston, MA 02116', 0.7, 'Back Bay'),
(13, 'Green Haus Cafe', '1520 Tremont St, Boston, MA 02120', 0.9, 'Fenway'),
(14, 'Pavement Coffeehouse', '44 Gainsborough St, Boston, MA 02115', 0.3, 'Northeastern Campus'),
(15, 'Ten One Tea House', '1323 Boylston St, Boston, MA 02215', 0.8, 'Back Bay'),
(16, 'Kyo Matcha', '1010 Beacon St, Brookline, MA 02446', 1.4, 'Brookline');

-- Insert data into hour table
INSERT INTO hour (hour_id, cafe_id, day_of_week, open_time, close_time) VALUES
(1, 1, 'Monday', '07:00', '18:00'),
(2, 1, 'Tuesday', '07:00', '18:00'),
(3, 1, 'Wednesday', '07:00', '18:00'),
(4, 1, 'Thursday', '07:00', '18:00'),
(5, 1, 'Friday', '07:00', '18:00'),
(6, 1, 'Saturday', '07:00', '18:00'),
(7, 1, 'Sunday', '08:00', '18:00'),
(8, 2, 'Monday', '07:00', '21:00'),
(9, 2, 'Tuesday', '07:00', '21:00'),
(10, 2, 'Wednesday', '07:00', '21:00'),
(11, 2, 'Thursday', '07:00', '21:00'),
(12, 2, 'Friday', '07:00', '21:00'),
(13, 2, 'Saturday', '08:00', '19:00'),
(14, 2, 'Sunday', '10:00', '19:00'),
(15, 3, 'Monday', '06:30', '19:00'),
(16, 3, 'Tuesday', '06:30', '19:00'),
(17, 3, 'Wednesday', '06:30', '19:00'),
(18, 3, 'Thursday', '06:30', '19:00'),
(19, 3, 'Friday', '06:30', '17:00'),
(20, 3, 'Saturday', NULL, NULL),
(21, 3, 'Sunday', NULL, NULL),
(22, 4, 'Monday', '07:30', '18:00'),
(23, 4, 'Tuesday', '07:30', '18:00'),
(24, 4, 'Wednesday', '07:30', '18:00'),
(25, 4, 'Thursday', '07:30', '18:00'),
(26, 4, 'Friday', '07:30', '18:00'),
(27, 4, 'Saturday', '07:30', '18:00'),
(28, 4, 'Sunday', NULL, NULL),
(29, 5, 'Monday', '12:00', '18:00'),
(30, 5, 'Tuesday', '12:00', '18:00'),
(31, 5, 'Wednesday', '12:00', '18:00'),
(32, 5, 'Thursday', '12:00', '18:00'),
(33, 5, 'Friday', '12:00', '18:00'),
(34, 5, 'Saturday', '12:00', '18:00'),
(35, 5, 'Sunday', '12:00', '18:00'),
(36, 6, 'Monday', '13:00', '21:00'),
(37, 6, 'Tuesday', '13:00', '21:00'),
(38, 6, 'Wednesday', '13:00', '21:00'),
(39, 6, 'Thursday', '13:00', '21:00'),
(40, 6, 'Friday', '13:00', '21:00'),
(41, 6, 'Saturday', '12:00', '22:00'),
(42, 6, 'Sunday', '12:00', '21:00'),
(43, 7, 'Monday', '08:00', '17:00'),
(44, 7, 'Tuesday', '08:00', '17:00'),
(45, 7, 'Wednesday', '08:00', '15:00'),
(46, 7, 'Thursday', '08:00', '15:00'),
(47, 7, 'Friday', '08:00', '15:00'),
(48, 7, 'Saturday', '08:30', '20:00'),
(49, 7, 'Sunday', '08:30', '20:00'),
(50, 8, 'Monday', '07:00', '19:00'),
(51, 8, 'Tuesday', '07:00', '19:00'),
(52, 8, 'Wednesday', '07:00', '19:00'),
(53, 8, 'Thursday', '07:00', '19:00'),
(54, 8, 'Friday', '07:00', '19:00'),
(55, 8, 'Saturday', '08:00', '18:00'),
(56, 8, 'Sunday', '08:00', '18:00'),
(57, 9, 'Monday', '11:00', '22:00'),
(58, 9, 'Tuesday', '11:00', '22:00'),
(59, 9, 'Wednesday', '11:00', '22:00'),
(60, 9, 'Thursday', '11:00', '22:00'),
(61, 9, 'Friday', '11:00', '22:00'),
(62, 9, 'Saturday', '11:00', '22:00'),
(63, 9, 'Sunday', '11:00', '22:00'),
(64, 10, 'Monday', '11:00', '21:00'),
(65, 10, 'Tuesday', '11:00', '21:00'),
(66, 10, 'Wednesday', '11:00', '21:00'),
(67, 10, 'Thursday', '11:00', '21:00'),
(68, 10, 'Friday', '11:00', '21:30'),
(69, 10, 'Saturday', '11:00', '21:30'),
(70, 10, 'Sunday', '11:00', '21:00'),
(71, 11, 'Monday', '06:30', '20:00'),
(72, 11, 'Tuesday', '06:30', '20:00'),
(73, 11, 'Wednesday', '06:30', '20:00'),
(74, 11, 'Thursday', '06:30', '20:00'),
(75, 11, 'Friday', '06:30', '20:00'),
(76, 11, 'Saturday', '06:30', '20:00'),
(77, 11, 'Sunday', '07:00', '20:00'),
(78, 12, 'Monday', '06:30', '23:00'),
(79, 12, 'Tuesday', '06:30', '23:00'),
(80, 12, 'Wednesday', '06:30', '23:00'),
(81, 12, 'Thursday', '06:30', '23:00'),
(82, 12, 'Friday', '06:30', '23:00'),
(83, 12, 'Saturday', '07:00', '23:00'),
(84, 12, 'Sunday', '07:00', '23:00'),
(85, 13, 'Monday', '07:30', '17:00'),
(86, 13, 'Tuesday', '07:30', '17:00'),
(87, 13, 'Wednesday', '07:30', '17:00'),
(88, 13, 'Thursday', '07:30', '17:00'),
(89, 13, 'Friday', '07:30', '17:00'),
(90, 13, 'Saturday', '08:00', '17:00'),
(91, 13, 'Sunday', '08:00', '17:00'),
(92, 14, 'Monday', '07:00', '18:00'),
(93, 14, 'Tuesday', '07:00', '18:00'),
(94, 14, 'Wednesday', '07:00', '18:00'),
(95, 14, 'Thursday', '07:00', '18:00'),
(96, 14, 'Friday', '07:00', '18:00'),
(97, 14, 'Saturday', '07:00', '18:00'),
(98, 14, 'Sunday', '07:00', '18:00'),
(99, 15, 'Monday', '12:00', '21:00'),
(100, 15, 'Tuesday', '12:00', '21:00'),
(101, 15, 'Wednesday', '12:00', '21:00'),
(102, 15, 'Thursday', '12:00', '21:00'),
(103, 15, 'Friday', '12:00', '22:00'),
(104, 15, 'Saturday', '12:00', '22:00'),
(105, 15, 'Sunday', '12:00', '21:00'),
(106, 16, 'Monday', '11:30', '22:00'),
(107, 16, 'Tuesday', '11:30', '20:00'),
(108, 16, 'Wednesday', '11:30', '22:00'),
(109, 16, 'Thursday', '11:30', '22:00'),
(110, 16, 'Friday', '11:30', '22:00'),
(111, 16, 'Saturday', '11:30', '22:00'),
(112, 16, 'Sunday', '11:30', '22:00');

-- Insert data into drink table
INSERT INTO drink (drink_id, cafe_id, name, is_iced) VALUES
(1, 1, 'Hot Matcha Latte', 'N'),
(2, 1, 'Iced Matcha Latte', 'Y'),
(3, 1, 'Iced Sparkling Matcha Lemonade', 'Y'),
(4, 2, 'Hot Protein Matcha', 'N'),
(5, 2, 'Hot Sugar-Free Vanilla Protein Matcha', 'N'),
(6, 2, 'Hot Matcha Latte', 'N'),
(7, 2, 'Iced Protein Matcha', 'Y'),
(8, 2, 'Iced Sugar-Free Vanilla Protein Matcha', 'Y'),
(9, 2, 'Iced Banana Cream Protein Matcha', 'Y'),
(10, 2, 'Iced Matcha Latte', 'Y'),
(11, 2, 'Iced Matcha Creme Frappuccino', 'Y'),
(12, 3, 'Iced Matcha Latte', 'Y'),
(13, 3, 'Iced Wicked Green Matcha', 'Y'),
(14, 3, 'Hot Matcha Latte', 'N'),
(15, 3, 'Frozen Matcha Latte', 'Y'),
(16, 4, 'Hot Matcha Latte', 'N'),
(17, 4, 'Iced Matcha Latte', 'Y'),
(18, 4, 'Iced Strawberry Matcha Latte', 'Y'),
(19, 4, 'Iced Vanilla Bean Matcha', 'Y'),
(20, 4, 'Iced Pumpkin Matcha Latte', 'Y'),
(21, 4, 'Iced Ube Matcha Latte', 'Y'),
(22, 4, 'Iced Dark Chocolate Peppermint Mocha Matcha', 'Y'),
(23, 5, 'Iced Matcha Latte', 'Y'),
(24, 6, 'Iced Strawberry Matcha', 'Y'),
(25, 6, 'Iced Sakura Matcha', 'Y'),
(26, 6, 'Iced Matcha Cheese', 'Y'),
(27, 6, 'Iced Black Sugar Matcha', 'Y'),
(28, 6, 'Iced Red Bean Matcha', 'Y'),
(29, 6, 'Iced Matcha Oreo Frappe', 'Y'),
(30, 6, 'Iced Matcha Yuzu', 'Y'),
(31, 6, 'Iced Matcha Peach', 'Y'),
(32, 6, 'Iced Matcha Latte', 'Y'),
(33, 6, 'Iced Matcha Cream', 'Y'),
(34, 6, 'Iced Matcha Kuromitsu Kinoko', 'Y'),
(35, 6, 'Iced Matcha Kuromitsu Kinoko Cream', 'Y'),
(36, 6, 'Iced Matcha Chocolate', 'Y'),
(37, 6, 'Iced Matcha Chocolate Cream', 'Y'),
(38, 6, 'Iced Matcha', 'Y'),
(39, 6, 'Iced Matcha Lemon', 'Y'),
(40, 6, 'Iced Matcha Frappe', 'Y'),
(41, 7, 'Iced Ube Matcha Latte', 'Y'),
(42, 7, 'Iced Strawberry Matcha Latte', 'Y'),
(43, 7, 'Iced Pandan Matcha Latte', 'Y'),
(44, 7, 'Iced Banana Bread Pudding Matcha Latte', 'Y'),
(45, 8, 'Hot Matcha Latte', 'N'),
(46, 8, 'Iced Honeycomb Matcha Latte', 'Y'),
(47, 8, 'Iced Matcha Latte', 'Y'),
(48, 9, 'Iced Matcha Latte', 'Y'),
(49, 9, 'Iced Strawberry Matcha Latte', 'Y'),
(50, 10, 'Iced Matcha Cloud Coconut Aqua', 'Y'),
(51, 10, 'Iced Wicked Matcha', 'Y'),
(52, 10, 'Iced Triple Supreme Matcha Latte', 'Y'),
(53, 10, 'Iced Matcha Cloud Coconut Blue', 'Y'),
(54, 10, 'Hot Triple Supreme Matcha Latte', 'N'),
(55, 10, 'Hot Supreme Matcha Latte', 'N'),
(56, 10, 'Hot Cloud Matcha Latte', 'N'),
(57, 10, 'Iced Cloud Matcha Latte', 'Y'),
(58, 10, 'Iced Oat Matcha Boba', 'Y'),
(59, 10, 'Iced Supreme Matcha Latte', 'Y'),
(60, 10, 'Iced Pure Matcha', 'Y'),
(61, 11, 'Iced Carrot Cake Matcha', 'Y'),
(62, 11, 'Iced Banana Bread Matcha', 'Y'),
(63, 11, 'Hot Banana Bread Matcha', 'N'),
(64, 11, 'Iced Salted Pistachio Matcha', 'Y'),
(65, 11, 'Iced Strawberry Shortcake Matcha', 'Y'),
(66, 11, 'Hot Strawberry Shortcake Matcha', 'N'),
(67, 11, 'Iced Daydream Matcha', 'Y'),
(68, 11, 'Hot Daydream Matcha', 'N'),
(69, 11, 'Iced Blueberry Matcha', 'Y'),
(70, 11, 'Hot Blueberry Matcha', 'N'),
(71, 11, 'Iced Matcha Latte', 'Y'),
(72, 11, 'Hot Matcha Latte', 'N'),
(73, 12, 'Hot Black Sugar Matcha Latte', 'N'),
(74, 12, 'Hot Blossom Matcha Latte', 'N'),
(75, 12, 'Hot Matcha Latte', 'N'),
(76, 12, 'Hot Strawberry Matcha Latte', 'N'),
(77, 12, 'Iced Strawberry Matcha Latte', 'Y'),
(78, 12, 'Iced Black Sugar Matcha Latte', 'Y'),
(79, 12, 'Iced Matcha Latte', 'Y'),
(80, 13, 'Hot Matcha Latte', 'N'),
(81, 13, 'Iced Matcha Latte', 'Y'),
(82, 13, 'Iced Strawberry Matcha Latte', 'Y'),
(83, 14, 'Hot Matcha Latte', 'N'),
(84, 14, 'Iced Matcha Latte', 'Y'),
(85, 15, 'Iced Matcha Latte', 'Y'),
(86, 15, 'Hot Matcha Latte', 'N'),
(87, 16, 'Iced Matcha Latte', 'Y'),
(88, 16, 'Iced Lavender Matcha Latte', 'Y'),
(89, 16, 'Iced Brown Sugar Boba Matcha Latte', 'Y'),
(90, 16, 'Iced White Peach Matcha Latte', 'Y'),
(91, 16, 'Iced Banana Matcha Latte', 'Y'),
(92, 16, 'Iced Jasmine Matcha Latte', 'Y'),
(93, 16, 'Iced Black Sesame Latte', 'Y'),
(94, 16, 'Iced Mango Matcha Latte', 'Y'),
(95, 16, 'Iced Matcha Mocha', 'Y'),
(96, 16, 'Iced Soymilk Matcha Latte', 'Y'),
(97, 16, 'Iced Strawberry Matcha Latte', 'Y'),
(98, 16, 'Iced Red Bean Matcha Latte', 'Y'),
(99, 16, 'Iced Matcha', 'Y'),
(100, 16, 'Iced Jasmine Matcha Cream', 'Y'),
(101, 16, 'Iced Matcha Lemonade', 'Y'),
(102, 16, 'Iced Brulee Cream Matcha Slush', 'Y'),
(103, 16, 'Iced Red Bean Matcha Slush', 'Y');

-- Insert data into price table
INSERT INTO price (price_id, drink_id, size_in_oz, price) VALUES
(1, 1, 16, 5.50), (2, 1, 12, 4.50), (3, 1, 20, 6.50),
(4, 2, 16, 5.50), (5, 2, 20, 6.75),
(6, 3, 16, 5.85), (7, 3, 12, 4.85),
(8, 4, 16, 6.25), (9, 4, 20, 7.25),
(10, 5, 16, 6.45), (11, 5, 12, 5.45),
(12, 6, 16, 5.25), (13, 6, 12, 4.25), (14, 6, 20, 6.40),
(15, 7, 16, 6.45), (16, 7, 20, 7.45),
(17, 8, 16, 6.75), (18, 8, 12, 5.75),
(19, 9, 16, 6.95), (20, 9, 20, 8.10),
(21, 10, 16, 5.45), (22, 10, 12, 4.45), (23, 10, 20, 6.50),
(24, 11, 16, 5.65), (25, 11, 12, 4.65),
(26, 12, 16, 4.39), (27, 12, 20, 5.39),
(28, 13, 16, 4.99), (29, 13, 12, 3.99),
(30, 14, 16, 4.39), (31, 14, 20, 5.39),
(32, 15, 16, 4.79),
(33, 16, 16, 5.65), (34, 16, 12, 4.65),
(35, 17, 16, 5.65), (36, 17, 20, 6.65),
(37, 18, 16, 6.65), (38, 18, 12, 5.65),
(39, 19, 16, 6.65), (40, 19, 20, 7.65),
(41, 20, 16, 6.65), (42, 20, 12, 5.65),
(43, 21, 16, 6.65),
(44, 22, 16, 6.25), (45, 22, 12, 5.25),
(46, 23, 16, 6.00), (47, 23, 20, 7.10),
(48, 24, 16, 8.15), (49, 24, 12, 7.15),
(50, 25, 16, 8.05), (51, 25, 20, 9.05),
(52, 26, 16, 8.05),
(53, 27, 16, 8.00), (54, 27, 12, 7.00),
(55, 28, 16, 8.05), (56, 28, 20, 9.05),
(57, 29, 16, 8.85), (58, 29, 12, 7.85),
(59, 30, 16, 7.85), (60, 30, 20, 8.85),
(61, 31, 16, 7.85),
(62, 32, 16, 7.55), (63, 32, 12, 6.55),
(64, 33, 16, 8.05),
(65, 34, 16, 8.15), (66, 34, 20, 9.15),
(67, 35, 16, 8.65), (68, 35, 12, 7.65),
(69, 36, 16, 7.90), (70, 36, 20, 8.90),
(71, 37, 16, 8.40),
(72, 38, 16, 6.55), (73, 38, 12, 5.55),
(74, 39, 16, 6.85), (75, 39, 20, 7.85),
(76, 40, 16, 8.35), (77, 40, 12, 7.35),
(78, 41, 16, 8.43),
(79, 42, 16, 7.81), (80, 42, 12, 6.81),
(81, 43, 16, 8.43), (82, 43, 20, 9.43),
(83, 44, 16, 8.43), (84, 44, 12, 7.43),
(85, 45, 16, 5.00),
(86, 46, 16, 5.40), (87, 46, 20, 6.40),
(88, 47, 16, 5.00),
(89, 48, 16, 6.50), (90, 48, 12, 5.50),
(91, 49, 16, 7.30),
(92, 50, 16, 7.99), (93, 50, 12, 6.99),
(94, 51, 16, 7.99),
(95, 52, 16, 7.99), (96, 52, 20, 8.99),
(97, 53, 16, 7.99),
(98, 54, 16, 7.99),
(99, 55, 16, 7.99),
(100, 56, 16, 7.99),
(101, 57, 16, 7.99), (102, 57, 12, 6.99),
(103, 58, 16, 7.99),
(104, 59, 16, 7.99),
(105, 60, 16, 7.99),
(106, 61, 16, 6.25), (107, 61, 12, 5.25),
(108, 62, 16, 5.95),
(109, 63, 16, 5.45), (110, 63, 12, 4.45),
(111, 64, 16, 6.25),
(112, 65, 16, 5.95), (113, 65, 12, 4.95),
(114, 66, 16, 5.45),
(115, 67, 16, 5.95),
(116, 68, 16, 5.45),
(117, 69, 16, 5.95),
(118, 70, 16, 5.45),
(119, 71, 16, 5.15),
(120, 72, 16, 4.65),
(121, 73, 16, 6.50),
(122, 74, 16, 6.50),
(123, 75, 16, 6.50),
(124, 76, 16, 6.50),
(125, 77, 16, 6.50),
(126, 78, 16, 6.50),
(127, 79, 16, 6.50),
(128, 80, 16, 6.60),
(129, 81, 16, 6.60),
(130, 82, 16, 7.20),
(131, 83, 16, 7.00),
(132, 84, 16, 6.50),
(133, 85, 16, 6.70),
(134, 86, 16, 7.50),
(135, 87, 16, 8.75),
(136, 88, 16, 8.75),
(137, 89, 16, 9.00),
(138, 90, 16, 8.75),
(139, 91, 16, 8.75),
(140, 92, 16, 8.75),
(141, 93, 16, 8.25),
(142, 94, 16, 8.75),
(143, 95, 16, 8.75),
(144, 96, 16, 8.75),
(145, 97, 16, 8.75),
(146, 98, 16, 8.75),
(147, 99, 16, 7.50),
(148, 100, 16, 7.50),
(149, 101, 16, 7.50),
(150, 102, 16, 8.75),
(151, 103, 16, 8.75);

-- Insert data into reviewer table
INSERT INTO reviewer (reviewer_id, name) VALUES
(1, 'Jessica Meng'),
(2, 'Jason Wu'),
(3, 'Sarah Mitchell'),
(4, 'Daniel Rivera'),
(5, 'Chloe Kim'),
(6, 'Anthony Lopez'),
(7, 'Megan Carter'),
(8, 'Brandon Nguyen'),
(9, 'Lily Thompson'),
(10, 'Kevin Patel'),
(11, 'Olivia Brooks'),
(12, 'Marcus Chen'),
(13, 'Hannah Lewis'),
(14, 'Samuel Ortiz'),
(15, 'Rachel Kim'),
(16, 'Derek Simmons'),
(17, 'Julia Park'),
(18, 'Michael Reyes'),
(19, 'Vivian Zhang'),
(20, 'Tyler Morgan'),
(21, 'Eric Daniels'),
(22, 'Sophia Lin'),
(23, 'Andrew Walker'),
(24, 'Grace Holloway'),
(25, 'Justin Kim'),
(26, 'Natalie Evans'),
(27, 'Christopher Hale'),
(28, 'Jasmine Patel'),
(29, 'Benjamin Ross'),
(30, 'Ella Carter'),
(31, 'Logan Perez'),
(32, 'Mia Sanchez'),
(33, 'Caroline Yu'),
(34, 'Marco Silva'),
(35, 'Tessa Raymond'),
(36, 'Henry Collins'),
(37, 'Naomi Bennett'),
(38, 'Aiden Brooks'),
(39, 'Aria Lopez'),
(40, 'Vincent Choi'),
(41, 'Zoe Harper'),
(42, 'Patrick Lee'),
(43, 'Caitlin Moore'),
(44, 'Ryan Gallagher'),
(45, 'Daniela Cruz'),
(46, 'Owen Bradley'),
(47, 'Michelle Tan'),
(48, 'Jonathan Flores'),
(49, 'Erika Sun'),
(50, 'Trevor Young'),
(51, 'Lauren Beck'),
(52, 'Dylan Roberts'),
(53, 'Isabel Torres'),
(54, 'Patrick Kim'),
(55, 'Ashley Monroe'),
(56, 'Adrian Vega'),
(57, 'Maddie Lane'),
(58, 'Damien Wells'),
(59, 'Brianna Park'),
(60, 'Ethan Miller'),
(61, 'Kayla Johnson'),
(62, 'William Shaffer'),
(63, 'Nicole Garcia'),
(64, 'Zachary Hughes'),
(65, 'Jordan Alvarez'),
(66, 'Claire Foster'),
(67, 'Jayden Brooks'),
(68, 'Emma Riley'),
(69, 'Hassan Ali'),
(70, 'Brooke Maxwell'),
(71, 'Evan Turner'),
(72, 'Serena Campos'),
(73, 'Paul Nguyen'),
(74, 'April Richardson'),
(75, 'Seth Warner'),
(76, 'Michelle Ortiz'),
(77, 'Gavin Hudson'),
(78, 'Alyssa Ray'),
(79, 'Leo Chang'),
(80, 'Kira Donovan'),
(81, 'Nathan Foster'),
(82, 'Angelique Perez'),
(83, 'Miles Thompson'),
(84, 'Adriana Reyes'),
(85, 'Colin Barrett'),
(86, 'Sandra Lin'),
(87, 'Felix Ortiz'),
(88, 'Megan Yang'),
(89, 'Troy Harrison'),
(90, 'Nora Blake'),
(91, 'Ashton Lowe'),
(92, 'Danielle Suarez'),
(93, 'Connor Casey'),
(94, 'Piper Monroe'),
(95, 'Ian Shepherd'),
(96, 'Lila Stewart'),
(97, 'Terrence Browne'),
(98, 'Jenna Cross'),
(99, 'Eric Han'),
(100, 'Eliana Vega');

-- Insert data into review table
INSERT INTO review (review_id, drink_id, reviewer_id, rating_out_of_five, date, source_id, comment) VALUES
(1, 10, 1, 3, '2025-05-06', 4, 'honestly pretty good'),
(2, 12, 1, 2, '2025-05-09', 4, 'so watered down its scary'),
(3, 23, 1, 5, '2025-10-27', 4, 'tastes really good and cheaper than local competition like Matcha Cafe Maiko and Phinista'),
(4, 25, 1, 2, '2025-09-04', 4, 'not flavorful at all, quite expensive as well'),
(5, 41, 1, 3, '2025-09-10', 4, 'not terrible but i don''t like the chunks'),
(6, 42, 1, 3, '2025-09-17', 4, 'i don''t like the strawberry chunks inside'),
(7, 44, 1, 5, '2025-09-22', 4, 'very flavorful and better than competitors like Blank Street and Matcha Cafe Maiko'),
(8, 53, 1, 4, '2025-07-05', 4, 'looks nice and tastes good'),
(9, 58, 1, 4, '2024-11-26', 4, 'tastes good and very creamy'),
(10, 61, 1, 3, '2025-09-12', 4, 'interesting flavor, not my favorite'),
(11, 62, 1, 4, '2025-09-12', 4, 'yummy but not that strong'),
(12, 65, 1, 4, '2025-05-02', 4, 'pretty good, can definitely taste strawberry and matcha'),
(13, 67, 1, 4, '2025-03-24', 4, 'a nice flavor, not too strong though'),
(14, 69, 1, 4, '2025-06-12', 4, 'a classic, best of blank street'),
(15, 71, 1, 2, '2025-03-19', 4, 'not sweet, not that strong either'),
(16, 90, 1, 5, '2025-10-16', 4, 'very flavorful and unique'),
(17, 97, 61, 2, '2025-04-12', 1, 'Had some chunks which was unpleasant.'),
(18, 91, 63, 5, '2024-09-20', 1, 'Could taste the quality of the tea leaves.'),
(19, 53, 20, 5, '2025-10-06', 2, 'Perfect temperature and not overly sweet.'),
(20, 6, 21, 4, '2021-05-23', 1, 'Not as strong as expected for the price.'),
(21, 100, 44, 4, '2023-12-31', 2, 'Nice spot to study while sipping this.'),
(22, 87, 45, 3, '2022-08-09', 3, 'Average—nothing stood out, service was fine.'),
(23, 19, 7, 4, '2022-05-06', 1, 'Nice balance of matcha and milk, would get again.'),
(24, 2, 98, 5, '2025-03-24', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(25, 33, 86, 5, '2023-08-07', 1, 'Excellent balance of sweetness and matcha depth.'),
(26, 3, 43, 4, '2024-03-05', 2, 'Perfect temperature and not overly sweet.'),
(27, 55, 19, 3, '2024-10-01', 1, 'Too much ice, diluted the drink.'),
(28, 29, 64, 2, '2021-11-23', 2, 'Too sweet for my taste, could use less syrup.'),
(29, 14, 26, 4, '2024-01-14', 1, 'Nice balance of matcha and milk, would get again.'),
(30, 39, 97, 4, '2022-11-17', 1, 'Good value compared to nearby cafes.'),
(31, 50, 24, 3, '2024-04-22', 2, 'Froth was flat, lacked creaminess.'),
(32, 40, 78, 4, '2023-11-26', 1, 'Decent drink but the portion felt small.'),
(33, 92, 91, 4, '2024-05-29', 1, 'Could taste the quality of the tea leaves.'),
(34, 73, 18, 3, '2023-07-08', 1, 'Not enough matcha, mostly tasted like milk.'),
(35, 11, 99, 3, '2022-02-04', 2, 'Too much ice, diluted the drink.'),
(36, 28, 68, 4, '2024-07-16', 1, 'Nice spot to study while sipping this.'),
(37, 76, 57, 4, '2025-03-07', 1, 'Perfect temperature and not overly sweet.'),
(38, 9, 84, 4, '2025-09-30', 2, 'Excellent balance of sweetness and matcha depth.'),
(39, 1, 74, 3, '2022-04-30', 1, 'Way too watery, felt like they skimped on matcha.'),
(40, 54, 95, 4, '2024-12-26', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(41, 35, 56, 4, '2024-12-28', 1, 'Great presentation and Instagram-worthy.'),
(42, 47, 75, 4, '2021-02-04', 1, 'Decent drink but the portion felt small.'),
(43, 17, 80, 5, '2025-05-24', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(44, 85, 48, 4, '2023-10-04', 2, 'Good value compared to nearby cafes.'),
(45, 30, 37, 3, '2021-04-23', 1, 'Too sweet for my taste, could use less syrup.'),
(46, 66, 93, 5, '2023-06-26', 1, 'Excellent balance of sweetness and matcha depth.'),
(47, 70, 22, 3, '2022-06-29', 2, 'Froth was flat, lacked creaminess.'),
(48, 72, 73, 4, '2022-10-22', 1, 'Nice balance of matcha and milk, would get again.'),
(49, 36, 77, 4, '2024-09-07', 3, 'Great presentation and Instagram-worthy.'),
(50, 34, 50, 3, '2023-03-17', 1, 'Not as strong as expected for the price.'),
(51, 21, 52, 4, '2024-08-11', 1, 'Nice spot to study while sipping this.'),
(52, 48, 53, 4, '2021-09-10', 2, 'Too much ice, diluted the drink.'),
(53, 101, 92, 4, '2025-02-02', 1, 'Perfect temperature and not overly sweet.'),
(54, 41, 81, 4, '2025-05-30', 2, 'Great presentation and Instagram-worthy.'),
(55, 8, 40, 4, '2025-06-11', 3, 'Decent drink but the portion felt small.'),
(56, 18, 46, 2, '2021-11-14', 2, 'Too sweet for my taste, could use less syrup.'),
(57, 26, 58, 5, '2021-06-03', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(58, 86, 85, 4, '2023-02-17', 1, 'Could taste the quality of the tea leaves.'),
(59, 60, 35, 3, '2024-07-29', 2, 'Not as strong as expected for the price.'),
(60, 93, 41, 5, '2023-05-20', 1, 'Excellent balance of sweetness and matcha depth.'),
(61, 43, 90, 4, '2021-08-13', 1, 'Nice spot to study while sipping this.'),
(62, 71, 79, 3, '2024-06-18', 2, 'Froth was flat, lacked creaminess.'),
(63, 12, 27, 5, '2025-09-25', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(64, 24, 34, 4, '2022-03-09', 1, 'Nice balance of matcha and milk, would get again.'),
(65, 98, 12, 2, '2024-02-11', 2, 'Had some chunks which was unpleasant.'),
(66, 99, 17, 3, '2021-12-05', 1, 'Decent drink but the portion felt small.'),
(67, 102, 23, 4, '2023-04-28', 2, 'Great presentation and Instagram-worthy.'),
(68, 49, 55, 4, '2024-10-06', 1, 'Good value compared to nearby cafes.'),
(69, 42, 30, 3, '2025-08-01', 1, 'Too sweet for my taste, could use less syrup.'),
(70, 77, 25, 4, '2022-01-11', 2, 'Nice balance of matcha and milk, would get again.'),
(71, 5, 49, 3, '2024-11-05', 1, 'Not enough matcha, mostly tasted like milk.'),
(72, 74, 96, 4, '2022-07-02', 1, 'Could taste the quality of the tea leaves.'),
(73, 16, 66, 5, '2025-10-15', 1, 'Excellent balance of sweetness and matcha depth.'),
(74, 45, 32, 4, '2023-01-20', 2, 'Nice spot to study while sipping this.'),
(75, 67, 29, 3, '2022-02-25', 1, 'Too much ice, diluted the drink.'),
(76, 20, 76, 4, '2025-04-01', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(77, 80, 33, 4, '2023-03-14', 2, 'Good value compared to nearby cafes.'),
(78, 69, 71, 4, '2024-05-26', 1, 'Perfect temperature and not overly sweet.'),
(79, 57, 70, 3, '2024-09-02', 2, 'Froth was flat, lacked creaminess.'),
(80, 75, 47, 3, '2022-05-18', 1, 'Too sweet for my taste, could use less syrup.'),
(81, 81, 36, 4, '2023-07-05', 1, 'Nice balance of matcha and milk, would get again.'),
(82, 62, 82, 4, '2021-10-02', 2, 'Great presentation and Instagram-worthy.'),
(83, 68, 54, 5, '2023-11-20', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(84, 96, 10, 4, '2024-03-01', 1, 'Nice spot to study while sipping this.'),
(85, 94, 3, 4, '2025-01-07', 2, 'Good value compared to nearby cafes.'),
(86, 79, 59, 3, '2023-02-09', 1, 'Not enough matcha, mostly tasted like milk.'),
(87, 89, 65, 4, '2021-07-16', 1, 'Perfect temperature and not overly sweet.'),
(88, 78, 11, 2, '2021-06-17', 2, 'Too much ice, diluted the drink.'),
(89, 64, 83, 4, '2024-08-21', 1, 'Decent drink but the portion felt small.'),
(90, 52, 14, 4, '2025-05-18', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(91, 84, 6, 4, '2023-12-12', 2, 'Nice balance of matcha and milk, would get again.'),
(92, 22, 4, 3, '2021-09-03', 1, 'Way too watery, felt like they skimped on matcha.'),
(93, 7, 2, 4, '2025-02-25', 2, 'Good value compared to nearby cafes.'),
(94, 63, 9, 4, '2022-10-13', 1, 'Nice spot to study while sipping this.'),
(95, 103, 27, 3, '2024-06-03', 2, 'Too sweet for my taste, could use less syrup.'),
(96, 46, 38, 4, '2025-08-09', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(97, 59, 1, 4, '2023-04-09', 2, 'Nice presentation and a decent flavor.'),
(98, 38, 8, 3, '2022-08-31', 1, 'Average—nothing stood out, service was fine.'),
(99, 66, 15, 5, '2024-01-08', 2, 'Excellent balance of sweetness and matcha depth.'),
(100, 90, 13, 4, '2021-05-12', 1, 'Nice spot to study while sipping this.'),
(101, 103, 28, 3, '2023-09-11', 2, 'Too much ice, diluted the drink.'),
(102, 32, 12, 4, '2022-03-21', 1, 'Good value compared to nearby cafes.'),
(103, 51, 5, 5, '2025-06-20', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(104, 10, 16, 3, '2024-02-27', 2, 'Not enough matcha, mostly tasted like milk.'),
(105, 71, 31, 4, '2023-01-16', 1, 'Nice spot to study while sipping this.'),
(106, 26, 60, 4, '2022-11-06', 1, 'Decent drink but the portion felt small.'),
(107, 97, 35, 4, '2024-09-13', 2, 'Nice balance of matcha and milk, would get again.'),
(108, 24, 72, 4, '2022-04-07', 3, 'Perfect temperature and not overly sweet.'),
(109, 2, 67, 4, '2021-08-29', 2, 'Good value compared to nearby cafes.'),
(110, 67, 43, 3, '2023-05-04', 1, 'Too sweet for my taste, could use less syrup.'),
(111, 49, 46, 5, '2025-02-09', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(112, 21, 77, 4, '2024-11-16', 2, 'Great presentation and Instagram-worthy.'),
(113, 35, 39, 3, '2021-03-19', 1, 'Way too watery, felt like they skimped on matcha.'),
(114, 99, 74, 4, '2024-08-30', 1, 'Nice balance of matcha and milk, would get again.'),
(115, 58, 80, 3, '2022-01-30', 2, 'Froth was flat, lacked creaminess.'),
(116, 45, 73, 5, '2023-03-03', 1, 'Excellent balance of sweetness and matcha depth.'),
(117, 100, 90, 4, '2025-07-14', 2, 'Good value compared to nearby cafes.'),
(118, 14, 44, 3, '2022-12-06', 1, 'Not as strong as expected for the price.'),
(119, 48, 89, 4, '2023-04-10', 2, 'Nice spot to study while sipping this.'),
(120, 92, 21, 4, '2024-05-05', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(121, 17, 34, 3, '2021-01-18', 2, 'Too sweet for my taste, could use less syrup.'),
(122, 41, 62, 4, '2022-09-01', 3, 'Nice balance of matcha and milk, would get again.'),
(123, 68, 56, 5, '2023-11-04', 1, 'Excellent balance of sweetness and matcha depth.'),
(124, 53, 70, 4, '2024-10-21', 2, 'Great presentation and Instagram-worthy.'),
(125, 27, 57, 3, '2022-02-14', 3, 'Too much ice, diluted the drink.'),
(126, 11, 98, 4, '2023-06-15', 2, 'Good value compared to nearby cafes.'),
(127, 77, 29, 4, '2024-07-07', 1, 'Nice spot to study while sipping this.'),
(128, 88, 19, 4, '2025-03-28', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(129, 86, 71, 3, '2021-11-04', 1, 'Not as strong as expected for the price.'),
(130, 102, 75, 4, '2022-06-06', 2, 'Nice balance of matcha and milk, would get again.'),
(131, 83, 61, 5, '2024-11-08', 1, 'Excellent balance of sweetness and matcha depth.'),
(132, 95, 66, 4, '2023-02-22', 2, 'Good value compared to nearby cafes.'),
(133, 74, 65, 3, '2022-10-30', 1, 'Too sweet for my taste, could use less syrup.'),
(134, 20, 82, 4, '2025-09-14', 2, 'Perfect temperature and not overly sweet.'),
(135, 23, 47, 4, '2021-12-27', 1, 'Nice spot to study while sipping this.'),
(136, 56, 85, 3, '2024-02-02', 2, 'Froth was flat, lacked creaminess.'),
(137, 31, 50, 4, '2023-08-30', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(138, 8, 100, 4, '2022-05-09', 2, 'Nice balance of matcha and milk, would get again.'),
(139, 46, 68, 4, '2023-09-20', 1, 'Good value compared to nearby cafes.'),
(140, 44, 96, 3, '2022-01-14', 2, 'Too sweet for my taste, could use less syrup.'),
(141, 30, 28, 4, '2024-11-23', 1, 'Nice balance of matcha and milk, would get again.'),
(142, 98, 9, 4, '2023-12-17', 2, 'Good value compared to nearby cafes.'),
(143, 65, 42, 3, '2021-02-26', 1, 'Way too watery, felt like they skimped on matcha.'),
(144, 37, 11, 4, '2023-07-31', 2, 'Nice spot to study while sipping this.'),
(145, 26, 12, 4, '2025-04-03', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(146, 28, 15, 3, '2021-08-24', 2, 'Too much ice, diluted the drink.'),
(147, 9, 49, 4, '2024-06-27', 1, 'Good value compared to nearby cafes.'),
(148, 61, 60, 3, '2022-04-02', 1, 'Not enough matcha, mostly tasted like milk.'),
(149, 55, 51, 4, '2023-05-25', 2, 'Nice balance of matcha and milk, would get again.'),
(150, 16, 54, 4, '2024-03-30', 1, 'Perfect temperature and not overly sweet.'),
(151, 101, 38, 3, '2021-10-21', 2, 'Too sweet for my taste, could use less syrup.'),
(152, 32, 58, 4, '2025-01-12', 1, 'Nice spot to study while sipping this.'),
(153, 18, 14, 4, '2022-07-21', 3, 'Good value compared to nearby cafes.'),
(154, 7, 6, 3, '2023-11-30', 1, 'Average—nothing stood out, service was fine.'),
(155, 96, 33, 4, '2022-02-07', 2, 'Nice balance of matcha and milk, would get again.'),
(156, 84, 41, 5, '2024-08-02', 3, 'Excellent balance of sweetness and matcha depth.'),
(157, 3, 2, 2, '2021-03-11', 2, 'Too sweet for my taste, could use less syrup.'),
(158, 47, 17, 4, '2023-06-10', 3, 'Nice balance of matcha and milk, would get again.'),
(159, 62, 44, 4, '2025-08-23', 2, 'Good value compared to nearby cafes.'),
(160, 29, 35, 4, '2024-09-09', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(161, 64, 30, 3, '2022-03-04', 2, 'Froth was flat, lacked creaminess.'),
(162, 85, 20, 4, '2023-09-02', 3, 'Nice balance of matcha and milk, would get again.'),
(163, 33, 45, 5, '2025-06-01', 3, 'Excellent balance of sweetness and matcha depth.'),
(164, 81, 4, 3, '2021-01-09', 1, 'Way too watery, felt like they skimped on matcha.'),
(165, 40, 1, 4, '2024-04-14', 2, 'Nice spot to study while sipping this.'),
(166, 14, 13, 2, '2022-06-18', 1, 'Too much ice, diluted the drink.'),
(167, 75, 9, 4, '2025-07-22', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(168, 11, 37, 4, '2023-08-09', 1, 'Good value compared to nearby cafes.'),
(169, 63, 36, 3, '2022-11-19', 2, 'Not as strong as expected for the price.'),
(170, 57, 39, 4, '2024-10-10', 1, 'Nice balance of matcha and milk, would get again.'),
(171, 72, 27, 4, '2023-03-27', 2, 'Nice spot to study while sipping this.'),
(172, 24, 69, 3, '2021-05-02', 3, 'Too sweet for my taste, could use less syrup.'),
(173, 68, 46, 5, '2025-10-11', 2, 'Excellent balance of sweetness and matcha depth.'),
(174, 34, 22, 4, '2024-01-26', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(175, 42, 71, 3, '2022-09-15', 2, 'Too much ice, diluted the drink.'),
(176, 50, 52, 4, '2023-02-13', 1, 'Nice spot to study while sipping this.'),
(177, 10, 83, 4, '2024-07-01', 2, 'Good value compared to nearby cafes.'),
(178, 101, 56, 3, '2021-04-16', 1, 'Too sweet for my taste, could use less syrup.'),
(179, 69, 78, 4, '2023-05-09', 2, 'Nice balance of matcha and milk, would get again.'),
(180, 36, 8, 5, '2024-11-12', 1, 'Excellent balance of sweetness and matcha depth.'),
(181, 12, 26, 4, '2025-05-02', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(182, 97, 57, 3, '2022-12-20', 1, 'Not enough matcha, mostly tasted like milk.'),
(183, 89, 66, 4, '2024-03-12', 2, 'Nice balance of matcha and milk, would get again.'),
(184, 86, 11, 5, '2023-07-27', 1, 'Excellent balance of sweetness and matcha depth.'),
(185, 6, 53, 4, '2021-02-20', 2, 'Good value compared to nearby cafes.'),
(186, 78, 25, 3, '2022-05-05', 1, 'Too sweet for my taste, could use less syrup.'),
(187, 4, 49, 4, '2024-02-02', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(188, 9, 55, 4, '2023-08-18', 1, 'Nice balance of matcha and milk, would get again.'),
(189, 71, 61, 3, '2021-09-29', 2, 'Froth was flat, lacked creaminess.'),
(190, 38, 32, 4, '2022-03-29', 1, 'Nice spot to study while sipping this.'),
(191, 25, 2, 4, '2024-06-09', 2, 'Good value compared to nearby cafes.'),
(192, 59, 67, 4, '2025-01-29', 1, 'Perfect temperature and not overly sweet.'),
(193, 82, 48, 3, '2023-10-11', 2, 'Too much ice, diluted the drink.'),
(194, 46, 63, 5, '2024-12-01', 1, 'Excellent balance of sweetness and matcha depth.'),
(195, 16, 18, 4, '2021-11-01', 2, 'Nice balance of matcha and milk, would get again.'),
(196, 54, 5, 4, '2023-01-03', 1, 'Good value compared to nearby cafes.'),
(197, 30, 75, 3, '2022-08-25', 2, 'Too sweet for my taste, could use less syrup.'),
(198, 47, 19, 4, '2024-05-20', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(199, 3, 79, 4, '2023-12-08', 2, 'Nice balance of matcha and milk, would get again.'),
(200, 26, 84, 5, '2024-11-03', 1, 'Excellent balance of sweetness and matcha depth.'),
(201, 13, 17, 3, '2021-06-07', 2, 'Too much ice, diluted the drink.'),
(202, 92, 40, 4, '2022-02-18', 1, 'Nice presentation and a decent flavor.'),
(203, 56, 24, 4, '2025-02-05', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(204, 35, 76, 3, '2021-12-18', 1, 'Way too watery, felt like they skimped on matcha.'),
(205, 62, 33, 4, '2023-04-06', 2, 'Good value compared to nearby cafes.'),
(206, 49, 81, 4, '2024-08-14', 1, 'Nice balance of matcha and milk, would get again.'),
(207, 66, 82, 2, '2022-06-02', 2, 'Too sweet for my taste, could use less syrup.'),
(208, 5, 85, 4, '2023-09-19', 1, 'Nice spot to study while sipping this.'),
(209, 58, 90, 3, '2021-10-07', 2, 'Froth was flat, lacked creaminess.'),
(210, 1, 86, 4, '2024-10-28', 1, 'Freshly whisked and vibrant color, highly recommend.'),
(211, 28, 12, 4, '2025-03-03', 2, 'Nice balance of matcha and milk, would get again.'),
(212, 80, 77, 4, '2023-02-24', 3, 'Good value compared to nearby cafes.'),
(213, 61, 14, 3, '2022-11-01', 2, 'Too much ice, diluted the drink.'),
(214, 18, 9, 4, '2024-01-11', 1, 'Nice spot to study while sipping this.'),
(215, 90, 7, 4, '2025-05-08', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(216, 20, 68, 3, '2021-04-28', 1, 'Too sweet for my taste, could use less syrup.'),
(217, 67, 97, 4, '2024-09-01', 2, 'Nice balance of matcha and milk, would get again.'),
(218, 45, 6, 5, '2023-08-05', 1, 'Excellent balance of sweetness and matcha depth.'),
(219, 31, 11, 3, '2022-12-02', 2, 'Not enough matcha, mostly tasted like milk.'),
(220, 99, 88, 4, '2023-05-28', 1, 'Nice spot to study while sipping this.'),
(221, 74, 71, 4, '2024-04-17', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(222, 27, 70, 3, '2021-07-03', 1, 'Too sweet for my taste, could use less syrup.'),
(223, 33, 65, 4, '2023-03-08', 2, 'Nice balance of matcha and milk, would get again.'),
(224, 19, 82, 4, '2025-06-12', 1, 'Perfect temperature and not overly sweet.'),
(225, 15, 51, 3, '2022-09-10', 2, 'Froth was flat, lacked creaminess.'),
(226, 85, 44, 4, '2024-02-13', 1, 'Nice spot to study while sipping this.'),
(227, 38, 57, 4, '2023-11-22', 2, 'Good value compared to nearby cafes.'),
(228, 11, 26, 3, '2021-08-07', 3, 'Too much ice, diluted the drink.'),
(229, 93, 32, 4, '2024-12-11', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(230, 14, 58, 4, '2023-06-01', 1, 'Nice balance of matcha and milk, would get again.'),
(231, 37, 29, 3, '2022-10-05', 2, 'Too sweet for my taste, could use less syrup.'),
(232, 25, 16, 4, '2024-05-02', 1, 'Good value compared to nearby cafes.'),
(233, 7, 47, 5, '2025-01-27', 2, 'Excellent balance of sweetness and matcha depth.'),
(234, 57, 43, 4, '2023-09-14', 1, 'Nice spot to study while sipping this.'),
(235, 86, 50, 3, '2022-02-21', 2, 'Way too watery, felt like they skimped on matcha.'),
(236, 91, 36, 4, '2024-08-25', 1, 'Nice balance of matcha and milk, would get again.'),
(237, 60, 75, 4, '2023-04-25', 2, 'Perfect temperature and not overly sweet.'),
(238, 34, 69, 3, '2021-03-06', 1, 'Too sweet for my taste, could use less syrup.'),
(239, 82, 13, 4, '2025-10-02', 2, 'Freshly whisked and vibrant color, highly recommend.'),
(240, 26, 21, 4, '2024-07-19', 1, 'Nice balance of matcha and milk, would get again.'),
(241, 16, 12, 3, '2022-05-15', 2, 'Too much ice, diluted the drink.'),
(242, 46, 8, 5, '2023-12-02', 1, 'Excellent balance of sweetness and matcha depth.'),
(243, 39, 40, 4, '2024-03-07', 2, 'Good value compared to nearby cafes.'),
(244, 44, 9, 3, '2022-01-21', 1, 'Too sweet for my taste, could use less syrup.'),
(245, 68, 2, 4, '2025-09-05', 2, 'Perfect temperature and not overly sweet.'),
(246, 101, 17, 4, '2023-02-27', 1, 'Nice spot to study while sipping this.'),
(247, 24, 1, 3, '2021-09-18', 2, 'Froth was flat, lacked creaminess.'),
(248, 79, 4, 5, '2024-06-05', 1, 'Excellent balance of sweetness and matcha depth.'),
(249, 92, 6, 4, '2023-08-16', 2, 'Nice balance of matcha and milk, would get again.'),
(250, 48, 99, 4, '2025-07-08', 1, 'Freshly whisked and vibrant color, highly recommend.');

-- Insert data into source table
INSERT INTO source (source_id, name, url) VALUES
(1, 'Google Maps', 'https://www.google.com/maps/'),
(2, 'Yelp', 'https://www.yelp.com/'),
(3, 'Apple Maps', 'https://maps.apple.com'),
(4, 'Researcher', NULL),
(5, 'DoorDash', 'https://doordash.com'),
(6, 'UberEats', 'https://ubereats.com'),
(7, 'Beli', 'https://beliapp.com/');

USE matcha_cafes; 

-- 1. Which cafes offer the best value by having both high ratings AND a high number of 
-- reviews?
SELECT 
    c.name AS cafe_name,
    c.neighborhood,
    COUNT(DISTINCT r.review_id) AS review_count,
    ROUND(AVG(r.rating_out_of_five), 2) AS avg_rating,
    ROUND(AVG(p.price), 2) AS avg_price,
    -- Combined score: balances rating AND number of reviews
    ROUND(
        (AVG(r.rating_out_of_five) * 0.7) + 
        (LOG(COUNT(DISTINCT r.review_id) + 1) * 0.3), 
    2) AS quality_score,
    -- Value score: quality per dollar
    ROUND(
        ((AVG(r.rating_out_of_five) * 0.7) + 
         (LOG(COUNT(DISTINCT r.review_id) + 1) * 0.3)) / 
        AVG(p.price), 
    2) AS value_score
FROM cafe c
JOIN drink d ON c.cafe_id = d.cafe_id
JOIN review r ON d.drink_id = r.drink_id
JOIN price p ON d.drink_id = p.drink_id
WHERE p.size_in_oz = 16
GROUP BY c.cafe_id, c.name, c.neighborhood
HAVING COUNT(DISTINCT r.review_id) >= 5  -- Minimum 5 reviews to be considered
ORDER BY value_score DESC, review_count DESC
LIMIT 10;


-- 2. Which cafes have the most generous weekend hours? Do they have better ratings because
-- of that?
SELECT 
    c.name AS cafe_name,
    c.neighborhood,
    -- Saturday hours
    (SELECT CONCAT(open_time, ' to ', close_time) 
     FROM hour h2 
     WHERE h2.cafe_id = c.cafe_id AND h2.day_of_week = 'Saturday'
     LIMIT 1) AS saturday_hours,
    -- Sunday hours  
    (SELECT CONCAT(open_time, ' to ', close_time) 
     FROM hour h2 
     WHERE h2.cafe_id = c.cafe_id AND h2.day_of_week = 'Sunday'
     LIMIT 1) AS sunday_hours,
    -- Calculate total weekend hours
    COALESCE(
        (SELECT TIMESTAMPDIFF(HOUR, STR_TO_DATE(open_time, '%H:%i'), 
                                     STR_TO_DATE(close_time, '%H:%i'))
         FROM hour h2 
         WHERE h2.cafe_id = c.cafe_id AND h2.day_of_week = 'Saturday'
           AND open_time IS NOT NULL), 0) +
    COALESCE(
        (SELECT TIMESTAMPDIFF(HOUR, STR_TO_DATE(open_time, '%H:%i'), 
                                     STR_TO_DATE(close_time, '%H:%i'))
         FROM hour h2 
         WHERE h2.cafe_id = c.cafe_id AND h2.day_of_week = 'Sunday'
           AND open_time IS NOT NULL), 0) AS total_weekend_hours,
    -- Average rating for the cafe
    (SELECT ROUND(AVG(r.rating_out_of_five), 2)
     FROM drink d
     JOIN review r ON d.drink_id = r.drink_id
     WHERE d.cafe_id = c.cafe_id) AS avg_rating,
    -- Review count for context
    (SELECT COUNT(*)
     FROM drink d
     JOIN review r ON d.drink_id = r.drink_id
     WHERE d.cafe_id = c.cafe_id) AS review_count
FROM cafe c
ORDER BY total_weekend_hours DESC, avg_rating DESC;


-- 3. Do ratings for Matcha Cafe Maiko differ by platform?
SELECT 
    s.name AS platform,
    COUNT(r.review_id) AS review_count,
    ROUND(AVG(r.rating_out_of_five), 2) AS avg_rating,
    MIN(r.rating_out_of_five) AS lowest_rating,
    MAX(r.rating_out_of_five) AS highest_rating,
    -- Rating distribution
    SUM(CASE WHEN r.rating_out_of_five = 5 THEN 1 ELSE 0 END) AS five_star,
    SUM(CASE WHEN r.rating_out_of_five = 4 THEN 1 ELSE 0 END) AS four_star,
    SUM(CASE WHEN r.rating_out_of_five = 3 THEN 1 ELSE 0 END) AS three_star,
    SUM(CASE WHEN r.rating_out_of_five = 2 THEN 1 ELSE 0 END) AS two_star,
    SUM(CASE WHEN r.rating_out_of_five = 1 THEN 1 ELSE 0 END) AS one_star
FROM review r
JOIN source s ON r.source_id = s.source_id
JOIN drink d ON r.drink_id = d.drink_id
JOIN cafe c ON d.cafe_id = c.cafe_id
WHERE c.name = 'Matcha Cafe Maiko'
GROUP BY s.source_id, s.name
HAVING COUNT(r.review_id) >= 3  -- Only show platforms with meaningful data
ORDER BY review_count DESC, avg_rating DESC;


-- 4. Is there a higher price for cafes closer to Northeastern's campus?
SELECT 
    c.name AS cafe_name,
    c.miles_from_neu,
    ROUND(AVG(p.price), 2) AS avg_price,
    COUNT(r.review_id) AS review_count,
    ROUND(AVG(r.rating_out_of_five), 2) AS avg_rating
FROM cafe c
JOIN drink d ON c.cafe_id = d.cafe_id
JOIN price p ON d.drink_id = p.drink_id
LEFT JOIN review r ON d.drink_id = r.drink_id
WHERE p.size_in_oz = 16
GROUP BY c.cafe_id, c.name, c.miles_from_neu
HAVING COUNT(r.review_id) >= 2
ORDER BY c.miles_from_neu, avg_price DESC;


-- 5. Which cafes are the highest rated within their neighborhood?
SELECT 
    c.neighborhood,
    c.name AS best_cafe,
    ROUND(AVG(r.rating_out_of_five), 2) AS avg_rating,
    COUNT(r.review_id) AS review_count
FROM cafe c
JOIN drink d ON c.cafe_id = d.cafe_id
JOIN review r ON d.drink_id = r.drink_id
GROUP BY c.cafe_id, c.name, c.neighborhood
HAVING COUNT(r.review_id) >= 3
ORDER BY c.neighborhood, avg_rating DESC;


-- 6. Do customers prefer and rate iced matcha drinks differently than hot ones?
SELECT 
    CASE WHEN d.is_iced = 'Y' THEN 'Iced' ELSE 'Hot' END AS drink_type,
    COUNT(DISTINCT d.drink_id) AS num_drinks,
    COUNT(r.review_id) AS review_count,
    ROUND(AVG(r.rating_out_of_five), 2) AS avg_rating,
    ROUND(AVG(p.price), 2) AS avg_price,
    ROUND(AVG(r.rating_out_of_five) / AVG(p.price), 3) AS value_ratio
FROM drink d
LEFT JOIN review r ON d.drink_id = r.drink_id
LEFT JOIN price p ON d.drink_id = p.drink_id AND p.size_in_oz = 16
WHERE d.is_iced IN ('Y', 'N')
GROUP BY drink_type
ORDER BY review_count DESC;


-- 7. Which cafes offer the most matcha drink options on their menu?
SELECT 
    c.name AS cafe_name,
    c.neighborhood,
    COUNT(DISTINCT d.drink_id) AS num_matcha_drinks,
    COUNT(DISTINCT r.review_id) AS review_count,
    ROUND(AVG(r.rating_out_of_five), 2) AS avg_rating
FROM cafe c
JOIN drink d ON c.cafe_id = d.cafe_id
LEFT JOIN review r ON d.drink_id = r.drink_id
GROUP BY c.cafe_id, c.name, c.neighborhood
ORDER BY num_matcha_drinks DESC, avg_rating DESC;


-- 8. Which cafes have the most consistent pricing across their different 
-- matcha drinks, and which have the widest price ranges?
SELECT 
    c.name AS cafe_name,
    c.neighborhood,
    COUNT(DISTINCT d.drink_id) AS num_drinks,
    -- Price statistics
    ROUND(MIN(p.price), 2) AS cheapest_drink,
    ROUND(MAX(p.price), 2) AS most_expensive_drink,
    ROUND(MAX(p.price) - MIN(p.price), 2) AS price_range,
    ROUND(AVG(p.price), 2) AS avg_price,
    -- Price consistency (standard deviation)
    ROUND(SQRT(AVG(p.price * p.price) - AVG(p.price) * AVG(p.price)), 2) AS price_std_dev,
    -- Consistency rating
    CASE 
        WHEN MAX(p.price) - MIN(p.price) <= 1.50 THEN 'Very Consistent'
        WHEN MAX(p.price) - MIN(p.price) <= 3.00 THEN 'Moderately Consistent'
        ELSE 'Variable Pricing'
    END AS pricing_consistency
FROM cafe c
JOIN drink d ON c.cafe_id = d.cafe_id
JOIN price p ON d.drink_id = p.drink_id
WHERE p.size_in_oz = 16  -- Standardize to 16oz for fair comparison
GROUP BY c.cafe_id, c.name, c.neighborhood
HAVING COUNT(DISTINCT d.drink_id) >= 3  -- Only cafes with multiple drinks
ORDER BY price_range, price_std_dev;