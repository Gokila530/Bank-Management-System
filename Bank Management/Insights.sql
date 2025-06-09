create database Bank_Management;
use  bank_management;

#creating customers table
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `alt_phone` varchar(15) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#inserting customers values
INSERT INTO `customers` VALUES (1,'Rahul','Kumar','Sharma','rahul@example.com','9876543210',NULL,'Mumbai'),(2,'Priya',NULL,'Patel','priya@example.com','9876543211','9876543212','Delhi'),(3,'Amit','Ramesh','Verma','amit@example.com','9876543213',NULL,'Bangalore'),(4,'Sneha',NULL,'Singh','sneha@example.com','9876543214',NULL,'Hyderabad'),(5,'Vikram','Raj','Gupta','vikram@example.com','9876543215','9876543216','Chennai'),(6,'Anjali','Priya','Mehta','anjali@example.com','9876543217',NULL,'Kolkata'),(7,'Ravi',NULL,'Joshi','ravi@example.com','9876543218','9876543219','Pune'),(8,'Neha','Sunil','Malhotra','neha@example.com','9876543220',NULL,'Ahmedabad'),(9,'Sanjay',NULL,'Reddy','sanjay@example.com','9876543221',NULL,'Jaipur'),(10,'Pooja','Anil','Desai','pooja@example.com','9876543222','9876543223','Lucknow'),(11,'Arun',NULL,'Iyer','arun@example.com','9876543224',NULL,'Chandigarh'),(12,'Kavita','Vijay','Rao','kavita@example.com','9876543225','9876543226','Bhopal'),(13,'Rajesh',NULL,'Thakur','rajesh@example.com','9876543227',NULL,'Surat'),(14,'Swati','Mohan','Chopra','swati@example.com','9876543228','9876543229','Nagpur'),(15,'Alok',NULL,'Bansal','alok@example.com','9876543230',NULL,'Indore'),(16,'Meera','Prakash','Srivastava','meera@example.com','9876543231','9876543232','Patna'),(17,'Vivek',NULL,'Dubey','vivek@example.com','9876543233',NULL,'Coimbatore'),(18,'Anita','Suresh','Shukla','anita@example.com','9876543234','9876543235','Visakhapatnam'),(19,'Rohan',NULL,'Gandhi','rohan@example.com','9876543236',NULL,'Thane'),(20,'Divya','Rajat','Sinha','divya@example.com','9876543237','9876543238','Agra');

# create branches table

CREATE TABLE `branches` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#inserting branches values
INSERT INTO `branches` VALUES (1,'Kotak Mumbai Main','Mumbai'),(2,'Kotak Delhi Central','Delhi'),(3,'Kotak Bangalore Tech','Bangalore'),(4,'Kotak Hyderabad City','Hyderabad'),(5,'Kotak Chennai Coast','Chennai'),(6,'Kotak Kolkata East','Kolkata'),(7,'Kotak Pune West','Pune'),(8,'Kotak Ahmedabad North','Ahmedabad'),(9,'Kotak Jaipur Heritage','Jaipur'),(10,'Kotak Lucknow Central','Lucknow'),(11,'Kotak Chandigarh Sector 17','Chandigarh'),(12,'Kotak Bhopal Lakeview','Bhopal'),(13,'Kotak Surat Diamond','Surat'),(14,'Kotak Nagpur Orange','Nagpur'),(15,'Kotak Indore Trade','Indore'),(16,'Kotak Patna Historic','Patna'),(17,'Kotak Coimbatore Textile','Coimbatore'),(18,'Kotak Vizag Port','Visakhapatnam'),(19,'Kotak Thane Suburban','Thane'),(20,'Kotak Agra Taj','Agra');

# creating accounts table
CREATE TABLE `accounts` (
  `account_number` varchar(20) NOT NULL,
  `customer_id` int NOT NULL,
  `account_type` enum('Savings','Current','FD') NOT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `branch_id` int DEFAULT NULL,
  `opened_date` date NOT NULL,
  PRIMARY KEY (`account_number`),
  KEY `customer_id` (`customer_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#inserting accounts table

INSERT INTO `accounts` VALUES ('KOTAK123456',1,'Savings',50000.00,1,'2020-01-15'),('KOTAK123457',2,'Current',120000.00,NULL,'2021-05-20'),('KOTAK123458',3,'FD',200000.00,3,'2022-03-10'),('KOTAK123459',4,'Savings',75000.00,4,'2019-11-25'),('KOTAK123460',5,'Current',90000.00,NULL,'2020-08-14'),('KOTAK123461',6,'Savings',30000.00,6,'2021-07-30'),('KOTAK123462',7,'FD',150000.00,7,'2022-02-05'),('KOTAK123463',8,'Savings',60000.00,8,'2020-09-12'),('KOTAK123464',9,'Current',180000.00,NULL,'2019-04-18'),('KOTAK123465',10,'Savings',45000.00,10,'2021-12-01'),('KOTAK123466',11,'FD',250000.00,11,'2022-06-15'),('KOTAK123467',12,'Savings',55000.00,12,'2020-03-22'),('KOTAK123468',13,'Current',80000.00,NULL,'2021-08-10'),('KOTAK123469',14,'Savings',35000.00,14,'2019-10-05'),('KOTAK123470',15,'FD',300000.00,15,'2022-04-20'),('KOTAK123471',16,'Savings',70000.00,16,'2020-11-15'),('KOTAK123472',17,'Current',95000.00,NULL,'2021-09-25'),('KOTAK123473',18,'Savings',40000.00,18,'2019-06-30'),('KOTAK123474',19,'FD',175000.00,19,'2022-07-05'),('KOTAK123475',20,'Savings',48000.00,20,'2020-12-12');

#creating loans table
CREATE TABLE `loans` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('Personal','Home','Car') NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#inserting loans table

INSERT INTO `loans` VALUES (1,1,500000.00,'Home','Approved','2022-01-10','2027-01-10'),(2,2,200000.00,'Personal','Pending','2022-05-15',NULL),(3,3,300000.00,'Car','Approved','2022-03-20','2025-03-20'),(4,4,1000000.00,'Home','Pending','2022-07-01',NULL),(5,5,150000.00,'Personal','Rejected','2022-02-05',NULL),(6,6,400000.00,'Home','Approved','2022-04-12','2032-04-12'),(7,7,250000.00,'Car','Pending','2022-06-20',NULL),(8,8,600000.00,'Home','Approved','2022-08-15','2030-08-15'),(9,9,100000.00,'Personal','Pending','2022-09-10',NULL),(10,10,350000.00,'Car','Approved','2022-10-05','2026-10-05'),(11,11,700000.00,'Home','Pending','2022-11-20',NULL),(12,12,180000.00,'Personal','Approved','2022-12-01','2024-12-01'),(13,13,220000.00,'Car','Rejected','2023-01-15',NULL),(14,14,800000.00,'Home','Approved','2023-02-10','2033-02-10'),(15,15,120000.00,'Personal','Pending','2023-03-05',NULL),(16,16,450000.00,'Car','Approved','2023-04-20','2028-04-20'),(17,17,950000.00,'Home','Pending','2023-05-12',NULL),(18,18,160000.00,'Personal','Approved','2023-06-01','2025-06-01'),(19,19,280000.00,'Car','Pending','2023-07-10',NULL),(20,20,550000.00,'Home','Approved','2023-08-05','2035-08-05');

#creating employees table
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#inserting employees values
INSERT INTO `employees` VALUES (1,'Aarav','Shah',1,'Manager',75000.00,'2018-01-15'),(2,'Isha','Patil',2,'Clerk',35000.00,'2020-03-22'),(3,'Rohan','Mehta',3,NULL,42000.00,'2019-07-10'),(4,'Priya','Singh',4,'Loan Officer',50000.00,'2021-05-05'),(5,'Vijay','Kumar',5,NULL,NULL,'2022-01-30'),(6,'Anaya','Desai',6,'Clerk',32000.00,'2020-11-12'),(7,'Karan','Joshi',7,'Manager',78000.00,'2017-09-18'),(8,'Sanya','Reddy',8,'Clerk',34000.00,'2021-08-25'),(9,'Rahul','Verma',9,NULL,45000.00,'2019-04-14'),(10,'Neha','Iyer',10,'Loan Officer',52000.00,'2020-06-09'),(11,'Arjun','Malhotra',11,'Manager',76000.00,'2018-12-01'),(12,'Mira','Gupta',12,'Clerk',33000.00,'2022-02-15'),(13,'Amit','Sharma',13,NULL,NULL,'2021-03-20'),(14,'Pooja','Rao',14,'Clerk',31000.00,'2020-07-07'),(15,'Vikram','Thakur',15,'Manager',77000.00,'2016-10-10'),(16,'Anjali','Dubey',16,NULL,48000.00,'2019-11-21'),(17,'Raj','Sinha',17,'Clerk',34000.00,'2021-09-05'),(18,'Sunita','Chopra',18,'Loan Officer',51000.00,'2020-04-18'),(19,'Alok','Bansal',19,'Manager',79000.00,'2015-08-30'),(20,'Kiran','Srivastava',20,'Clerk',32000.00,'2022-05-12');

#creating transaction table
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_number` varchar(20) NOT NULL,
  `type` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `related_account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_number` (`account_number`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `accounts` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#inserting transaction values
INSERT INTO `transactions` VALUES (1,'KOTAK123456','Deposit',10000.00,'2025-03-16 10:52:52',NULL),(2,'KOTAK123457','Withdrawal',5000.00,'2025-03-16 10:52:52',NULL),(3,'KOTAK123458','Transfer',20000.00,'2025-03-16 10:52:52','KOTAK123456'),(4,'KOTAK123459','Deposit',15000.00,'2025-03-16 10:52:52',NULL),(5,'KOTAK123460','Transfer',10000.00,'2025-03-16 10:52:52','KOTAK123457'),(6,'KOTAK123461','Withdrawal',3000.00,'2025-03-16 10:52:52',NULL),(7,'KOTAK123462','Deposit',50000.00,'2025-03-16 10:52:52',NULL),(8,'KOTAK123463','Transfer',12000.00,'2025-03-16 10:52:52','KOTAK123460'),(9,'KOTAK123464','Withdrawal',8000.00,'2025-03-16 10:52:52',NULL),(10,'KOTAK123465','Deposit',7000.00,'2025-03-16 10:52:52',NULL),(11,'KOTAK123466','Transfer',25000.00,'2025-03-16 10:52:52','KOTAK123462'),(12,'KOTAK123467','Withdrawal',4500.00,'2025-03-16 10:52:52',NULL),(13,'KOTAK123468','Deposit',9000.00,'2025-03-16 10:52:52',NULL),(14,'KOTAK123469','Transfer',6000.00,'2025-03-16 10:52:52','KOTAK123465'),(15,'KOTAK123470','Withdrawal',10000.00,'2025-03-16 10:52:52',NULL),(16,'KOTAK123471','Deposit',12000.00,'2025-03-16 10:52:52',NULL),(17,'KOTAK123472','Transfer',15000.00,'2025-03-16 10:52:52','KOTAK123470'),(18,'KOTAK123473','Withdrawal',2000.00,'2025-03-16 10:52:52',NULL),(19,'KOTAK123474','Deposit',30000.00,'2025-03-16 10:52:52',NULL),(20,'KOTAK123475','Transfer',8000.00,'2025-03-16 10:52:52','KOTAK123473');

#1. List customers with a missing middle name.

SELECT customer_id, first_name, last_name
FROM Customers
WHERE middle_name IS NULL;

#2. Find accounts with a balance greater than ₹1,00,000.

SELECT account_number, balance
FROM Accounts
WHERE balance > 100000;

#3. Show employees with an undefined position (NULL).

SELECT employee_id, first_name, last_name
FROM Employees
WHERE position IS NULL;

#4. Count the number of approved loans.

SELECT COUNT(*) AS approved_loans
FROM Loans
WHERE status = 'Approved';

#5. List transactions of type 'Deposit'.

SELECT transaction_id, account_number, amount
FROM Transactions
WHERE type = 'Deposit';

#6. Find branches in Mumbai.

SELECT * FROM Branches
WHERE location LIKE '%Mumbai%';

#7. Calculate the average salary of employees.

SELECT AVG(salary) AS avg_salary
FROM Employees;

#8. List customers with alternate phone numbers (non-NULL).

SELECT customer_id, first_name, phone, alt_phone
FROM Customers
WHERE alt_phone IS NOT NULL;

#9. Show FD accounts opened after 2022-01-01.

SELECT account_number, opened_date
FROM Accounts
WHERE account_type = 'FD' AND opened_date > '2022-01-01';

#10. Find loans with no end date (NULL).

SELECT loan_id, customer_id, amount
FROM Loans
WHERE end_date IS NULL;

#11. Count transactions involving transfers.

SELECT COUNT(*) AS total_transfers
FROM Transactions
WHERE type = 'Transfer';

#12. List employees hired in 2022.

SELECT employee_id, first_name, hire_date
FROM Employees
WHERE YEAR(hire_date) = 2022;

#13. Find the highest account balance.

SELECT MAX(balance) AS max_balance
FROM Accounts;

#14. List customers from Delhi or Mumbai.

SELECT customer_id, first_name, address
FROM Customers
WHERE address LIKE '%Delhi%' OR address LIKE '%Mumbai%';

#15. Show loans with amounts between ₹2,00,000 and ₹5,00,000.

SELECT loan_id, customer_id, amount
FROM Loans
WHERE amount BETWEEN 200000 AND 500000;

#16. List customers with their account numbers and types.

SELECT c.first_name, a.account_number, a.account_type
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

#17. Show transactions with customer names.

SELECT t.transaction_id, c.first_name, t.amount
FROM Transactions t
JOIN Accounts a ON t.account_number = a.account_number
JOIN Customers c ON a.customer_id = c.customer_id;

#18. Find employees and their branch locations.

SELECT e.first_name, b.branch_name
FROM Employees e
LEFT JOIN Branches b ON e.branch_id = b.branch_id;

#19. List approved loans with customer details.

SELECT c.first_name, l.amount, l.type
FROM Loans l
JOIN Customers c ON l.customer_id = c.customer_id
WHERE l.status = 'Approved';

#20. Calculate total deposits per account.

SELECT a.account_number, SUM(t.amount) AS total_deposits
FROM Transactions t
JOIN Accounts a ON t.account_number = a.account_number
WHERE t.type = 'Deposit'
GROUP BY a.account_number;

#21. Show branches with no employees.

SELECT b.branch_name
FROM Branches b
LEFT JOIN Employees e ON b.branch_id = e.branch_id
WHERE e.employee_id IS NULL;

#22. List customers with their total account balances.

SELECT c.customer_id, c.first_name, SUM(a.balance) AS total_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id;

#23. Find transactions with recipient account details (for transfers).

SELECT t.transaction_id, a.account_type AS recipient_type
FROM Transactions t
LEFT JOIN Accounts a ON t.related_account = a.account_number
WHERE t.type = 'Transfer';

#24. Show employees earning more than their branch’s average salary.

SELECT e1.first_name, e1.salary
FROM Employees e1
JOIN (
SELECT branch_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY branch_id
) e2 ON e1.branch_id = e2.branch_id
WHERE e1.salary > e2.avg_salary;

#25. List customers with active loans and their loan types.

SELECT c.first_name, l.type
FROM Customers c
JOIN Loans l ON c.customer_id = l.customer_id
WHERE l.status = 'Approved';

#26. Find accounts with no transactions.

SELECT a.account_number
FROM Accounts a
LEFT JOIN Transactions t ON a.account_number = t.account_number
WHERE t.transaction_id IS NULL;

#27. Show the latest transaction for each account.

SELECT a.account_number, MAX(t.transaction_date) AS latest_transaction
FROM Accounts a
LEFT JOIN Transactions t ON a.account_number = t.account_number
GROUP BY a.account_number;

#28. List branches with total employee salaries.

SELECT b.branch_name, SUM(e.salary) AS total_salary
FROM Branches b
LEFT JOIN Employees e ON b.branch_id = e.branch_id
GROUP BY b.branch_id;

#29. Find customers with both Savings and FD accounts.

SELECT c.customer_id, c.first_name
FROM Customers c
JOIN Accounts a1 ON c.customer_id = a1.customer_id AND a1.account_type = 'Savings'
JOIN Accounts a2 ON c.customer_id = a2.customer_id AND a2.account_type = 'FD';

#30. List employees and their managers (if manager_id exists). (Add a manager_id column to the Employees table first.)

SELECT e1.first_name AS employee, e2.first_name AS manager
FROM Employees e1
LEFT JOIN Employees e2 ON e1.manager_id = e2.employee_id;

#31.Rank customers by balance (highest to lowest)

SELECT 
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
  a.balance,
  RANK() OVER (ORDER BY a.balance DESC) AS balance_rank
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id;

#32.Get the running total of transaction amounts per account

SELECT 
  account_number,
  transaction_id,
  amount,
  SUM(amount) OVER (PARTITION BY account_number ORDER BY transaction_id) AS running_total
FROM transactions;

#33.Get the average balance per branch and customer balance compared to branch average

SELECT 
  b.branch_name,
  a.account_number,
  a.balance,
  ROUND(AVG(a.balance) OVER (PARTITION BY b.branch_id), 2) AS branch_avg_balance
FROM accounts a
JOIN branches b ON a.branch_id = b.branch_id;

#34. Procedure to get all accounts of a customer by their email

DELIMITER $$

CREATE PROCEDURE GetCustomerAccountsByEmail(IN customerEmail VARCHAR(100))
BEGIN
  SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_number,
    a.account_type,
    a.balance,
    a.opened_date
  FROM customers c
  JOIN accounts a ON c.customer_id = a.customer_id
  WHERE c.email = customerEmail;
END $$

DELIMITER ;

CALL GetCustomerAccountsByEmail('rahul@example.com');

#35.Procedure to deposit money into an account

DELIMITER $$

CREATE PROCEDURE DepositAmount(IN acc_num VARCHAR(20), IN amt DECIMAL(10,2))
BEGIN
  UPDATE accounts 
  SET balance = balance + amt 
  WHERE account_number = acc_num;

  INSERT INTO transactions(account_number, type, amount, transaction_date)
  VALUES (acc_num, 'Deposit', amt, NOW());
END $$

DELIMITER ;

CALL DepositAmount('KOTAK123456', 5000.00);

#36.Trigger to automatically update balance after transaction

DELIMITER $$

CREATE TRIGGER update_balance_after_transaction
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
  IF NEW.type = 'Deposit' THEN
    UPDATE accounts 
    SET balance = balance + NEW.amount 
    WHERE account_number = NEW.account_number;

  ELSEIF NEW.type = 'Withdrawal' THEN
    UPDATE accounts 
    SET balance = balance - NEW.amount 
    WHERE account_number = NEW.account_number;

  ELSEIF NEW.type = 'Transfer' THEN
    UPDATE accounts 
    SET balance = balance - NEW.amount 
    WHERE account_number = NEW.account_number;

    UPDATE accounts 
    SET balance = balance + NEW.amount 
    WHERE account_number = NEW.related_account;
  END IF;
END $$

DELIMITER ;





