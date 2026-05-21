CREATE DATABASE IF NOT EXISTS ghyampes_shoes;
USE ghyampes_shoes;

-- Drop all existing tables to cleanly apply the new ERD
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Bill;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Offer;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Admin;

-- 1. Admin Table
CREATE TABLE IF NOT EXISTS Admin (
    Admin_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Username VARCHAR(150) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- 2. Member Table
CREATE TABLE IF NOT EXISTS Member (
    Member_ID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Username VARCHAR(150) UNIQUE NOT NULL,
    Phone VARCHAR(20) UNIQUE NOT NULL,
    Is_Approved BOOLEAN DEFAULT FALSE,
    Password VARCHAR(255) NOT NULL
);

-- 3. Product Table
CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Item_name VARCHAR(200) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Before_Price DECIMAL(10,2) DEFAULT 0.00,
    Description TEXT,
    Image_URL VARCHAR(255),
    Stock INT DEFAULT 10,
    Category VARCHAR(100),
    Admin_ID INT,
    FOREIGN KEY (Admin_ID) REFERENCES Admin(Admin_ID) ON DELETE SET NULL
);

-- 4. Order Table
CREATE TABLE IF NOT EXISTS `Order` (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Member_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Order_Time DATETIME DEFAULT CURRENT_TIMESTAMP,
    Total_Price DECIMAL(10,2) NOT NULL,
    Phone VARCHAR(20),
    Order_Note TEXT,
    City VARCHAR(100),
    Address VARCHAR(255),
    Landmark VARCHAR(255),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID) ON DELETE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE
);


-- 6. Review Table
CREATE TABLE IF NOT EXISTS Review (
    Review_ID INT AUTO_INCREMENT PRIMARY KEY,
    Member_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Comments TEXT,
    Rating_Type VARCHAR(50),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID) ON DELETE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE
);

-- Insert Default Admin username:admin (Password: admin hashed using SHA-256)
INSERT IGNORE INTO Admin (Name, Username, Password) 
VALUES ('Super Admin', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

-- Insert Sample Products for the Homepage
INSERT IGNORE INTO Product (Item_name, Price, Category, Admin_ID, Stock) VALUES
('Neon Velocity Runner', 18500.00, 'Men''s Running Shoe', 1, 10),
('Classic Gold Edition', 12000.00, 'Unisex Casual Sneaker', 1, 10),
('Mahogany Oxford', 22500.00, 'Men''s Formal Shoe', 1, 10),
('Court Dominator Elite', 25000.00, 'Men''s Basketball Shoe', 1, 10);

-- Insert Dummy Products for the Homepage
INSERT INTO Product (Item_name, Price, Before_Price, Category, Description, Image_URL, Admin_ID, Stock) VALUES 
('Air Jordan 1 Retro', 18500.00, 22000.00, 'Men', 'Classic basketball shoes.', 'images/basketball_shoe_1777806717532.png', 1, 10),
('Classic White Sneaker', 4500.00, 0.00, 'Women', 'Clean and minimal sneakers.', 'images/casual_sneaker_1777806486456.png', 1, 10),
('Premium Oxford Formal', 7200.00, 8500.00, 'Men', 'Elegant leather formal shoes.', 'images/formal_shoe_1777806518757.png', 1, 10),
('Ultra Boost Running', 12000.00, 0.00, 'Men', 'High-performance running shoes.', 'images/running_shoe_1777806317504.png', 1, 10);
