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
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
	);

select * from departments;
select * from employees;
select * from salaries;
select * from titles;
select * from dept_manager;
select * from dept_emp;

DROP TABLE titles CASCADE;

CREATE TABLE IF NOT EXISTS titles (
	emp_no INT NOT NULL,
	tital varchar NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);
	
SELECT 	* FROM titles;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE titles CASCADE;

CREATE TABLE IF NOT EXISTS titles (
	emp_no INT NOT NULL,
	title varchar NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, title, from_date)
	);

SELECT * FROM titles;

DROP TABLE retirement_info;


SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- joining table query
SELECT departments.dept_no,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no=dept_emp.emp_no;


SELECT re.emp_no,
	re.first_name,
	re.last_name,
	de.to_date
FROM retirement_info AS re
LEFT JOIN dept_emp AS de
ON re.emp_no=de.emp_no;


SELECT d.dept_no,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no;

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date <'2022-01-01';

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')
;

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp AS ce
LEFT JOIN dept_emp AS de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp AS ce
LEFT JOIN dept_emp AS de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT COUNT(ce.emp_no), de.dept_no
INTO retire_emp_count
FROM current_emp AS ce
LEFT JOIN dept_emp AS de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM retire_emp_count;

SELECT * FROM salaries;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT * FROM emp_info;

DROP TABLE emp_info CASCADE;

SELECT emp_no, 
	first_name, 
	last_name,
	gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no=s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date= '9999-01-01');

-- List of manager per depratment

SELECT 	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
ON (dm.emp_no = ce.emp_no);
	
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp AS ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

select * from retirement_info;

select * from dept_info
where dept_name = 'Sales' OR dept_name = 'Development';

select * from dept_info
where dept_name IN ('Sales', 'Development');