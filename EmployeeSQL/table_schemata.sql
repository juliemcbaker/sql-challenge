-- establishes department codes & names
CREATE TABLE departments (
	dept_no varchar(25) PRIMARY KEY NOT NULL,
	dept_name varchar(255) NOT NULL
);

-- establishes title codes & names
CREATE TABLE titles (
	title_id varchar(25) PRIMARY KEY NOT NULL,
	title varchar(255) 
);

-- employee demographics (multiple employees can have same title)
CREATE TABLE employees (
	emp_no int PRIMARY KEY NOT NULL, 
	emp_title_id varchar(25) NOT NULL,
	birth_date DATE, 
	first_name varchar(25) NOT NULL,
	last_name varchar(25) NOT NULL,
	sex varchar(3),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

-- connect employees to departments (depts have >1 empl & empl can have >1 dept)
CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no varchar(25) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- connects employees to salaries (1 to 1)
CREATE TABLE salaries (
	emp_no int NOT NULL,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- connects managers to depts via employee id (multiple managers per dept, but managers only have 1 dept)
CREATE TABLE dept_manager (
	dept_no varchar(25) NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
