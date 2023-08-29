﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Conceptual (without relationships)
-- Pyshical
CREATE TABLE "Departments" (
    "Dept_no" VARCHAR   NOT NULL,
    "Dept_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Dept_Empl" (
    "Emp_no" INTEGER   NOT NULL,
    "Dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "Dept_no" VARCHAR   NOT NULL,
    "Emp_no" INTEGER   NOT NULL
);

CREATE TABLE "Employees" (
    "Emp_no" INTEGER   NOT NULL,
    "Title_id" VARCHAR   NOT NULL,
    "Birth_date" DATE   NOT NULL,
    "First_name" VARCHAR   NOT NULL,
    "Last_name" VARCHAR   NOT NULL,
    "Sex" VARCHAR   NOT NULL,
    "Hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Salaries" (
    "Emp_no" INTEGER   NOT NULL,
    "Salary" INTEGER   NOT NULL
);

CREATE TABLE "titles" (
    "Title_id" VARCHAR   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "Title_id"
     )
);

ALTER TABLE "Dept_Empl" ADD CONSTRAINT "fk_Dept_Empl_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_Empl" ADD CONSTRAINT "fk_Dept_Empl_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Title_id" FOREIGN KEY("Title_id")
REFERENCES "titles" ("Title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

