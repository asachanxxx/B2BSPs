USE [B2BSystem]
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_FeaturedProducts]    Script Date: 7/11/2019 3:09:26 AM ******/

ALTER PROCEDURE [dbo].[SP_Get_FeaturedProducts]
AS
BEGIN

select 
	ProductId as id,
	Name as 'name',
	Price as 'price',
 	CompareAtPrice as 'compareAtPrice',
	Rating as 'rating',
	Reviews as 'reviews',
	case when Availability = 1 then 'in-stock'
	else 'OutOf-stock'
	end
 from  [dbo].[FeatureProducts]
END
