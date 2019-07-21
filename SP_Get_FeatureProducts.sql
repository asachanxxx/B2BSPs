USE [B2BSystem]
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_FeaturedProducts]    Script Date: 7/11/2019 3:09:26 AM ******/

ALTER PROCEDURE [dbo].[SP_Get_FeatureProducts]
@Status int output
AS
BEGIN


SELECT        NA.ProductId AS id, NA.Name AS 'name', NA.Price AS 'price', NA.CompareAtPrice AS 'compareAtPrice', NA.Rating AS 'rating', NA.Reviews AS 'reviews', 
                         CASE WHEN Availability = 1 THEN 'in-stock' ELSE 'OutOf-stock' END AS availability, SPD.SpecItemId as id , SPD.SpecItemDisplayName as fname, SPD.Value as fvalue
FROM            dbo.FeatureProducts AS NA INNER JOIN
                         dbo.SpecProductDetails AS SPD ON NA.ProductId = SPD.ProductId
order by NA.ProductId


--select 
--	ProductId as id,
--	Name as 'name',
--	Price as 'price',
-- 	CompareAtPrice as 'compareAtPrice',
--	Rating as 'rating',
--	Reviews as 'reviews',
--	case when Availability = 1 then 'in-stock'
--	else 'OutOf-stock'
--	end
-- from  [dbo].[FeatureProducts]

--  select 'F-122' as name , 'val-092' as value

-- select 'images'

-- select 'badges'

END
