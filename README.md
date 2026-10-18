# Library Management System DBMS

A comprehensive relational database solution built to streamline library operations, optimize catalog management, and securely track user transactional data. This project covers the entire lifecycle of database creation, normalization up to 3NF, and advanced business intelligence analytics.

## 📌 Project Overview
* **Developer:** Amalia-Andreea Moisi
* **Program:** Computer Science
* **Tools Used:** MySQL Workbench & Lucidchart

## 🛠️ System Architecture
The system tracks detailed metadata and relationships across 6 core entities:
* **Users & Authors:** Registered clients and creative content entities.
* **Books & Copies:** Intellectual works mapped to distinct physical/digital units.
* **Loans & Reservations:** Transactional lifecycles managing borrows, due dates, and item holds.

### Relational Schema (3NF)
Designed strictly to eliminate update, insertion, and deletion anomalies:
* `Users` ( **UserID**, FirstName, LastName, Email, JoinDate, Address )
* `Authors` ( **AuthorID**, Name, Biography, Nationality )
* `Books` ( **BookID**, Title, PublicationYear, Genre, ISBN, *AuthorID* )
* `Copies` ( **CopyID**, ConditionStatus, Format, Status, *BookID* )
* `Loans` ( **LoanID**, LoanDate, DueDate, Status, *UserID* )
* `Reservations` ( **ReservationID**, ReservationDate, Status, *BookID*, *UserID* )
* `Loan_Copy` ( **_LoanID_**, **_CopyID_** )

## ⚡ Advanced Database Features
The source script moves beyond basic CRUD operations to feature production-level automation:
1. **Business Intelligence Queries:** Advanced data analytics including loyalty ranking (`DENSE_RANK()`), reading preferences (`AVG()`), and multi-table entity joins.
2. **Automated Stored Procedures:** A two-step transactional book intake workflow (`RegisterNewBookAndCopy`) utilizing `LAST_INSERT_ID()`.
3. **Data Integrity Triggers:** A proactive business rules enforcement safety mechanism (`PreventExcessiveReservations`) that restricts users to a maximum of 3 concurrent active reservations.
4. **Performance Tuning Analysis:** Architectural evaluation of execution bottlenecks under massive scale, discussing full table scan mitigations, subquery refactoring, and indexing strategies.

## 🚀 How to Run the Project
1. Open **MySQL Workbench** (or your preferred SQL client).
2. Copy and execute the contents of the main `.sql` script inside this repository to automatically construct the schema, configure constraints, load mock data, and test the analysis queries.
