# sql-challenge
In this challenge PostgreSQL and Jupyter Notebook were used to engineer a database and analyze the data.

----Part 1------

Using PostgreSQL via the pgAdmin4 app tables for a company's departments, department employees, department mangers, employees, salaries, and titles were created and populated with primary and foreign keys where the data could be linked between tables.  See "ERD_employeeSQL.png" and "employee_schema.sql" for more detail on the tables, attributes, and keys that were created.

Queries were written for the following useful data documented in "employee_queries.sql":

    1) The following details of each employee: employee number, last name, first name, sex, and salary
    
    2) First name, last name, and hire date for employees who were hired in 1986

    3) The manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

    4) The department of each employee with the following information: employee number, last name, first name, and department name.

    5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

    6) List all employees in the Sales department, including their employee number, last name, first name, and department name.

    7) All employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

    8) In descending order, the frequency count of employee last names, i.e., how many employees share each last name.

----Part 2----

The data was then imported from PostgreSQL and analyzed further in Jupyter Notebook using sqlalchemy, pandas, and matplotlib to import, manipulate, and visualize the data.  A histogram "salary_histogram.PNG" was created to show groupings of salary ranges and a bar chart "salaries_by_title.png" shows the average salary of each position title at the company.

The exercise premise supposed that the analyst's boss had created a fake database to test the analyst, and it is revealed that his employee id corresponds to the name "April Foolsday." 