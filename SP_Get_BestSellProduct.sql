USE [B2BSystem]
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_FeaturedProducts]    Script Date: 7/12/2019 4:47:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Get_BestSellProduct]
	@Status int output
AS
BEGIN


SELECT        NA.ProductId AS id, NA.Name AS 'name', NA.Price AS 'price', NA.CompareAtPrice AS 'compareAtPrice', NA.Rating AS 'rating', NA.Reviews AS 'reviews', 
                         CASE WHEN Availability = 1 THEN 'in-stock' ELSE 'OutOf-stock' END AS availability, SPD.SpecItemId as id , SPD.SpecItemDisplayName as fname, SPD.Value as fvalue
FROM            dbo.BestSellProducts AS NA INNER JOIN
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
-- from  [dbo].[BestSellProducts]


-- select 'F-122' as name , 'val-092' as value

-- select 'images'

-- select 'badges'


END
