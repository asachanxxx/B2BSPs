declare @valr int =23

exec SP_XxX_Insert_BestSellProduct 41
exec SP_XxX_Insert_NewArrivalProduct 42
exec SP_XxX_Insert_FeatureItems 43
select * from [dbo].[BestSellProducts]
select * from [dbo].[FeatureProducts]
select * from [dbo].[NewArrivalProducts]



select * from Products