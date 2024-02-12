-- Inserting a new employee

INSERT INTO employees (id, name, date_of_birth, job_title, sup_id, dept_id)
VALUES (1, 'John Doe', '1990-05-15', 'Software Engineer', NULL, 1);


-- Inserting employee contact info

INSERT INTO emp_contacts (emp_id, contact_info, type)
VALUES (1, 'john@example.com', 'email');


-- Inserting a new department

INSERT INTO departments (id, name, location, sup_id)
VALUES (1, 'Engineering', 'Headquarters', NULL);


-- Inserting attendance log

INSERT INTO attendance_log (id, emp_id, date, clock_in, clock_out, notes)
VALUES (1, 1, '2024-02-05', '08:00:00', '17:00:00', 'Regular work hours');


-- Inserting a leave request

INSERT INTO leave_requests (id, emp_id, type, start_date, end_date, status, sup_id)
VALUES (1, 1, 'Vacation', '2024-03-01', '2024-03-05', 'pending', NULL);


-- Inserting salary details

INSERT INTO salaries (id, emp_id, salary, bonus, deduction, payment_date)
VALUES (1, 1, 60000, 5000, 2000, '2024-02-28');


-- Inserting a performance review

INSERT INTO performance_reviews (id, emp_id, rating, feedback, goals, sup_id)
VALUES (1, 1, 8, 'Good performance overall', 'Improve communication skills', NULL);


-- Inserting user account

INSERT INTO users_accounts (id, emp_id, username, password, role)
VALUES (1, 1, 'johndoe', 'password123', 'employee');


-- Updating employee's job title

UPDATE employees
SET job_title = 'Senior Software Engineer'
WHERE id = 1;


-- Updating employee's contact info

UPDATE emp_contacts
SET contact_info = 'john.doe@example.com'
WHERE emp_id = 1;


-- Updating salary details

UPDATE salaries
SET salary = 65000, bonus = 6000, deduction = 2500
WHERE emp_id = 1;


-- Deleting an employee

DELETE FROM employees
WHERE id = 1;


-- Deleting an employee's contact info

DELETE FROM emp_contacts
WHERE emp_id = 1;


-- Deleting a leave request

DELETE FROM leave_requests
WHERE id = 1;


-- Deleting a user account

DELETE FROM users_accounts
WHERE id = 1;


-- Selecting all employees

SELECT * FROM employees;


-- Selecting employee's contact info

SELECT * FROM emp_contacts WHERE emp_id = 1;


-- Selecting all departments

SELECT * FROM departments;


-- Selecting attendance log

SELECT * FROM attendance_log WHERE emp_id = 1;


-- Selecting leave requests for a specific employee

SELECT * FROM leave_requests WHERE emp_id = 1;


-- Selecting salary details for an employee

SELECT * FROM salaries WHERE emp_id = 1;


-- Selecting performance reviews for an employee

SELECT * FROM performance_reviews WHERE emp_id = 1;


-- Selecting user account details for an employee

SELECT * FROM users_accounts WHERE emp_id = 1;