-- FICTIONAL PRACTICE DATASET — AI-ASSISTED PORTFOLIO EXERCISE
-- MySQL 8.0: illustrative support-ticket data, not real employee records.
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (employee_id INT PRIMARY KEY, full_name VARCHAR(100) NOT NULL);
CREATE TABLE tickets (
 ticket_id INT PRIMARY KEY,
 employee_id INT NOT NULL,
 category VARCHAR(40) NOT NULL,
 priority VARCHAR(12) NOT NULL,
 status VARCHAR(20) NOT NULL,
 created_at DATE NOT NULL,
 resolved_at DATE NULL,
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);
INSERT INTO employees VALUES
(1,'Alex Example'),(2,'Jamie Example'),(3,'Taylor Example'),(4,'Morgan Example');
INSERT INTO tickets VALUES
(101,1,'Account','High','Open','2026-09-01',NULL),
(102,2,'Hardware','Low','Resolved','2026-09-02','2026-09-04'),
(103,3,'Network','High','In progress','2026-09-03',NULL),
(104,4,'Software','Medium','Resolved','2026-09-04','2026-09-05'),
(105,2,'Account','Medium','Open','2026-09-05',NULL),
(106,1,'Software','Low','Resolved','2026-09-06','2026-09-08'),
(107,4,'Network','High','Open','2026-09-07',NULL),
(108,3,'Hardware','Medium','In progress','2026-09-08',NULL),
(109,2,'Account','Low','Resolved','2026-09-09','2026-09-11'),
(110,4,'Software','High','In progress','2026-09-10',NULL),
(111,1,'Network','Medium','Open','2026-09-11',NULL),
(112,3,'Hardware','Low','Resolved','2026-09-12','2026-09-13');
-- Q1: Outstanding requests by category
SELECT category, COUNT(*) AS open_count FROM tickets
WHERE status <> 'Resolved' GROUP BY category ORDER BY open_count DESC;
-- Q2: High-priority outstanding requests
SELECT COUNT(*) AS high_priority_open FROM tickets
WHERE priority = 'High' AND status <> 'Resolved';
-- Q3: Resolution time, by category (for resolved requests only)
SELECT category, ROUND(AVG(DATEDIFF(resolved_at, created_at)),1) AS avg_days_to_resolve
FROM tickets WHERE status = 'Resolved' AND resolved_at IS NOT NULL
GROUP BY category ORDER BY avg_days_to_resolve DESC;
