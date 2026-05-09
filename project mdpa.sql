select * from project_medical_data_history.doctors;
select * from project_medical_data_history.admissions;

select * from project_medical_data_history.province_names;
select * from project_medical_data_history.patients;

select first_name,last_name,gender from project_medical_data_history.patients where gender ='M';
select first_name,last_name,allergies from patients where allergies is NULL;
select first_name from patients where first_name like 'C%';
select first_name,last_name,weight from  patients where weight between '100' and '120';
select  ifnull(allergies,'NKA')from patients;
select concat(first_name,last_name) from patients;
select first_name,last_name,province_name from patients join province_names on patients.province_id=province_names.province_id;
select first_name,last_name,birth_date from patients where birth_date between '2010-01-01' and '2010-12-31';
select first_name,last_name,height from patients order by height desc;
select * from patients where patient_id in (1,45,534,879,1000);

select  count(diagnosis) from admissions;
select distinct patient_id from admissions;

select * from admissions where admission_date = discharge_date;
select * from admissions where patient_id like '579';
select  distinct (city) ,province_id from patients where province_id = 'NS';
select  distinct(city) from patients where province_id = 'NS';

select first_name,last_name,birth_date,height,weight from patients where height >160 and weight >70 ;
select first_name,last_name,birth_date from patients order by birth_date asc;
select distinct(birth_date),first_name,last_name from patients order by birth_date asc;

select first_name from patients group by first_name having count(*)=1;
select patient_id,first_name from patients where first_name like 's%%%s' and char_length(first_name)>=6;
select p.patient_id,p.first_name,p.last_name from patients as p join admissions as a on p.patient_id=a.patient_id 
where a.diagnosis = 'dementia';
select distinct(first_name) from patients order by char_length(first_name);
select sum(gender = 'm'),sum(gender = 'f') from patients;

select patient_id,diagnosis from admissions group by patient_id,diagnosis having count(*)>1;
select city,count(*) as total_patients from patients group by city order by total_patients desc,city asc;


select first_name,last_name,'patient'as role from patients 
   union select first_name,last_name,'doctors'as role from doctors;
   
   select allergies,count(*) as popularity from patients where allergies is not null
   group by allergies order by popularity asc;
   
   select first_name,last_name,birth_date from patients where birth_date between '1970-01-01' and '1979-012-31' 
   order by birth_date asc;
   
   select concat(upper(last_name),',',lower(first_name) )as full_name from patients order by full_name desc;
select province_id,sum(height) as total_height from patients group by province_id having sum(height)>=7000;
    

select max(weight)-min(weight) as weight_difference from patients where last_name = 'maroni' ;
select day(admission_date) as day_of_month,count(*) as total_admissions  from admissions  group by day_of_month order by total_admissions desc;
select  floor(weight/10)*10 AS WEIGHT_GROUP ,count(*) as total_patients from patients group by weight_group order by weight_group desc;
select patient_id,weight,height ,case 
                           when weight/power(height/100,2)>=30
                           then 1 else 0
                           end as isobese
                           from patients;
                           
 select p.patient_id,p.first_name,p.last_name,d.specialty from patients p
  join admissions a
    on p.patient_id=a.patient_id
join doctors d
  on a.attending_doctor_id =d.doctor_id
    where a.diagnosis ='epilepsy'
    and d.first_name ='lisa';
   
   select p.patient_id,p.first_name,p.last_name,d.specialty from patients p
  join admissions a
    on p.patient_id=a.patient_id
join doctors d
  on a.attending_doctor_id =d.doctor_id;
  
  select patient_id,attending_doctor_id as doctor_id  from admissions a
  join doctors d on a.attending_doctor_id =d.doctor_id;

SELECT 
    p.patient_id,
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    d.doctor_id,
    d.first_name AS doctor_first_name
FROM patients p
JOIN admissions a 
    ON p.patient_id = a.patient_id
JOIN doctors d 
    ON a.attending_doctor_id = d.doctor_id;
  
  



  
  