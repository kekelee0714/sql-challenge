--1.List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM public."Employees" AS e
INNER JOIN public."Salaries" AS s ON 
e.emp_no = s.emp_no

-- 2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM public."Employees" 
WHERE  EXTRACT('year' FROM hire_date) = 1986
AND    hire_date >= '1986-01-01'
AND    hire_date <=  '1986-12-31'
ORDER  BY hire_date DESC;

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM public."Departments" AS d
INNER JOIN public."Dept_manager" AS dm ON
d.dept_no=dm.dept_no
INNER JOIN public."Employees" AS e ON
e.emp_no=dm.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Employees" AS e
INNER JOIN public."Dept_emp" AS de ON
e.emp_no=de.emp_no
INNER JOIN public."Departments" AS d ON
d.dept_no=de.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"

SELECT first_name, last_name, sex
FROM public."Employees" 
WHERE first_name = 'Hercules'
AND last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT  de.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Departments" AS d
INNER JOIN public."Dept_emp" AS de ON
d.dept_no=de.dept_no
INNER JOIN public."Employees" AS e ON
e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT  de.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Departments" AS d
INNER JOIN public."Dept_emp" AS de ON
d.dept_no=de.dept_no
INNER JOIN public."Employees" AS e ON
e.emp_no = de.emp_no
WHERE d.dept_name = 'Development';

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "frequency count"
FROM public."Employees" 
GROUP BY last_name
ORDER BY "frequency count" DESC;
