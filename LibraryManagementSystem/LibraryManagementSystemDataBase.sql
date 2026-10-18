CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;
CREATE TABLE Users(
	UserID CHAR(3) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    JoinDate DATE,
    Address VARCHAR(50) DEFAULT 'London'
);
CREATE TABLE Authors(
	AuthorID CHAR(3) PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
    Biography VARCHAR(100),
    Nationality Varchar(15)
);
CREATE TABLE Books(
	BookID CHAR(3) PRIMARY KEY,
    Title VARCHAR(30) NOT NULL,
    PublicationYear INT,
    Genre VARCHAR(20),
    ISBN CHAR(13),
    AuthorID CHAR(3),
    FOREIGN KEY(AuthorID) REFERENCES Authors(AuthorID)
);
CREATE TABLE Reservations(
	ReservationID CHAR(3) PRIMARY KEY,
    ReservationDate DATE,
    Status VARCHAR(15),
    BookID CHAR(3),
    FOREIGN KEY(BookID) REFERENCES Books(BookID),
    UserID CHAR(3),
    FOREIGN KEY(UserID) REFERENCES Users(UserID)
);
CREATE TABLE Loans(
	LoanID CHAR(3) PRIMARY KEY,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    Status VARCHAR(15) NOT NULL,
    UserID CHAR(3),
    FOREIGN KEY(UserID) REFERENCES Users(UserID)
);
CREATE TABLE Copies(
	CopyID CHAR(3) PRIMARY KEY,
    ConditionStatus VARCHAR(20),
    Format VARCHAR(15),
    Status VARCHAR(15),
    BookID CHAR(3),
    FOREIGN KEY(BookID) REFERENCES Books(BookID)
);
CREATE TABLE Loan_Copy(
	LoanID CHAR(3),
    FOREIGN KEY(LoanID) REFERENCES Loans(LoanID),
    CopyID CHAR(3),
    FOREIGN KEY(CopyID) REFERENCES Copies(CopyID)
);

INSERT INTO Users VALUES
	('001', 'Andrei', 'Clerence', 'AndrCl@gmail.com', '2024-07-23', '12095 Didcot'),
    ('002', 'Anabelle', 'Mihovnici', 'AnabelleMihovnici@gmail.com', '2024-05-12', '34123 Clinton'),
    ('003', 'Alice', 'Sanda', 'alice12san@gmail.com', '2022-12-24', DEFAULT),
    ('004', 'Alec', 'Diaz', 'alecccdiazzz@gmail.com', '2022-08-13', DEFAULT),
    ('005', 'Alex', 'Garsia', 'alexandergarsia@gmail.com', '2022-03-09', DEFAULT),
    ('006', 'Elena', 'Popescu', 'elena.popescu@gmail.com', '2023-01-15', DEFAULT),
    ('007', 'Matei', 'Ionescu', 'matei.ionescu@yahoo.com', '2023-03-20', '45 Oxford St'),
    ('008', 'Sofia', 'Radu', 'sofia.radu@outlook.com', '2023-05-11', DEFAULT),
    ('009', 'David', 'Dumitru', 'david.dumitru@gmail.com', '2023-08-02', '12 Baker St'),
    ('010', 'Maria', 'Stan', 'maria.stan@gmail.com', '2023-11-29', DEFAULT),
    ('011', 'Luka', 'Novak', 'luka.novak@gmail.com', '2024-01-10', '88 Piccadilly'),
    ('012', 'Chloe', 'Dubois', 'chloe.dubois@yahoo.fr', '2024-02-14', DEFAULT),
    ('013', 'Oliver', 'Smith', 'oliver.smith@gmail.com', '2024-04-18', '10 Downing St'),
    ('014', 'Emma', 'Taylor', 'emma.taylor@outlook.com', '2024-06-30', DEFAULT),
    ('015', 'Noah', 'Brown', 'noah.brown@gmail.com', '2024-09-05', DEFAULT),
    ('016', 'Liam', 'Wilson', 'liam.wilson@yahoo.com', '2024-10-12', '15 Regent St'),
    ('017', 'Mia', 'Garcia', 'mia.garcia@gmail.com', '2024-12-01', DEFAULT),
    ('018', 'Lucas', 'Martin', 'lucas.martin@outlook.com', '2025-01-19', DEFAULT),
    ('019', 'Aria', 'Johnson', 'aria.johnson@gmail.com', '2025-03-04', '22 Abbey Road'),
    ('020', 'Ethan', 'Davies', 'ethan.davies@gmail.com', '2025-04-22', DEFAULT);
    
INSERT INTO Authors VALUES
    ('A01', 'Sally Rooney', 'Irish author known for modern relationships novels', 'Irish'),
    ('A02', 'Dolly Alderton', 'British journalist, author and podcaster', 'British'),
    ('A03', 'George Orwell', 'English novelist and essayist famous for dystopias', 'British'),
    ('A04', 'Jane Austen', 'English novelist known for romantic fiction', 'British'),
    ('A05', 'Stephen King', 'American author of horror and supernatural fiction', 'American'),
    ('A06', 'Haruki Murakami', 'Japanese writer of magical realism and fiction', 'Japanese'),
    ('A07', 'Agatha Christie', 'English writer known for detective novels', 'British');

INSERT INTO Books VALUES
    ('B01', 'Normal People', 2018, 'Fiction', '9780141988641', 'A01'),
    ('B02', 'Conversations with Friends', 2017, 'Fiction', '9780571333134', 'A01'),
    ('B03', 'Beautiful World Where Are You', 2021, 'Fiction', '9780571365440', 'A01'),
    ('B04', 'Everything I Know About Love', 2018, 'Memoir', '9780008279684', 'A02'),
    ('B05', 'Ghosts', 2020, 'Romance', '9780008399788', 'A02'),
    ('B06', 'Good Material', 2023, 'Fiction', '9780008480301', 'A02'),
    ('B07', '1984', 1949, 'Dystopian', '9780451524935', 'A03'),
    ('B08', 'Animal Farm', 1945, 'Political Satire', '9780451526342', 'A03'),
    ('B09', 'Pride and Prejudice', 1813, 'Classic Romance', '9780141439518', 'A04'),
    ('B10', 'Sense and Sensibility', 1811, 'Classic Romance', '9780141439662', 'A04'),
    ('B11', 'The Shining', 1977, 'Horror', '9780307743657', 'A05'),
    ('B12', 'It', 1986, 'Horror', '9781501142970', 'A05'),
    ('B13', 'Norwegian Wood', 1987, 'Drama', '9780375704024', 'A06'),
    ('B14', 'Kafka on the Shore', 2002, 'Realism', '9781400079278', 'A06'),
    ('B15', 'Murder on the Orient Express', 1934, 'Mystery', '9780007119318', 'A07');
    
INSERT INTO Reservations VALUES
    ('R01', '2024-01-10', 'Completed', 'B01', '001'),
    ('R02', '2024-02-05', 'Completed', 'B04', '003'),
    ('R03', '2024-02-18', 'Cancelled', 'B07', '004'),
    ('R04', '2024-03-01', 'Completed', 'B06', '006'),
    ('R05', '2024-03-15', 'Pending',   'B11', '007'),
    ('R06', '2024-04-02', 'Completed', 'B03', '008'),
    ('R07', '2024-04-20', 'Pending',   'B05', '009'),
    ('R08', '2024-05-10', 'Cancelled', 'B15', '010'),
    ('R09', '2024-05-22', 'Pending',   'B02', '001'),
    ('R10', '2024-06-01', 'Pending',   'B14', '001'),
    ('R11', '2024-06-15', 'Completed', 'B08', '006'),
    ('R12', '2024-06-20', 'Pending',   'B12', '008'),
    ('R13', '2024-07-01', 'Completed', 'B10', '008'),
    ('R14', '2024-07-10', 'Cancelled', 'B09', '008'),
    ('R15', '2024-07-22', 'Pending',   'B04', '009'),
    ('R16', '2024-08-05', 'Completed', 'B13', '008'),
    ('R17', '2024-08-18', 'Pending',   'B01', '019'),
    ('R18', '2024-09-02', 'Pending',   'B06', '020'),
    ('R19', '2024-09-12', 'Cancelled', 'B03', '002'),
    ('R20', '2024-09-25', 'Pending',   'B11', '005');

INSERT INTO Loans VALUES
    ('L01', '2024-01-12', '2024-02-12', 'Returned', '001'),
    ('L02', '2024-01-20', '2024-02-20', 'Returned', '003'),
    ('L03', '2024-02-10', '2024-03-10', 'Returned', '009'),
    ('L04', '2024-03-05', '2024-04-05', 'Returned', '006'),
    ('L05', '2024-04-01', '2024-05-01', 'Overdue',  '007'),
    ('L06', '2024-04-15', '2024-05-15', 'Returned', '008'),
    ('L07', '2024-05-02', '2024-06-02', 'Active',   '009'),
    ('L08', '2024-05-18', '2024-06-18', 'Active',   '011'),
    ('L09', '2024-05-25', '2024-06-25', 'Active',   '010'),
    ('L10', '2024-06-02', '2024-07-02', 'Active',   '010'),
    ('L11', '2024-06-10', '2024-07-10', 'Returned', '010'),
    ('L12', '2024-06-22', '2024-07-22', 'Returned', '016'),
    ('L13', '2024-07-05', '2024-08-05', 'Overdue',  '005'),
    ('L14', '2024-07-18', '2024-08-18', 'Active',   '009'),
    ('L15', '2024-08-01', '2024-09-01', 'Active',   '003'),
    ('L16', '2024-08-12', '2024-09-12', 'Active',   '001'),
    ('L17', '2024-08-20', '2024-09-20', 'Active',   '002'),
    ('L18', '2024-09-01', '2024-10-01', 'Active',   '004'),
    ('L19', '2024-09-10', '2024-10-10', 'Active',   '010'),
    ('L20', '2024-09-15', '2024-10-15', 'Active',   '002');

INSERT INTO Copies VALUES
    ('C01', 'New', 'Hardcover', 'Available', 'B01'),
    ('C02', 'Good', 'Paperback', 'Loaned', 'B01'),
    ('C03', 'Like New','Paperback', 'Available', 'B02'),
    ('C04', 'Good', 'Hardcover', 'Available', 'B03'),
    ('C05', 'New', 'Hardcover', 'Loaned', 'B04'),
    ('C06', 'Fair', 'Paperback', 'Reserved', 'B05'),
    ('C07', 'Good', 'Hardcover', 'Available', 'B06'),
    ('C08', 'Worn', 'Paperback', 'Damaged', 'B07'),
    ('C09', 'Good', 'Paperback', 'Available', 'B08'),
    ('C10', 'Like New', 'Hardcover', 'Loaned', 'B09'),
    ('C11', 'Good', 'Paperback', 'Available', 'B10'),
    ('C12', 'Fair', 'Paperback', 'Loaned', 'B11'),
    ('C13', 'New', 'Hardcover', 'Available', 'B12'),
    ('C14', 'Good', 'Paperback', 'Available', 'B13'),
    ('C15', 'Worn', 'Hardcover', 'Reserved', 'B15'),
    ('C16', 'Worn', 'Hardcover', 'Available', 'B12'),
    ('C17', 'Like New', 'Hardcover', 'Available', 'B12'),
    ('C18', 'Worn', 'Paperback', 'Available', 'B15'),
    ('C19', 'Worn', 'Hardcover', 'Reserved', 'B11'),
    ('C20', 'Fair', 'Hardcover', 'Available', 'B10'),
    ('C21', 'New', 'Hardcover', 'Available', 'B01'),
    ('C22', 'Good', 'Paperback', 'Loaned', 'B02'),
    ('C23', 'Like New', 'Paperback', 'Available', 'B03'),
    ('C24', 'Good', 'Hardcover', 'Loaned', 'B04'),
    ('C25', 'Fair', 'Paperback', 'Available', 'B05'),
    ('C26', 'New', 'Hardcover', 'Available', 'B06'),
    ('C27', 'Good', 'Paperback', 'Loaned', 'B07'),
    ('C28', 'Worn', 'Paperback', 'Damaged', 'B08'),
    ('C29', 'Like New', 'Hardcover', 'Loaned', 'B09'),
    ('C30', 'Good', 'Paperback', 'Available', 'B14');
    

INSERT INTO Loan_Copy VALUES
    ('L01', 'C01'),
    ('L02', 'C03'),
    ('L03', 'C04'),
    ('L04', 'C07'),
    ('L05', 'C08'),
    ('L06', 'C09'),
    ('L07', 'C02'),
    ('L08', 'C05'),
    ('L09', 'C10'),
    ('L10', 'C12'),
    ('L11', 'C13'),
    ('L12', 'C14'),
    ('L13', 'C16'),
    ('L14', 'C17'),
    ('L15', 'C20'),
    ('L16', 'C22'),
    ('L17', 'C24'),
    ('L18', 'C27'),
    ('L19', 'C29'),
    ('L20', 'C18');
    
SELECT FirstName,
		LastName,
		Title AS Book_Title,
        L.Status AS Loan_Status
FROM Users AS U
	LEFT JOIN Loans AS L
		ON L.UserID=U.UserID
			JOIN Loan_Copy AS LC
				ON LC.LoanID=L.LoanID
					JOIN Copies AS C
						ON C.CopyID=LC.CopyID
							JOIN Books AS B
								ON B.BookID=C.BookID;
                                
-- 1.
/*The library's marketing team wants to send out a newsletter to the last 5 users who registered with a Gmail account.
They need a list of these users, ordered by the date they joined, with the newest members first.*/
SELECT
	UserID,
    FirstName,
    LastName,
    Email,
    JoinDate
FROM Users
WHERE Email LIKE '%@gmail%'
ORDER BY JoinDate DESC
LIMIT 5;

-- 2.
/*The library wants to highlight its most prolific authors.
We need to find the names of authors who have more than two books currently cataloged in the library system.*/
SELECT
	Name,
    COUNT(BookID) AS NumberOfBooks
FROM Authors AS A
	INNER JOIN Books AS B
		ON A.AuthorID=B.AuthorID
GROUP BY Name
HAVING NumberOfBooks>2;

-- 3.
/* Staff marketing team wants a report of all 'Drama' or 'Fiction' books published between 2000 and 2020 for an event.
The report should include the reservation status if the book currently has an active reservation; otherwise, it should just list the book.*/
SELECT
	Title,
    Genre,
    PublicationYear,
    Status AS ReservationStatus
FROM Books AS B
	LEFT JOIN Reservations AS R
		ON R.BookID=B.BookID
WHERE PublicationYear BETWEEN 2000 AND 2020
	AND Genre IN ('Drama', 'Fiction');

-- 4.
/*The inventory team needs to evaluate the physical condition of the library's copies.
We need to categorize the condition of copies into standard buckets ('Excellent', 'Acceptable', 'Needs Replacement')
and a running value of how many copies fall into each bucket is also required.*/
WITH cte_CategorizedCopies AS(
			SELECT 
				Title AS BookTitle,
				B.BookID,
				CopyID,
				CASE
					WHEN ConditionStatus IN ('New', 'Like New') THEN 'Excellent'
					WHEN ConditionStatus IN ('Good', 'Fair') THEN 'Acceptable'
					ELSE 'Needs Replacement'
				END AS ConditionCategory
			FROM Copies AS C
				JOIN Books AS B
					ON B.BookID=C.BookID)

SELECT 
	*,
    COUNT(CopyID) OVER(PARTITION BY ConditionCategory ORDER BY CopyID) AS CountCopies
FROM cte_CategorizedCopies;
    
-- 5
/*The library wants to create a loyalty program and needs
to rank users based on the total number of reservations they have made.*/
WITH cte_UserReservations AS(
			SELECT 
				UserID,
				Count(ReservationID) AS CountReservations
			FROM Reservations
			GROUP BY UserID)
SELECT
	FirstName,
    LastName,
    CountReservations,
    DENSE_RANK() OVER(ORDER BY CountReservations DESC) AS LoyaltyRank
FROM Users AS U
	LEFT JOIN cte_UserReservations AS UR
		ON UR.UserID=U.UserID;
        
-- 6.
/*We want to understand the reading preferences of our users by calculating the average publication year
of the books each user has reserved. We only want to see users whose average reserved book was published after 2010.*/
SELECT
	FirstName,
    LastName,
    ROUND(AVG(PublicationYear)) AS AvgReservedPublicationYear
FROM Users AS U
	JOIN Reservations AS R
		ON R.UserID=U.UserID
			JOIN Books AS B
				ON B.BookID=R.BookID
GROUP BY FirstName,LastName
HAVING AvgReservedPublicationYear>2010;

-- 7.
/*The marketing team wants to find "Exclusive Readers"—users who have made reservations,
but only for books within a single specific genre (eg. users who read nothing but 'Sci-Fi').*/
SELECT
	FirstName,
    LastName,
    Email,
    (SELECT DISTINCT Genre
    FROM Reservations AS R
		JOIN Books AS B
			ON B.BookID=R.BookID
	 WHERE R.UserID=U.UserID) AS ExclusiveGenre
FROM Users AS U
WHERE (	SELECT COUNT(DISTINCT Genre)
		FROM Reservations AS R
			JOIN Books AS B
				ON B.BookID=R.BookID
		WHERE R.UserID=U.UserID)=1;
        
-- 8.
/*At the end of the year, the library wants to reward its top 5 active readers( that have more than 2 borrowings),
but the query to calculate loan statistics is too heavy to run live on the main tables.
We need to store intermediate results in a temporary table, manipulate them, and then output the final winners.*/
CREATE TEMPORARY TABLE TopReaders AS
			SELECT
				U.UserID,
                FirstName,
                LastName,
                COUNT(LoanID) AS TotalLoans
			FROM Users AS U
				JOIN Loans AS L
					ON L.UserID=U.UserID
			GROUP BY U.UserID, FirstName,LastName
            HAVING TotalLoans>2;

SELECT
	UserID,
	FirstName,
    LastName,
    TotalLoans
FROM TopReaders
ORDER BY TotalLoans DESC
LIMIT 5;

-- 9.
/*Librarians frequently need to check overdue loans. Instead of writing a complex
query every time, they need a persistent one to show all past-due loans.
They need the LoanIDs, Users' Names and Emails, LoanDate and DueDate for an intensive checking */
CREATE VIEW OverDueLoansView AS
	SELECT
		LoanID,
        FirstName,
        LastName,
        Email,
        LoanDate,
        DueDate
	FROM Loans AS L
		JOIN Users AS U
			ON U.UserID=L.UserID
	WHERE Status='Active'
		AND DueDate<CURRENT_DATE;

SELECT * FROM OverDueLoansView;

-- 10.
/*The curation team wants a breakdown of every genre they stock. For each genre, they want
to know the publication year of the oldest book they actually own a copy of, and the newest
book they own a copy of, to understand the historical spread of their inventory.*/
SELECT DISTINCT
	Genre,
    (	SELECT MIN(PublicationYear)
		FROM Books AS B_old
			JOIN Copies AS C
				ON C.BookID=B_old.BookID
		WHERE B_old.Genre=B.Genre) AS OldestCopy,
	(	SELECT MAX(PublicationYear)
		FROM Books AS B_new
			JOIN Copies AS C
				ON C.BookID=B_new.BookID
		WHERE B_new.Genre=B.Genre)  AS NewestCopy
FROM Books AS B;

-- 11.
/*To prevent users from hoarding books, the library has a strict rule:
a single user can only have a maximum of 3 active reservations at any given time.*/
DELIMITER //
CREATE TRIGGER PreventExcessiveReservations
BEFORE INSERT ON Reservations
FOR EACH ROW
BEGIN
	DECLARE ActiveReservations INT;
    
	SELECT COUNT(*) INTO ActiveReservations
    FROM Reservations
    WHERE UserID=NEW.UserID AND Status='Pending';
    
    IF ActiveReservations>=3 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='User has reached the maximum number of active reservations';
	END IF;
END 
//DELIMITER ;

INSERT INTO Reservations VALUES('R21', '2024-04-02', 'Pending', 'B03', '008');
INSERT INTO Reservations VALUES('R22', '2024-04-02', 'Pending', 'B10', '008');
SELECT COUNT(*) AS ActiveReservationForOne
FROM Reservations
WHERE UserID='008' AND Status='Pending';
INSERT INTO Reservations VALUES('R23', '2024-04-02', 'Pending', 'B11', '008');
	

-- 12.
/*When a new book arrives at the library, staff currently have to manually insert
the book record, find the new BookID, and then manually insert a copy record.
We need a Stored Procedure to automate this workflow into a single call.*/
DELIMITER //
CREATE PROCEDURE RegisterNewBookAndCopy(
	IN New_Title VARCHAR(30),
    IN New_PubYear INT,
    IN New_Genre VARCHAR(20),
    IN New_ISBN CHAR(13),
    IN New_AuthorID CHAR(3),
    IN New_Format VARCHAR(20)
)
BEGIN
	DECLARE New_BookID INT;
    INSERT INTO Books(Title, PublicationYear, Genre, ISBN, AuthorID)
		VALUES(New_Title, New_PubYear, New_Genre, New_ISBN, New_AuthorID);
	SET New_BookID=LAST_INSERT_ID();
    INSERT INTO Copies(ConditionStatus, Format, Status,BookID)
		VALUES('New',New_Format, 'Available', New_BookID);
END;
//DELIMITER ;