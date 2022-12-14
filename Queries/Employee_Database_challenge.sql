-- DELIVERABLE 1: THE NUMBER OF RETIRING EMPLOYEES BY TITLE
-- Join Employees and Titles tables to get list of "retiring" employees
-- Birthdate between 1952-1955, include titles, and order by employee number
--
SELECT e.emp_no, 
        e.first_name,
        e.last_name,
        ti.title,
        ti.from_date,
        ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
SELECT * FROM retirement_titles;
--

-- Remover duplicate employee entries from the retirement_titles table
SELECT DISTINCT ON (emp_no) emp_no, 
	first_name, 
	last_name, 
	title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles;

-- Number of employees by most recent job title who are about to retire
SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles 
FROM unique_titles as ut 
GROUP BY title 
ORDER BY COUNT(title) DESC;
SELECT * FROM retiring_titles;



-- DELIVERABLE 2: THE EMPLOYEES ELIGIBLE FOR THE MENTORSHIP PROGRAM
--
-- Mentorship Eligibility table for current employees who 
-- were born between January 1, 1965 and December 31, 1965
--
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de 
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tt 
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') and DE.TO_DATE = '9999-01-01'
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;


-- DELIVERABLE 3: A WRITTEN REPORT ON THE EMPLOYEE DATABASE ANALYSIS
-- Provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami"
-- QUERY/TABLE 1: Get the number of eligible mentors grouped by title
SELECT COUNT(title) count, title
INTO mentor_count_title
FROM mentorship_eligibility
GROUP BY (title) 
ORDER BY count DESC;
SELECT * FROM mentor_count_title;

-- QUERY/TABLE 2: Get list of current employees eligible for retirement 
SELECT DISTINCT ON (emp_no)
        ce.emp_no, 
        ce.first_name,
        ce.last_name,
        ti.title,
        ti.from_date,
        ti.to_date
INTO current_retirement_titles
FROM current_emp as ce
INNER JOIN titles as ti
ON ce.emp_no = ti.emp_no
ORDER BY emp_no, from_date DESC;
SELECT * FROM current_retirement_titles;

-- QUERY/TABLE 3: Get a table of the title count for current employees
SELECT COUNT(title) count, title
INTO current_count_title
FROM current_retirement_titles
GROUP BY (title) 
ORDER BY count DESC;
SELECT * FROM current_count_title;

