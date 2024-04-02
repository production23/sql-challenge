DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(45) NOT NULL
);

--select * from departments;

CREATE TABLE dept_emp (
	emp_no integer NOT NULL,
	dept_no character varying(45) NOT NULL
);

--SELECT * from dept_emp;

CREATE TABLE dept_manager (
	dept_no character varying(45) NOT NULL,
	emp_no character varying(45) NOT NULL
);

--select * from dept_manager;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(45) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date DATE
);

--select * from employees

CREATE TABLE salaries (
    emp_no VARCHAR(45) NOT NULL,
    salary INT NOT NULL
);

--select * from salaries

CREATE TABLE titles (
	title_id character varying(45) NOT NULL,
	title character varying(45) NOT NULL
)

--select * from titles



-- question 1 
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = CAST(salaries.emp_no AS INT);


-- question 2
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- Question 3
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no AS manager_emp_no, employees.last_name AS manager_last_name, employees.first_name AS manager_first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON CAST(dept_manager.emp_no AS INT) = employees.emp_no;

-- Question 4
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_no, departments.dept_name
FROM dept_emp, employees, departments
WHERE dept_emp.emp_no = employees.emp_no
AND dept_emp.dept_no = departments.dept_no;

-- Question 5
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

-- Question 6
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees, dept_emp, departments
WHERE employees.emp_no = dept_emp.emp_no
AND dept_emp.dept_no = departments.dept_no
AND departments.dept_name = 'Sales';

-- Question 7
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees, dept_emp, departments
WHERE employees.emp_no = dept_emp.emp_no
AND dept_emp.dept_no = departments.dept_no
AND departments.dept_name IN ('Sales', 'Development');

-- Question 8
SELECT employees.last_name, COUNT(*) AS frequency
FROM employees
GROUP BY employees.last_name
ORDER BY frequency DESC;



