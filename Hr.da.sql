SELECT * FROM `hr.da`.`hr_analytics.csv`;

-- query to find detials of employee under attrition having  5+ year of exp, btw age 27 - 35

SELECT * 
FROM `hr.da`.`hr_analytics.csv`
where Age between 27 and 35
and TotalWorkingYears > 5;

-- QUERY DETAILS OF employees  having max and min salary  working in diff  depart  who recieved  less then  13% salary hike 

select max(MonthlyIncome) as max_salary , min(MonthlyIncome) as min_salary , Department , PercentSalaryHike
FROM `hr.da`.`hr_analytics.csv`
group by Department , PercentSalaryHike
having PercentSalaryHike < 13;

-- query to find avg monthly income of all employee  who worked  more than  3 years  whose education background is  medical

select avg(MonthlyIncome) , EducationField 
FROM `hr.da`.`hr_analytics.csv`
where YearsAtCompany > 3 and EducationField = 'medical';

-- IDENTIFY THE TOTAL NO OF MALE  AND FEMALE EMPL WHOSE MARITIAL status is  married  and havent   received promotion in last 2 years  

SELECT Gender , count(*) , MaritalStatus, YearsSinceLastPromotion
FROM `hr.da`.`hr_analytics.csv`
where MaritalStatus = 'Married'
and YearsSinceLastPromotion = 2
group by Gender;


-- query to find employees with max performance rating and no  promotion for 4 years n above 

select PerformanceRating, YearsSincelastPromotion , employeeid
FROM `hr.da`.`hr_analytics.csv`
where PerformanceRating = (select max(PerformanceRating) 
FROM `hr.da`.`hr_analytics.csv` )
and YearsSincelastPromotion > 4;

-- who has  max and min  percentage of  salary hike 

select max(Percentsalaryhike) as max_hike, min(percentsalaryhike) as min_hike , employeeid 
FROM `hr.da`.`hr_analytics.csv` 
group by employeeid, YearsAtCompany , YearsSinceLastPromotion , PerformanceRating
order by max_hike desc, min_hike asc;

-- employee working overtime but given min salary hike  and  are more than 5 years in company 

select *
FROM `hr.da`.`hr_analytics.csv` 
where PerformanceRating =  (select max(PerformanceRating) 
FROM `hr.da`.`hr_analytics.csv` )
and overtime = 'yes'
and YearsAtCompany > 5
and attrition = 'yes'






