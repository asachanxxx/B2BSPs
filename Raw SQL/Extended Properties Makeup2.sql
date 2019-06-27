select * from XxX_All where --Extended is null
select * from XxX_CategoryList
select * from XxX_SpecItems


--drop table XxX_SpecItems
--select row_number() over (order by Extended) as 'Id'  ,  Extended as 'Name' into XxX_SpecItems
--from (select distinct Extended from XxX_All where Extended is not null) t;


--select row_number() over (order by Level3) as 'Id'  ,  Level3 as 'Name' into XxX_CategoryList
--from (select distinct Level3 from XxX_All) t;

select distinct Level3 from XxX_All -- 50
select distinct Extended from XxX_All -- 205




select * from [dbo].[Level1$] where name is null
--delete from [dbo].[Level1$] where name is null

select * from [dbo].[Level2$] where name is null
--delete from [dbo].[Level2$] where name is null

select * from [dbo].[Level3$] where name is null
--delete from [dbo].[Level3$] where name is null


select * from [dbo].[Level3$] where id between 321 and 642

select name from [dbo].[Level3$] where name in
(select name from XxX_CategoryList )

select name from XxX_CategoryList where name not in
(select name from [dbo].[Level3$])


select * from [dbo].[Level3$] where name like '%moth%'
select * from XxX_All where Level3 like '%Proces%'
