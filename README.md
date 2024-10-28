# Employee_attrition_SQL_EDA_DATA_ANALYSIS

### Overview of the Employee Attrition Dataset

**Employee Attrition** dataset, which consists of various attributes related to employees and their turnover. This dataset can provide valuable insights into employee retention, satisfaction, and overall organizational health.

#### Dataset Structure

The **Employee Attrition** table contains the following columns:

1. **Employee ID**: Primary key (auto-incrementing) uniquely identifying each employee.
2. **Age**: Age of the employee.
3. **Attrition**: Indicates whether the employee has left the company (Yes/No).
4. **Business Travel**: Frequency of business travel (e.g., Non-Travel, Travel Frequently).
5. **Daily Rate**: Daily compensation rate for the employee.
6. **Department**: Department in which the employee works (e.g., Sales, IT).
7. **Distance From Home**: Distance from the employee's residence to the workplace.
8. **Education Field**: Area of education (e.g., Arts, Science).
9. **Environment Satisfaction**: Survey score on the work environment.
10. **Gender**: Gender of the employee.
11. **Hourly Rate**: Hourly compensation rate for the employee.
12. **Job Involvement**: Level of engagement in the job.
13. **Job Level**: Hierarchical level of the employee (e.g., Entry, Mid-Level).
14. **Job Satisfaction**: Survey score on job satisfaction.
15. **Marital Status**: Marital status of the employee.
16. **Monthly Income**: Monthly compensation for the employee.
17. **Monthly Rate**: Monthly compensation rate.
18. **Number of Companies Worked**: Total companies the employee has worked for.
19. **Overtime**: Indicates if the employee works overtime (Yes/No).
20. **Percent Salary Hike**: Percentage increase in salary.
21. **Performance Rating**: Rating of the employee's performance.
22. **Relationship Satisfaction**: Survey score on relationships at work.
23. **Total Working Years**: Total years the employee has worked.
24. **Work-Life Balance**: Survey score on work-life balance.
25. **Years at Current Company**: Number of years the employee has been with the current employer.
26. **Years in Current Role**: Number of years in the current position.
27. **Years Since Last Promotion**: Number of years since the last promotion.

#### Analysis Objectives

1. **Attrition Insights**: Analyze factors contributing to employee turnover.
2. **Satisfaction Scores**: Examine the relationship between job satisfaction and attrition.
3. **Income Analysis**: Investigate how compensation impacts employee retention.
4. **Demographic Studies**: Assess the impact of age, gender, and marital status on attrition rates.
5. **Promotion Trends**: Look at how promotions correlate with employee satisfaction and retention.

#### Sample SQL Queries

To begin analyzing the data, here are some basic SQL queries 
1. **View All Employees**:
   ```sql
   SELECT * FROM Employee_Attrition;
   ```

2. **Count of Employees by Attrition Status**:
   ```sql
   SELECT Attrition, COUNT(*) AS Count
   FROM Employee_Attrition
   GROUP BY Attrition;
   ```

3. **Average Salary by Department**:
   ```sql
   SELECT Department, AVG(Monthly Income) AS Average_Salary
   FROM Employee_Attrition
   GROUP BY Department;
   ```

4. **Satisfaction Scores for Attrition**:
   ```sql
   SELECT Job Satisfaction, COUNT(*) AS Count
   FROM Employee_Attrition
   WHERE Attrition = 'Yes'
   GROUP BY Job Satisfaction;
   ```

5. **Employees Working Overtime vs. Attrition**:
   ```sql
   SELECT Overtime, COUNT(*) AS Count
   FROM Employee_Attrition
   GROUP BY Overtime, Attrition;
   ```
### 1. **Finding Employees with Attrition**
To get details of employees under attrition with 5+ years of experience and aged between 27 and 35:

```sql
SELECT *
FROM employee_attrition
WHERE age BETWEEN 27 AND 35
  AND total_working_years >= 5
  AND attrition = 'Yes';
```

### 2. **Maximum and Minimum Salary by Department**
To find maximum and minimum salaries for employees with less than a 13% salary hike:

```sql
SELECT department,
       MAX(salary) AS max_salary,
       MIN(salary) AS min_salary
FROM employee_attrition
WHERE percentage_salary_hike < 13
GROUP BY department
ORDER BY max_salary DESC;
```

### 3. **Average Monthly Income for Specific Criteria**
To calculate the average monthly income of employees with more than three years at the company and a medical education background:

```sql
SELECT AVG(monthly_income) AS average_income
FROM employee_attrition
WHERE total_working_years > 3
  AND education_field = 'Medical';
```

### 4. **Count of Male and Female Employees**
To identify the number of male and female employees under attrition, married, and without a promotion in the last two years:

```sql
SELECT gender, COUNT(*) AS count
FROM employee_attrition
WHERE marital_status = 'Married'
  AND years_since_last_promotion = 2
  AND attrition = 'Yes'
GROUP BY gender;
```

### 5. **Employees with Maximum Performance Rating**
To find employees with the maximum performance rating who haven't received a promotion for four or more years:

```sql
SELECT *
FROM employee_attrition
WHERE performance_rating = (SELECT MAX(performance_rating) FROM employee_attrition)
  AND years_since_last_promotion >= 4;
```

### 6. **Employees with Minimum Salary Hike**
To identify employees working overtime but receiving a minimum salary hike while being with the company for over five years:

```sql
SELECT *
FROM employee_attrition
WHERE overtime = 'Yes'
  AND percentage_salary_hike = (SELECT MIN(percentage_salary_hike) FROM employee_attrition)
  AND total_working_years > 5;
```

### 7. **Distinct Departments**
To find all distinct departments within the organization:

```sql
SELECT DISTINCT department
FROM employee_attrition;
```

### Key SQL Concepts:
- **SELECT**: Used to specify the columns to be returned.
- **WHERE**: Used to filter records based on specific conditions.
- **GROUP BY**: Used to group rows that have the same values in specified columns. Used for aggregating data, such as counting or finding averages within groups (like departments or genders).
- **HAVING**: Used to filter groups based on aggregate values. Used to filter groups after aggregation.
- **ORDER BY**: Used to sort the result set by one or more columns.
- **Subqueries**: Used to perform a query within another query, often for filtering. Used for dynamic calculations within conditions, like finding the maximum performance rating.
DISTINCT: Helps in retrieving unique records, such as distinct departments.


Key Concepts:
Through these analyses, we aim to derive actionable insights that can inform strategies to improve employee retention and satisfaction.

Insights:
The queries constructed can help HR analyze patterns in attrition related to experience, salary hikes, promotion history, and demographic factors. This analysis can inform strategic decisions about employee retention, salary adjustments, and promotional practices.
