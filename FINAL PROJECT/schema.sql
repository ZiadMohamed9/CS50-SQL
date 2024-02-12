-- Represents employees of the organisation
CREATE TABLE IF NOT EXISTS "employees" (
    "id" INT,
    "name" TEXT NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "job_title" TEXT NOT NULL,
    "sup_id" INT,
    "dept_id" INT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("dept_id") REFERENCES "departments"("id")
);

-- Represents employee contact info
CREATE TABLE IF NOT EXISTS "emp_contacts" (
    "emp_id" INT,
    "contact_info" TEXT NOT NULL,
    "type" TEXT CHECK("type" IN('email', 'phone')),
    PRIMARY KEY("emp_id", "contact_info"),
    FOREIGN KEY("emp_id") REFERENCES "employees"("id")
);

-- Represents departments
CREATE TABLE IF NOT EXISTS "departments" (
    "id" INT,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "sup_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("sup_id") REFERENCES "employees"("id")
);

-- Represents the attendance log of employees
CREATE TABLE IF NOT EXISTS "attendance_log" (
    "id" INT,
    "emp_id" INT,
    "date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "clock_in" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "clock_out" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "notes" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("emp_id") REFERENCES "employees"("id")
);

-- Represents leave-requests made by employees
CREATE TABLE IF NOT EXISTS "leave_requests" (
    "id" INT,
    "emp_id" INT,
    "type" TEXT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "status" TEXT CHECK("status" IN('approved', 'rejected', 'pending')),
    "sup_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("emp_id") REFERENCES "employees"("id"),
    FOREIGN KEY("sup_id") REFERENCES "employees"("id")
);

-- Represents salaries of employees and their calculations
CREATE TABLE IF NOT EXISTS "salaries" (
    "id" INT,
    "emp_id" INT,
    "salary" INT CHECK(salary > 0),
    "bonus" INT CHECK(bonus >= 0),
    "deduction" INT CHECK(deduction >= 0),
    "payment_date" DATE NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("emp_id") REFERENCES "employees"("id")
);

-- Represents performance reviews of employees made by supervisors
CREATE TABLE IF NOT EXISTS "performance_reviews" (
    "id" INT,
    "emp_id" INT,
    "rating" INT CHECK(rating BETWEEN 0 AND 10),
    "feedback" TEXT,
    "goals" TEXT,
    "sup_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("emp_id") REFERENCES "employees"("id"),
    FOREIGN KEY("sup_id") REFERENCES "employees"("id")
);

-- Represents the accounts of employees
CREATE TABLE IF NOT EXISTS "users_accounts" (
    "id" INT
    "emp_id" INT,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "role" TEXT CHECK("role" IN('employee', 'manager', 'admin')),
    PRIMARY KEY("id"),
    FOREIGN KEY("emp_id") REFERENCES "employees"("id")
);

CREATE TABLE IF NOT EXISTS "users_accounts_log" (
    "id" INT,
    "action" TEXT,
    "old_username" TEXT,
    "new_username" TEXT,
    "old_password" TEXT,
    "new_password" TEXT,
    PRIMARY KEY("id")
);

-- Represents employee name, department name and job title
CREATE VIEW IF NOT EXISTS "emp_dept_jobtitle" AS
SElECT e.name, d.name, e.job_title
FROM employees AS e
JOIN departments AS d
ON e.dept_id = d.id;

-- Represents department and supervisor names 
CREATE VIEW IF NOT EXISTS "dept_sup" AS
SElECT d.name, e.name
FROM employees AS e 
JOIN departments AS d 
ON e.id = d.sup_id ;

-- Represents employee and attendance log
CREATE VIEW IF NOT EXISTS "emp_attenadnce" AS
SElECT e.name, a.date, a.clock_in, a.clock_out
FROM employees AS e
JOIN attendance_log AS a 
ON e.id = a.emp_id;

-- Represents employee and his salary details
CREATE VIEW IF NOT EXISTS "emp_salary" AS
SElECT e.name, s.salary, s.bonus, s.deduction
FROM employees AS e 
JOIN salaries AS s 
ON e.id = s.emp_id;

-- Indecies to speed common search
CREATE INDEX IF NOT EXISTS "emp_name_search" ON "employees" ("name");
CREATE INDEX IF NOT EXISTS "emp_id_search" ON "employees" ("id");
CREATE INDEX IF NOT EXISTS "emp_dept_search" ON "employees" ("dept_id");
CREATE INDEX IF NOT EXISTS "salary_emp_id_search" ON "salaries" ("emp_id");
CREATE INDEX IF NOT EXISTS "idx_leave_requests_emp_date" ON "leave_requests" ("emp_id", "start_date", "end_date");
CREATE INDEX IF NOT EXISTS "idx_performance_reviews_emp_sup" ON "performance_reviews" ("emp_id", "sup_id");

-- Triggers to protect data
CREATE TRIGGER "users_accounts_updates"
AFTER UPDATE ON "users_accounts"
FOR EACH ROW
BEGIN
    INSERT INTO "users_accounts_log" ("action", "old_username", "new_username", "old_password", "new_password")
    VALUES ('update', OLD."username", NEW."username", OLD."password", NEW."password");
END;

CREATE TRIGGER "users_accounts_deletes"
AFTER DELETE ON "users_accounts"
FOR EACH ROW
BEGIN
    INSERT INTO "users_accounts_log" ("action", "old_username", "new_username", "old_password", "new_password")
    VALUES ('delete', OLD."username", NULL, OLD."password", NULL);
END;

CREATE TRIGGER "users_accounts_inserts"
AFTER INSERT ON "users_accounts"
FOR EACH ROW
BEGIN
    INSERT INTO "users_accounts_log" ("action", "old_username", "new_username", "old_password", "new_password")
    VALUES ('insert', NULL, NEW."username", NULL, NEW."password");
END;
