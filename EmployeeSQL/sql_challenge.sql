---Import Titles first and so on in order to populate foreign keys with existing data

CREATE TABLE titles(
	title_id VARCHAR(64) PRIMARY KEY,
	title VARCHAR(64)
);

CREATE TABLE employees(
	emp_no VARCHAR(64) PRIMARY KEY,
	emp_title_id VARCHAR(64),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(64),
	first_name VARCHAR(64),
	last_name VARCHAR(64),
	sex VARCHAR(64),
	hire_date DATE
);

CREATE TABLE departments(
	dept_no VARCHAR(64) PRIMARY KEY,
	dept_name VARCHAR(64)
);


CREATE TABLE dept_emp(
	emp_no VARCHAR(64),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(64),
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(64),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no VARCHAR(64),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE salaries(
	id SERIAL PRIMARY KEY,
	emp_no VARCHAR(64),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER
	
)

SELECT * FROM employees;
SELECT * FROM salaries;
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s 
ON e.emp_no = s.emp_no;

SELECT first_name,last_name, hire_date FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

/*
Checking that data-types were imported correctly for my own sanity
SELECT COLUMN_NAME,
       DATA_TYPE,
	   IS_NULLABLE,
       CHARACTER_MAXIMUM_LENGTH,
       NUMERIC_PRECISION,
       NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='employees';
*/

-- List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.


--SELECT * FROM dept_manager
--SELECT * FROM departments


SELECT dm.dept_no, d.dept_name, dm.emp_no,e.last_name,e.first_name
FROM dept_manager dm
LEFT JOIN departments d
ON dm.dept_no = d.dept_no 
LEFT JOIN employees e
on dm.emp_no = e.emp_no;


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT * FROM dept_emp

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp ed
ON e.emp_no = ed.emp_no
LEFT JOIN departments d
ON ed.dept_no = d.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees e
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp ed
ON e.emp_no = ed.emp_no
LEFT JOIN departments d
ON ed.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp ed
ON e.emp_no = ed.emp_no
LEFT JOIN departments d
ON ed.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name='Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT(employees.last_name) AS "last name frequency"
	FROM employees
	GROUP BY last_name
	ORDER BY "last name frequency" DESC;
	
