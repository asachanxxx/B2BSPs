select * from [dbo].[Level3]  where name like '%Processors%'


select distinct level3, Extended from  [dbo].[All$]
group by level3, Extended 
order by level3

select * from EXT_ExtendedHeaders where EXTName like '%Computer Cases%'
select * from EXT_ExtendedItems

select * from [dbo].[Level3]  where 
name  in (select * from EXT_ExtendedHeaders)