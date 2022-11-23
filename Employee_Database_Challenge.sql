-- Retrieve the emp_no, names and titles between brith date 1952 to 1955

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	te.title,
	te.from_Date,
	te.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS te
ON e.emp_no = te.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- RETRIEVE THE DISTINCT DATA

SELECT 	DISTINCT ON (emp_no) emp_no,
					first_name,
					last_name,
					title
INTO unique_titles
FROM retirement_titles
WHERE to_date= '9999-01-01'
ORDER BY emp_no;

-- RETRIEVE TOTAL TITLES NUMBERS BY GROUP

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

-- RETRIEVE EMP. ELIGIBLE DATA FOR EMNTORSHIP PROGRAM

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	d.from_Date,
	d.to_date,
	te.title
INTO mentorship_eligibilty 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN titles AS te
ON e.emp_no = te.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (te.to_date= '9999-01-01')
ORDER BY e.emp_no;

-- RETIREVE THE TOTAL MENTORSHIP COUNT

SELECT COUNT(emp_no),
			title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY count(emp_no) DESC;
