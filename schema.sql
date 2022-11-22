-- Create table for departments for PH-EmployeeDB
CREATE TABLE IF NOT EXISTS departments (
		dept_no varchar(4) NOT NULL,
		dept_name varchar(40) NOT NULL,
		PRIMARY KEY (dept_no),
		UNIQUE (dept_name)
		);
		
		
-- CREATE TABLE FOR EMPLOYEES
CREATE TABLE IF NOT EXISTS Employees (
		emp_no int PRIMARY KEY UNIQUE NOT NULL,
		birth_date date,
		first_name varchar NOT NULL,
		last_name varchar NOT NULL,
		gender varchar NOT NULL,
		hire_date date NOT NULL
		);
		
-- CREATE DEPARTMENT MANGAER TABLE
CREATE TABLE IF NOT EXISTS dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
    PRIMARY KEY (emp_no, dept_no)
);

-- CREATE DEPARTMENT EMPLOYEE TABLE
CREATE TABLE IF NOT EXISTS dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
    PRIMARY KEY (emp_no, dept_no)
);
-- CREATE TABLE FOR EMP. SALARIY
CREATE TABLE IF NOT EXISTS salaries (
	emp_no INT NOT NULL,
	salaries int NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
	);
	
-- CREATE TABLE FOR EMP. SALARIY
CREATE TABLE IF NOT EXISTS salaries (
	emp_no INT NOT NULL,
	salaries int NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
	);

-- CREATE TABLE TITLES
CREATE TABLE IF NOT EXISTS titles (
	emp_no INT NOT NULL,
	tital varchar NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);




