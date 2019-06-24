select * from [dbo].[XxX_All]
select * from [dbo].[XxX_SpecItems]
select distinct Level3  from [dbo].[XxX_All]


SELECT *
FROM [XxX_All] WITH(INDEX(Index_Name))


--select row_number() over (order by Level3) as 'Id', Level3 as 'Name' into XxX_SpecItems
--from (select distinct Level3 from XxX_All) t;




