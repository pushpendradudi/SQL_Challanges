--Q1 - the median severity value of accidents caused by various Motorcycles 
select MEDIAN(T.Accident_Severity)  as Median_Severity , t.vehicle_type  from 
(
select v.Accident_Index , act.Accident_Severity , vt.VEHICLE_CODE , vt.VEHICLE_TYPE
from vehicle as v
left   join vehicle_type as  vt on v.vehicle_type = vt.VEHICLE_CODE
left  join accident as act on act.Accident_Index = v.Accident_Index) 
as t where t.vehicle_type  like '%Motorcycle%' group by vehicle_type  ;


--Q2 - Accident Severity and Total Accidents per Vehicle Type 

select avg(t.Accident_Severity) as Average_Severity ,count(Accident_Index) as Total_Accident ,t.vehicle_type  from 
(
select v.Accident_Index , act.Accident_Severity , vt.VEHICLE_CODE , vt.VEHICLE_TYPE
from vehicle as v
left   join vehicle_type as  vt on v.vehicle_type = vt.VEHICLE_CODE
left  join accident as act on act.Accident_Index = v.Accident_Index) 
as t where t.vehicle_type <> 'Null' group by t.VEHICLE_type  order by Average_Severity   ;


--Q3 - Average Severity by vehicle type.
select avg(t.Accident_Severity) as Average_Severity ,t.vehicle_type  from 
(
select v.Accident_Index , act.Accident_Severity , vt.VEHICLE_CODE , vt.VEHICLE_TYPE
from vehicle as v
left   join vehicle_type as  vt on v.vehicle_type = vt.VEHICLE_CODE
left  join accident as act on act.Accident_Index = v.Accident_Index) 
as t where t.vehicle_type  <> 'Null'   group by t.VEHICLE_type  order by Average_Severity   ;

-- Q4 -Calculate the Average Severity and Total Accidents by Motorcycles
select avg(t.Accident_Severity) as Average_Severity ,count(Accident_Index) as Total_Accident ,t.vehicle_type  from 
(
select v.Accident_Index , act.Accident_Severity , vt.VEHICLE_CODE , vt.VEHICLE_TYPE
from vehicle as v
left   join vehicle_type as  vt on v.vehicle_type = vt.VEHICLE_CODE
left  join accident as act on act.Accident_Index = v.Accident_Index) 
as t where t.vehicle_type  like '%Motorcycle%' group by t.VEHICLE_type     ;

