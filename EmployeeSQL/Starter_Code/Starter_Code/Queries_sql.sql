----DATA Analysis----

---1.List employee #,last name, first name, sex and salary of each employee

-- Becuase table schema was imported from "QuickDBD" must include "" for the following columns needed

select e."Last_name", e."First_name", e."Sex", s."Emp_no", s."Salary"
from "Employees" as e
inner join "Salaries" as s
on s."Emp_no" = e."Emp_no"
order by s."Emp_no";


--2.List the first name, last name, and hire date for the employees who were hired in 1986.

--Googled how to use extract year in the 'where' clause
select e."First_name", e."Last_name", e."Hire_date"
From "Employees" as e 
Where Extract (YEAR From "Hire_date") = '1986';

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.

select dm."Dept_no", dp."Dept_Name", dm."Emp_no", e."Last_name", e."First_name"
From "Dept_Manager" as dm
Inner Join "Departments" as dp
on dm."Dept_no" = dp."Dept_no"
Inner Join "Employees" as e
on dm."Emp_no" = e."Emp_no"

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select de."Dept_no", de."Emp_no", e."Last_name", e."First_name"
From "Employees" as e
Left Join "Dept_Empl" as de
on e."Emp_no" = de."Emp_no"
Inner Join "Departments" as dp
on de."Dept_no" = dp."Dept_no"

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select e."First_name", e."Last_name", e."Sex"
From "Employees" as e
Where "First_name" = 'Hercules' AND "Last_name" Like 'B%'

--6.List each employee in the Sales department, including their employee number, last name, and first name.

select d."Dept_Name" ,e."Emp_no", e."Last_name", e."First_name"
From "Employees" as e
Inner Join "Dept_Empl" as de
on e."Emp_no" = de."Emp_no"
Inner Join "Departments" as d
on de."Dept_no" = d."Dept_no"
where "Dept_Name" = 'Sales'

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select d."Dept_Name" ,e."Emp_no", e."Last_name", e."First_name"
From "Employees" as e
Inner Join "Dept_Empl" as de
on e."Emp_no" = de."Emp_no"
Inner Join "Departments" as d
on de."Dept_no" = d."Dept_no"
where "Dept_Name" = 'Sales' OR "Dept_Name" = 'Development'

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select e."Last_name", count(e."Last_name") as Frequency
from "Employees" as e
group by e."Last_name"
order by Frequency DESC;