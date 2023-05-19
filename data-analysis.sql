-- Data Analysis Questions
-- List the employee number, last name, first name, sex, and salary of each employee:

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,e.sex
	,s.salary
FROM
	employees AS e
	INNER JOIN salaries AS s ON s.emp_no = e.emp_no
;

-- List the first name, last name, and hire date for the employees who were hired in 1986:

SELECT
	emp_no
	,last_name
	,first_name
	,hire_date
FROM employees
WHERE hire_date LIKE '%1986'
;

-- List the manager of each department along with their department number, department name,
-- employee number, last name, and first name:

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_no
	,d.dept_name
FROM
	employees AS e
	INNER JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
	INNER JOIN departments AS d ON d.dept_no = dm.dept_no
;

-- List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B

SELECT
	first_name
	,last_name
	,sex
FROM employees
WHERE
	first_name LIKE 'Hercules' 
	AND last_name LIKE 'B%'
;

-- List each employee in the Sales department, including their employee number, last name,
-- and first name

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
FROM
	employees AS e
	INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
	INNER JOIN departments AS d ON d.dept_no = de.dept_no
WHERE
	d.dept_name LIKE 'Sales'
;

-- List each employee in the Sales and Development departments, including their employee 
-- number, last name, first name, and department name

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name
FROM
	employees AS e
	INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
	INNER JOIN departments AS d ON d.dept_no = de.dept_no
WHERE
	d.dept_name LIKE 'Sales'
	OR d.dept_name LIKE 'Development'
;

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)

SELECT 
	last_name
	,COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC
;