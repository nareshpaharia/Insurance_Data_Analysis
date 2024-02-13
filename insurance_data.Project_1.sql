SELECT * FROM insurance.ins;

#Q1. Display the average claim amount for patients in each in each region? 

select region,round(avg(claim),0) as avg_claim from insurance.ins
group by region;

#Q2. find min and max bmi values in the table?
select min(bmi) as mini_bmi, max(bmi) as max_bmi 
from insurance.ins;

#Q3. find the PatientID,age and bmi  for patient with a  bmi between 40 and 50?
SELECT * FROM insurance.ins;
select PatientID,age,bmi from insurance.ins
where bmi between 40 and 50
order by bmi desc;

#Q4. find the number of smoker in each region?
select count(PatientID),region from  insurance.ins where smoker="Yes"
group by region;

#Q5. find the number of smoker in each region?
select count(*),region from insurance.ins 
where smoker="Yes"
group by region;

SELECT * FROM insurance.ins;

#Q6. what is the average claim amount for the patients who are both diabatics and smoker?
select avg(claim) as avg_claim from insurance.ins
where diabetic="Yes" and smoker="Yes";

SELECT * FROM insurance.ins;
#Q7. what is the average claim amount for the patients who are both diabatics and smoker?
select avg(claim) as avg_claim from insurance.ins 
where diabetic="Yes" and smoker="Yes";

#Q8. Retrieve all patients who have a BMI greater than the average BMI of the patient who are smoker?

select * from insurance.ins where smoker="Yes" and bmi>
(select avg(bmi) as avg_bmi from insurance.ins
where smoker="Yes");

-- --------------------------------------------------------
-- -------------------------------------------------------
SELECT * FROM insurance.ins;
select avg(claim) from insurance.ins;

select min(age) , max(age) from insurance.ins;
-- ---------------------------------------------------------
-- ---------------------------------------------------------
#Q9. what is the average claim amount for each patient in each age group?
select 
case when age <18 then "Under 18"
when age between 18 and 30 then "18-30"
when age between 31 and 50 then "31-50"
else "over 50"
end  as age_group,
Round(avg(claim),0) as avg_claim
from insurance.ins
group by age_group; 

#Q10. Retrieve the total claim amount for each patients along with the average claim amount across the patient
SELECT * FROM insurance.ins;

select *,PatientID,sum(claim) over(partition by PatientID) as total_claim,
avg(claim) over() from insurance.ins;

-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
#Q11. Retrieve the top 3 patients with the higest claim amount, along with their 
-- respective claim amount and the total claim amount for all patients?
SELECT PatientID,claim,sum(claim) over() as total_claim 
from insurance.ins
order by claim desc
limit 3 ;

#Q12. select the details of the patients who have a claim amount
-- greater then the average claim amount for their region?
SELECT * FROM insurance.ins;

select * from (select *,avg(claim) over (Partition by region)
as avg_claim from insurance.ins) as subquery
where claim>avg_claim;

#Q13. Retrieve the rank of each patients with their claim amount 

select * ,rank() over (order by claim desc) from insurance.ins;

#Q14. select the details of patients along with their claim amount,
-- and their rank based on claim amount within their region?

select *,  rank() OVER(partition by region order by claim desc )  
from insurance.ins;

-- -----------------------END------------------------------------
-- --------------------------------------------------------------



