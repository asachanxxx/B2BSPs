select * from XxX_All where  Level3 = 'Processors'
select * from XxX_ExtractedLevel3s
select * from XxX_ExtractedSpecItems

select distinct extended from [dbo].[XxX_All]


--select row_number() over (order by extended) as 'Id', extended as 'Name' into XxX_ExtractedSpecItems
--from (select distinct extended from XxX_All where extended is not null) t;


select extended ,count(extended) from [dbo].[XxX_All]
group by extended
having count(extended)>50
order by count(extended) desc

--make levels

select * from XxX_ExtractedLevel3s where name  not in(
select Name from level3)


select * from XxX_ExtractedLevel3s where name  not in(
select Level3 from XxX_All)

/*
Not in list
1	 Blu-Ray Drives - 85	3	18	Blu-Ray Drives(Blu-Ray Drives)
2	 Processors - Servers - 2	1	1	Server Processors (Server Processors)
4	 AMD Motherboards  - 5	1	2	AMDMotherboards --no changhe
9	 CD /DVD Burners - 82	3	18	CD / DVD Burners (CD/DVD Burners)
18	External CD/DVD/Blu-Ray Dri -- 84	3	18	External CD / DVD / Blu-Ray Drives (External CD/DVD/Blu-Ray Drives)
27	Laptops   Notebooks - 59	2	14	Laptops / Notebooks (Laptops/Notebooks)
29	LCD/LED Monitors - 153	6	34	LCD / LED Monitors -no change
34	Motherboards  - 4	1	2	Intel Motherboards -- no change
37	Processors -- no change
44	SSD/HDD Accessories - 30	1	9	SSD / HDD Accessories
*/

--search and replace 

--update XxX_ExtractedLevel3s set Name = 'Server Processors' where id =2

select * from [dbo].[Level3] where id =2
select * from XxX_ExtractedLevel3s where id =2

--update Level3 set Name = 'LCD/LED Monitors' where id = 153

select * from XxX_All where Level3 like '%Blu-Ray Drives%'
select * from XxX_All where Level3 = 'Blu-Ray Drives'
select * from XxX_All where ltrim(rtrim(Level3)) = 'Blu-Ray Drives'

update XxX_All 
set Level3 = ltrim(rtrim(Level3))
where ltrim(rtrim(Level3)) = 'Blu-Ray Drives'

update XxX_All 
set Level3 = 'Laptops/Notebooks'
where ltrim(rtrim(Level3)) = 'Laptops   Notebooks'
