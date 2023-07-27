--Create a join table

use work

select * from Absenteeism_at_work ab
left join compensation co
On
ab.ID = co.ID
left join Reasons re
On
ab.Reason_for_absence = re.Number;



-- find the healthiest
select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index < 25 and 
Absenteeism_time_in_hours < (select avg(Absenteeism_time_in_hours)from Absenteeism_at_work)

''' Compensation rate increase for non-smokers / budget $983,221. insight = 0.68 increase per hour/
$1,414.4/year '''

select count(*) as non_smokers from Absenteeism_at_work
where Social_smoker =0



-- Optimize the query

select
ab.ID, 
re.Reason,
Body_mass_index,
CASE 
When Body_mass_index <18.5 then 'Underweight'
When Body_mass_index between 18.5 and 25 then 'Healthy Weight'
When Body_mass_index between 25 and 30 then 'Overweight'
When Body_mass_index > 30 then 'Obese'
Else 'Unknown'
END as BMI_category,
CASE
WHEN Month_of_absence in (12,1,2) then 'Winter'
WHEN Month_of_absence in (3,4,5) then 'Spring'
WHEN Month_of_absence in (6,7,8) then 'Summer'
WHEN Month_of_absence in (9,10,11) then 'Fall'
else 'Unknown'
end as Season_names,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours

from Absenteeism_at_work ab
left join compensation co
On
ab.ID = co.ID
left join Reasons re
On
ab.Reason_for_absence = re.Number;