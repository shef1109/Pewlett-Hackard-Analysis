# Pewlett-Hackard-Analysis

## Overview of the project
Pewlett-Hackard is a large company with thousands of employees. However, many of its "boomers" are looking to retire, and Pewlett-Hackard is looking toward the future by offering a retirement package for those who meet certain criteria and thinking about which positions need to be filled in the near future. The purpose of this analysis is to determine how many employees are in a position to retire, and how many employees could be eligible to participate in a mentorship program to help mentor new hires.

We will be gathering the required data by querying a database using SQL. Each of the two questions will be broken down into smaller sub questions as follows:

* I. Determine how many employees are in a position to retire and their titles
  * We will create a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955.

  * Because some employees may have multiple titles in the database - due to promotions or internal transfers— we need to create a table that contains the most recent title of each employee.

  * Finally, we will create a final table that has the number of retirement-age employees grouped by most recent job title.

* II. Determine the employees eligible for the Mentorship Program
  * We will create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.
  
  ## Results
* The first question asked is how many employees are in a position to retire? To visualize question, it will be broken down into sub-questions.
	* Information on employees retiring in the near future 
 	 	* Gets the employee number, first name, last name, title, title from date and title to date for each employee who was born between 1952 and 1995.  This puts us close to our answer, but not quite because this list includes many duplicate entries for employees who have multiple titles.
	 	* [Full Export]( https://github.com/shef1109/Pewlett-Hackard-Analysis/blob/723e1df7025ecf23c9826a3cb8f6ebc3266b188d/Data/retirement_titles.csv)
 	 	* Data Sample
 	 
  ![retirement_titles](Data/retirement_titles.png)
  
	* Current Titles of Employees 
   	 	* Gets the employee number, first name, last name, and only the current title for each employee in the previous table (removes duplicates). 
	 	* [Full Export](https://github.com/shef1109/Pewlett-Hackard-Analysis/blob/bc05f3cbb80929bb2626d8bf530ec93248a13720/Data/unique_titles.csv )
 	 	* Data Sample

 ![unique_titles](Data/unique_titles.png)
   
	* Titles of employees retiring in the near future
		* Gets a count of employees who are ready to retire by each title, and provide a total count.
		* [Full Export](https://github.com/shef1109/Pewlett-Hackard-Analysis/blob/66dcc7e5f9c80aced1b8f897f8f6fecaa7564c77/Data/retiring_titles.csv)
		* Data Sample
		
![retiring_titles](Data/retiring_titles.csv)

* For the second question we need to compile a list of all the current employees eligible for a mentorship program. This one is a little more straight-forward. All we have to do is adjust or original query birthdate range and add a second filter, to filter out employees no longer employed.
	* Employees available for mentorship 
	* Gets employee number, first name, last name, birth date, title from date, and title to date for each employee where with a birthday between January 1, 1965 and December 31, 1965, and filter by those still employeed by Pewlett-Hackard using to_date = 9999-01-01.
	* [Full Export](https://github.com/shef1109/Pewlett-Hackard-Analysis/blob/66dcc7e5f9c80aced1b8f897f8f6fecaa7564c77/Data/mentorship_eligibilty.csv)
	* Data Sample 
	
![mentorship_eligibility](Data/mentorship_eligibilty.png)

## Summary
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
