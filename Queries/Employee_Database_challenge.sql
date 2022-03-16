-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name,
last_name,
title
INTO  unique_titles
FROM employee_retire
WHERE to_date = '9999-01-01'
ORDER BY emp_no, title DESC;

--combine tables
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO employee_retire
FROM employees as e
INNER JOIN titles as t 
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
ORDER BY emp_no

--filter unique titles by the number of title retiring
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC

--find all current employees eligible for mentorship
SELECT DISTINCT ON(emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no

SELECT * FROM titles
WHERE titles.emp_no = '10291'
