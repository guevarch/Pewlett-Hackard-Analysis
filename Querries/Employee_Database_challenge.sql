-- Retirement Titles
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC

-- Unique Titles
SELECT DISTINCT rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt 
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no

-- Retiring Titles
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;

-- Mentorship Eligibility 
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title   
INTO mentorship_eligibility,  
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no )
INNER JOIN titles as ti
ON (de.emp_no = ti.emp_no )

------------------------------------------------------------------
-- Count ages between 1964 - 1970
SELECT COUNT (e.emp_no)
INTO bdate1964_1970
FROM employees as e
WHERE (e.birth_date BETWEEN '1964-01-01' AND '1970-12-31')
-- 24853 employees

-- Count ages between 1952 - 1957
SELECT COUNT (e.emp_no)
INTO bdate1952_1957
FROM employees as e
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1957-12-31')
-- 136299 employees

-- Count ages between 1958 - 1963
SELECT COUNT (e.emp_no)
INTO bdate1958_1963
FROM employees as e
WHERE (e.birth_date BETWEEN '1958-01-01' AND '1963-12-31')
-- 138872 employees

--------------- Most impacted department from retirement

Select retirement_info.emp_no, retirement_info.first_name, retirement_info.last_name,
dept_info.dept_name
INTO RETIREMENTINFO2
FROM retirement_info
INNER JOIN dept_info
ON (retirement_info.emp_no = dept_info.emp_no)

SELECT COUNT(RT.emp_no), RT.dept_name
FROM RETIREMENTINFO2 AS RT
GROUP BY RT.dept_name






