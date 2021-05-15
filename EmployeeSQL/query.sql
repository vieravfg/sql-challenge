-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
From "Employees" as e
left JOIN "Salaries" as s 
on (e.emp_no = s.emp_no);
-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
From "Employees" 
Where hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: department number,
--department name, the manager's employee number, last name, first name
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
From "Dept_manager" as dm
Inner JOIN "Departments" as d 
ON ( dm.dept_no = d.dept_no)
Inner Join "Employees" as e
ON (dm.emp_no = e.emp_no);

--List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
From "Employees" as e
Inner JOIN "Dept_employee" as de
ON (e.emp_no = de.emp_no )
Inner Join "Departments" as d
On (de.dept_no = d.dept_no);

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
From "Employees"
Where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name
From "Employees" as e
Inner JOIN "Dept_employee" as de
ON (e.emp_no = de.emp_no )
Inner Join "Departments" as d
On (de.dept_no = d.dept_no)
Where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
From "Employees" as e
Inner JOIN "Dept_employee" as de
ON (e.emp_no = de.emp_no )
Inner Join "Departments" as d
On (de.dept_no = d.dept_no)
Where d.dept_name in ('Sales', 'Development') ;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select count (last_name), last_name
From "Employees"
Group by last_name
Order by count (last_name)
desc;
