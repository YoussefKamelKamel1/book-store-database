
create database book_store ;
 use  book_store;
 
 -- 1. Book Table
CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255),
    Publication_Date DATE,
    Price DECIMAL(10, 2),
    Quantity_Available INT,
    Weight DECIMAL(10, 2),
    Description TEXT,
    Cover_Image VARCHAR(255),
    Rating DECIMAL(3, 2)
);

-- 2. Author Table
CREATE TABLE Author (
    Author_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255)
);

-- 3. Book_Author Table
CREATE TABLE Book_Author (
    ISBN VARCHAR(13),
    Author_ID INT,
    PRIMARY KEY (ISBN, Author_ID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID)
);

-- 4. Category Table
CREATE TABLE Category (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255)
);

-- 5. Subcategory Table
CREATE TABLE Subcategory (
    Subcategory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_ID INT,
    Name VARCHAR(255),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

-- 6. Book_Category Table
CREATE TABLE Book_Category (
    ISBN VARCHAR(13),
    Subcategory_ID INT,
    PRIMARY KEY (ISBN, Subcategory_ID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (Subcategory_ID) REFERENCES Subcategory(Subcategory_ID)
);

-- 7. Customer Table
CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);

-- 8. Customer_Contact Table
CREATE TABLE Customer_Contact (
    Contact_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Contact_Number VARCHAR(15),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- 9. Customer_Address Table
CREATE TABLE Customer_Address (
    Address_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Address VARCHAR(255),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- 10. Order Table
CREATE TABLE `Order` (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10, 2),
    Payment_Status VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- 11. Order Item Table
CREATE TABLE Order_Item (
    Order_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    ISBN VARCHAR(13),
    Quantity INT,
    Price DECIMAL(10, 2),
    Discount DECIMAL(5, 2),
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

-- 12. Review Table
CREATE TABLE Review (
    Review_ID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13),
    Customer_ID INT,
    Rating DECIMAL(3, 2),
    Review_Text TEXT,
    Review_Date DATE,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- 13. Wish List Table
CREATE TABLE Wish_List (
    Wish_List_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    ISBN VARCHAR(13),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

-- 14. Shipping Table
CREATE TABLE Shipping (
    Shipping_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Address_ID INT,
    Delivery_Status VARCHAR(50),
    Tracking_Number VARCHAR(50),
    Estimated_Delivery_Date DATE,
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID),
    FOREIGN KEY (Address_ID) REFERENCES Customer_Address(Address_ID)
);

-- 15. Invoice Table
CREATE TABLE Invoice (
    Invoice_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Invoice_Date DATE,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID)
);

-- 16. Preferences Table
CREATE TABLE Preferences (
    Preference_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- 17. Genre Preference Table
CREATE TABLE Genre_Preference (
    Preference_ID INT,
    Genre VARCHAR(255),
    FOREIGN KEY (Preference_ID) REFERENCES Preferences(Preference_ID)
);

-- 18. Author Preference Table
CREATE TABLE Author_Preference (
    Preference_ID INT,
    Author_ID INT,
    FOREIGN KEY (Preference_ID) REFERENCES Preferences(Preference_ID),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID)
);

-- 19. Recommendations Table
CREATE TABLE Recommendations (
    Recommendation_ID INT AUTO_INCREMENT PRIMARY KEY,
    Preference_ID INT,
    ISBN VARCHAR(13),
    FOREIGN KEY (Preference_ID) REFERENCES Preferences(Preference_ID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

-- Alter the Book table to change the ISBN column length
ALTER TABLE Book MODIFY COLUMN ISBN VARCHAR(20);
-- Alter the Order_Item table to change the ISBN column length
ALTER TABLE Order_Item MODIFY COLUMN ISBN VARCHAR(20);
-- Alter the Order_Item table to change the ISBN column length
ALTER TABLE Review MODIFY COLUMN ISBN VARCHAR(20);

ALTER TABLE Recommendations MODIFY COLUMN ISBN VARCHAR(20);
ALTER TABLE Wish_List MODIFY COLUMN ISBN VARCHAR(20);

ALTER TABLE Book_Category MODIFY COLUMN ISBN VARCHAR(20);
ALTER TABLE Book_Author MODIFY COLUMN ISBN VARCHAR(20);
-- Insert Book_Author data (book ISBN and associated author)
INSERT INTO Book_Author (ISBN, Author_ID) VALUES
('978-1-23456-789-7', 1),  -- Book 1 by Author 1
('978-1-23456-789-8', 2),  -- Book 2 by Author 2
('978-1-23456-789-9', 1),  -- Book 3 by Author 1
('978-1-23456-790-0', 3),  -- Book 4 by Author 3
('978-1-23456-790-1', 2),  -- Book 5 by Author 2
('978-1-23456-790-2', 4),  -- Book 6 by Author 4
('978-1-23456-790-3', 1),  -- Book 7 by Author 1
('978-1-23456-790-4', 5),  -- Book 8 by Author 5
('978-1-23456-790-5', 2),  -- Book 9 by Author 2
('978-1-23456-790-6', 3);  -- Book 10 by Author 3


-- Insert Customer_Contact data (customer ID and their contact numbers)
INSERT INTO Customer_Contact (Customer_ID, Contact_Number) VALUES
(1, '555-1234'),  -- Customer 1's contact
(2, '555-5678'),  -- Customer 2's contact
(3, '555-9012'),  -- Customer 3's contact
(4, '555-3456'),  -- Customer 4's contact
(5, '555-7890'),  -- Customer 5's contact
(6, '555-2345'),  -- Customer 6's contact
(7, '555-6789'),  -- Customer 7's contact
(8, '555-0123'),  -- Customer 8's contact
(9, '555-3456'),  -- Customer 9's contact
(10, '555-6780'); -- Customer 10's contact


-- Insert data into Book Table
INSERT INTO Book (ISBN, Title, Publication_Date, Price, Quantity_Available, Weight, Description, Cover_Image, Rating)
VALUES
('978-1-23456-789-7', 'Book 1', '2023-05-20', 15.99, 100, 1.5, 'Description of Book 1', 'cover1.jpg', 4.5),
('978-1-23456-789-8', 'Book 2', '2024-02-15', 20.99, 50, 1.2, 'Description of Book 2', 'cover2.jpg', 4.7),
('978-1-23456-789-9', 'Book 3', '2023-12-01', 10.99, 200, 1.3, 'Description of Book 3', 'cover3.jpg', 4.3),
('978-1-23456-790-0', 'Book 4', '2022-08-22', 25.99, 150, 1.8, 'Description of Book 4', 'cover4.jpg', 4.6),
('978-1-23456-790-1', 'Book 5', '2021-10-10', 18.99, 120, 1.4, 'Description of Book 5', 'cover5.jpg', 4.1),
('978-1-23456-790-2', 'Book 6', '2024-01-05', 22.99, 80, 1.6, 'Description of Book 6', 'cover6.jpg', 4.8),
('978-1-23456-790-3', 'Book 7', '2023-07-18', 17.99, 200, 1.5, 'Description of Book 7', 'cover7.jpg', 4.2),
('978-1-23456-790-4', 'Book 8', '2023-11-03', 21.99, 90, 1.7, 'Description of Book 8', 'cover8.jpg', 4.4),
('978-1-23456-790-5', 'Book 9', '2022-05-20', 19.99, 130, 1.3, 'Description of Book 9', 'cover9.jpg', 4.0),
('978-1-23456-790-6', 'Book 10', '2024-03-17', 29.99, 60, 1.8, 'Description of Book 10', 'cover10.jpg', 4.9);

-- Insert data into Author Table
INSERT INTO Author (Name)
VALUES
('Author 1'),
('Author 2'),
('Author 3'),
('Author 4'),
('Author 5'),
('Author 6'),
('Author 7'),
('Author 8'),
('Author 9'),
('Author 10');

-- Insert data into Category Table
INSERT INTO Category (Name)
VALUES
('Fiction'),
('Non-Fiction'),
('Science'),
('History'),
('Biography'),
('Fantasy'),
('Romance'),
('Mystery'),
('Thriller'),
('Self-Help');

-- Insert data into Subcategory Table
INSERT INTO Subcategory (Category_ID, Name)
VALUES
(1, 'Fantasy'),
(1, 'Thriller'),
(2, 'Biography'),
(2, 'Memoir'),
(3, 'Physics'),
(4, 'Ancient History'),
(5, 'Modern History'),
(6, 'High Fantasy'),
(7, 'Contemporary Romance'),
(8, 'Detective');

-- Insert data into Customer Table
INSERT INTO Customer (First_Name, Last_Name, Email, Password)
VALUES
('John', 'Doe', 'john.doe@example.com', 'password123'),
('Jane', 'Smith', 'jane.smith@example.com', 'password123'),
('Emily', 'Johnson', 'emily.johnson@example.com', 'password123'),
('Michael', 'Williams', 'michael.williams@example.com', 'password123'),
('Sarah', 'Brown', 'sarah.brown@example.com', 'password123'),
('David', 'Jones', 'david.jones@example.com', 'password123'),
('Laura', 'Davis', 'laura.davis@example.com', 'password123'),
('Chris', 'Miller', 'chris.miller@example.com', 'password123'),
('Patricia', 'Wilson', 'patricia.wilson@example.com', 'password123'),
('Robert', 'Moore', 'robert.moore@example.com', 'password123');

-- Insert data into Order Table
INSERT INTO `Order` (Customer_ID, Order_Date, Total_Amount, Payment_Status)
VALUES
(1, '2024-11-15', 45.97, 'Paid'),
(2, '2024-11-16', 31.98, 'Pending'),
(3, '2024-10-12', 75.50, 'Paid'),
(4, '2024-08-20', 95.99, 'Paid'),
(5, '2024-07-17', 120.50, 'Pending'),
(6, '2024-06-18', 55.75, 'Paid'),
(7, '2024-05-21', 67.25, 'Paid'),
(8, '2024-04-22', 80.00, 'Pending'),
(9, '2024-03-23', 50.60, 'Paid'),
(10, '2024-02-24', 40.30, 'Paid');

-- Insert data into Order_Item Table
INSERT INTO Order_Item (Order_ID, ISBN, Quantity, Price, Discount)
VALUES
(1, '978-1-23456-789-7', 2, 15.99, 0.1),
(1, '978-1-23456-789-8', 1, 20.99, 0),
(2, '978-1-23456-789-9', 1, 10.99, 0),
(2, '978-1-23456-790-0', 1, 25.99, 0),
(3, '978-1-23456-790-1', 2, 18.99, 0),
(3, '978-1-23456-790-2', 1, 22.99, 0),
(4, '978-1-23456-790-3', 2, 17.99, 0.05),
(4, '978-1-23456-790-4', 3, 21.99, 0),
(5, '978-1-23456-790-5', 1, 19.99, 0),
(5, '978-1-23456-790-6', 2, 29.99, 0.1);


-- Insert data into Customer_Address table
-- Insert data into Customer_Address table
INSERT INTO Customer_Address (Customer_ID, Address)
VALUES 
(1, '123 Main St, Springfield, IL 62701'),
(2, '456 Oak St, Rivertown, TX 75001'),
(3, '789 Pine St, Hill Valley, CA 94044'),
(4, '101 Maple St, Lakeside, MN 55123'),
(5, '202 Birch St, Greenfield, WI 53220'),
(6, '303 Cedar St, Parkview, MO 65201'),
(7, '404 Elm St, Seaside, FL 33401'),
(8, '505 Redwood St, Brookfield, WI 53005'),
(9, '606 Willow St, Valley Forge, PA 19460'),
(10, '707 Birchwood St, Westford, MA 01886');



-- Insert data into Review Table
INSERT INTO Review (ISBN, Customer_ID, Rating, Review_Text, Review_Date)
VALUES
('978-1-23456-789-7', 1, 5.0, 'Great book!', '2024-11-15'),
('978-1-23456-789-8', 2, 4.0, 'Good book but a bit slow.', '2024-11-16'),
('978-1-23456-789-9', 3, 4.5, 'Very informative and engaging.', '2024-10-13'),
('978-1-23456-790-0', 4, 5.0, 'Loved the story and characters!', '2024-08-21'),
('978-1-23456-790-1', 5, 4.0, 'A good read for history buffs.', '2024-07-18'),
('978-1-23456-790-2', 6, 4.5, 'Highly recommend this one!', '2024-06-19'),
('978-1-23456-790-3', 7, 5.0, 'Wonderful mystery novel!', '2024-05-22'),
('978-1-23456-790-4', 8, 3.5, 'Could have been more suspenseful.', '2024-04-23'),
('978-1-23456-790-5', 9, 4.0, 'Interesting take on a classic genre.', '2024-03-24'),
('978-1-23456-790-6', 10, 5.0, 'Fantastic book! One of the best I have read.', '2024-02-25');

-- Insert data into Wish_List Table
INSERT INTO Wish_List (Customer_ID, ISBN)
VALUES
(1, '978-1-23456-789-7'),
(1, '978-1-23456-790-1'),
(2, '978-1-23456-790-2'),
(3, '978-1-23456-790-3'),
(4, '978-1-23456-790-4'),
(5, '978-1-23456-790-5'),
(6, '978-1-23456-790-6'),
(7, '978-1-23456-789-8'),
(8, '978-1-23456-789-9'),
(9, '978-1-23456-790-0');

-- Insert data into Shipping Table
-- Insert data into Shipping table using Address_ID from Customer_Address table
INSERT INTO Shipping (Order_ID, Address_ID, Delivery_Status, Tracking_Number, Estimated_Delivery_Date)
VALUES
(1, 1, 'Shipped', 'TRK001', '2024-11-20'),
(2, 2, 'Processing', 'TRK002', '2024-11-25'),
(3, 3, 'Shipped', 'TRK003', '2024-10-14'),
(4, 4, 'Shipped', 'TRK004', '2024-08-23'),
(5, 5, 'Processing', 'TRK005', '2024-07-19'),
(6, 6, 'Shipped', 'TRK006', '2024-06-20'),
(7, 7, 'Processing', 'TRK007', '2024-05-23'),
(8, 8, 'Shipped', 'TRK008', '2024-04-24'),
(9, 9, 'Shipped', 'TRK009', '2024-03-25'),
(10, 10, 'Shipped', 'TRK010', '2024-02-26');

-- Insert data into Invoice Table
INSERT INTO Invoice (Order_ID, Invoice_Date, Total_Amount)
VALUES
(1, '2024-11-15', 45.97),
(2, '2024-11-16', 31.98),
(3, '2024-10-12', 75.50),
(4, '2024-08-20', 95.99),
(5, '2024-07-17', 120.50),
(6, '2024-06-18', 55.75),
(7, '2024-05-21', 67.25),
(8, '2024-04-22', 80.00),
(9, '2024-03-23', 50.60),
(10, '2024-02-24', 40.30);

-- Insert data into Preferences Table
-- Insert data into Preferences table
INSERT INTO Preferences (Customer_ID)
VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Insert data into Genre_Preference table
INSERT INTO Genre_Preference (Preference_ID, Genre)
VALUES
(1, 'Fiction'),
(2, 'Mystery'),
(3, 'Science Fiction'),
(4, 'Romance'),
(5, 'Fantasy'),
(6, 'Non-Fiction'),
(7, 'Biography'),
(8, 'Thriller'),
(9, 'Historical Fiction'),
(10, 'Horror');


-- Insert data into Author_Preference table
INSERT INTO Author_Preference (Preference_ID, Author_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

-- Insert data into Recommendations table
INSERT INTO Recommendations (Preference_ID, ISBN)
VALUES
(1, '978-1-23456-789-7'),
(2, '978-1-23456-789-8'),
(3, '978-1-23456-789-9'),
(4, '978-1-23456-790-0'),
(5, '978-1-23456-790-1'),
(6, '978-1-23456-790-2'),
(7, '978-1-23456-790-3'),
(8, '978-1-23456-790-4'),
(9, '978-1-23456-790-5'),
(10, '978-1-23456-790-6');

INSERT INTO Subcategory (Category_ID, Name) VALUES
(1, 'Fiction'),
(2, 'Biography'),
(3, 'Physics'),
(4, 'Ancient History');

INSERT INTO Book (ISBN, Title, Publication_Date, Price, Quantity_Available, Weight, Description, Cover_Image, Rating) VALUES

('978-1-23456-789-8', 'Book 2', '2024-02-15', 20.99, 50, 1.2, 'Description of Book 2', 'cover2.jpg', 4.7),
('978-1-23456-789-9', 'Book 3', '2023-12-01', 10.99, 200, 1.3, 'Description of Book 3', 'cover3.jpg', 4.3),
('978-1-23456-790-0', 'Book 4', '2022-08-22', 25.99, 150, 1.8, 'Description of Book 4', 'cover4.jpg', 4.6),
('978-1-23456-790-1', 'Book 5', '2021-10-10', 18.99, 120, 1.4, 'Description of Book 5', 'cover5.jpg', 4.1);

INSERT INTO Book_Category (ISBN, Subcategory_ID) VALUES
('978-1-23456-789-7', 1),  -- Fiction
('978-1-23456-789-8', 2),  -- Biography
('978-1-23456-789-9', 3),  -- Physics
('978-1-23456-790-0', 4),  -- Ancient History
('978-1-23456-790-1', 1);  -- Fiction

-- Insert data into Customer table (for at least 5 customers)
INSERT INTO Customer (First_Name, Last_Name, Email, Password) VALUES
('John', 'Doe', 'johndoe@example.com', 'password123'),
('Jane', 'Smith', 'janesmith@example.com', 'password123'),
('Alice', 'Johnson', 'alicej@example.com', 'password123'),
('Bob', 'Brown', 'bobbrown@example.com', 'password123'),
('Charlie', 'Davis', 'charlied@example.com', 'password123'),
('Eve', 'Williams', 'evew@example.com', 'password123'),
('Frank', 'Miller', 'frankm@example.com', 'password123'),
('Grace', 'Wilson', 'gracew@example.com', 'password123'),
('Helen', 'Taylor', 'helent@example.com', 'password123'),
('Ivy', 'Moore', 'ivym@example.com', 'password123');


INSERT INTO `Order` (Customer_ID, Order_Date, Total_Amount, Payment_Status) VALUES
(1, '2024-01-10', 150.00, 'Paid'),
(1, '2024-02-15', 200.00, 'Paid'),
(1, '2024-03-20', 100.00, 'Pending'),
(2, '2024-01-20', 120.00, 'Paid'),
(2, '2024-02-25', 90.00, 'Paid'),
(3, '2024-03-05', 250.00, 'Paid'),
(3, '2024-04-10', 180.00, 'Pending'),
(4, '2024-01-15', 220.00, 'Paid'),
(4, '2024-02-20', 130.00, 'Paid'),
(5, '2024-03-10', 300.00, 'Paid');

INSERT INTO Order_Item (Order_ID, ISBN, Quantity, Price, Discount) VALUES
(1, '978-1-23456-789-7', 2, 15.00, 0.00), 
(1, '978-1-23456-789-8', 1, 50.00, 5.00), 
(1, '978-1-23456-789-9', 3, 10.00, 0.00), 
(2, '978-1-23456-790-0', 1, 20.00, 0.00), 
(2, '978-1-23456-790-1', 2, 25.00, 2.00), 
(3, '978-1-23456-790-2', 1, 22.00, 0.00), 
(3, '978-1-23456-790-3', 1, 18.00, 1.00),
(4, '978-1-23456-790-4', 2, 30.00, 0.00),
(4, '978-1-23456-790-5', 2, 40.00, 3.00),
(5, '978-1-23456-790-6', 4, 50.00, 0.00);




SELECT c.First_Name, c.Last_Name, c.Customer_ID
FROM Customer c
JOIN `Order` o ON c.Customer_ID = o.Customer_ID
JOIN Order_Item oi ON o.Order_ID = oi.Order_ID
GROUP BY c.Customer_ID
HAVING COUNT(DISTINCT oi.Order_Item_ID) > 3;


SELECT ISBN, Title
FROM Book
WHERE Publication_Date >= '2024-01-01';



SELECT DISTINCT c.First_Name, c.Last_Name, c.Customer_ID
FROM Customer c
JOIN Review r ON c.Customer_ID = r.Customer_ID;


SELECT DISTINCT c.First_Name, c.Last_Name, c.Customer_ID
FROM Customer c
JOIN `Order` o ON c.Customer_ID = o.Customer_ID
JOIN Order_Item oi ON o.Order_ID = oi.Order_ID
JOIN Book b ON oi.ISBN = b.ISBN
JOIN Book_Category bc ON b.ISBN = bc.ISBN
JOIN Subcategory s ON bc.Subcategory_ID = s.Subcategory_ID
JOIN Category cat ON s.Category_ID = cat.Category_ID
WHERE cat.Name = 'Fiction';






SELECT DISTINCT c.First_Name, c.Last_Name, c.Customer_ID
FROM Customer c
JOIN Wish_List wl ON c.Customer_ID = wl.Customer_ID;


SELECT DISTINCT c.First_Name, c.Last_Name, c.Customer_ID
FROM Customer c
JOIN `Order` o ON c.Customer_ID = o.Customer_ID
JOIN Order_Item oi ON o.Order_ID = oi.Order_ID
JOIN Review r ON c.Customer_ID = r.Customer_ID
WHERE oi.ISBN = r.ISBN;

