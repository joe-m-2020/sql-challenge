CREATE TABLE titles(
	title_id VARCHAR(64) PRIMARY KEY
	title VARCHAR(64)
);

CREATE TABLE employees(
	emp_no VARCHAR(64) PRIMARY KEY
	emp_title_id VARCHAR(64)
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	birth_date VARCHAR(64)
	first_name VARCHAR(64)
	last_name VARCHAR(64)
	sex VARCHAR(64)
	hire_date DATE
);

CREATE TABLE departments(
	dept_no VARCHAR(64) PRIMARY KEY
	dept_name VARCHAR(64)
);

CREATE TABLE titles(
	title_id VARCHAR(64) PRIMARY KEY
	title VARCHAR(64)
);

CREATE TABLE dept_emp(
	emp_no VARCHAR(64)
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
	dept_no VARCHAR(64)
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(64)
	FOREIGN KEY (dept_no) REFERENCES departments(dpt_no)
	emp_no
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	PRIMARY KEY dept_no_emp_no
);

CREATE TABLE salaries(
	emp_no VARCHAR(64)
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	salary INTEGER PRIMARY KEY
)



