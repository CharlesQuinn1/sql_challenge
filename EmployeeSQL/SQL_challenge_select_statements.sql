-------------------------
--Data Analysis
-------------------------

--1. List the employee number, last name, first name, sex, and salary of each employee.
select
 emp.emp_no
,emp.last_name
,emp.first_name
,emp.sex
,sal.salary
from employees emp
	join salaries sal on
	emp.emp_no = sal.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
select
 emp.first_name
,emp.last_name
,emp.hire_date
from employees emp
where date_part('Year', emp.hire_date) = '1986';

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
select
 mgr.dept_no
,dep.dept_name
,mgr.emp_no
,emp.last_name
,emp.first_name
from dept_manager mgr
	join departments dep on
	mgr.dept_no = dep.dept_no
	join employees emp on
	mgr.emp_no = emp.emp_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select
 edept.dept_no
,emp.emp_no
,emp.last_name
,emp.first_name
,dep.dept_name
from employees emp
	join dept_emp edept on
	emp.emp_no = edept.emp_no
	join departments dep on
	edept.dept_no = dep.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select
 emp.first_name
,emp.last_name
,emp.sex
from employees emp
where
emp.first_name = 'Hercules'
and left(upper(emp.last_name),1) = 'B';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
select
 emp.emp_no
,emp.last_name
,emp.first_name
,dep.dept_name
from employees emp
	join dept_emp edept on
	emp.emp_no = edept.emp_no
	join departments dep on
	edept.dept_no = dep.dept_no
where dep.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
 emp.emp_no
,emp.last_name
,emp.first_name
,dep.dept_name
from employees emp
	join dept_emp edept on
	emp.emp_no = edept.emp_no
	join departments dep on
	edept.dept_no = dep.dept_no
where dep.dept_name in('Sales', 'Development');

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select
 emp.last_name
,count(*) frequency_counts
from employees emp
group by
 emp.last_name
order by
 count(*) desc;