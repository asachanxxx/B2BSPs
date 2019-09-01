
set identity_insert DistrictJsons on

INSERT INTO [dbo].[DistrictJsons]
           (Id,[ProvinceId]
           ,[DName])
SELECT [id]
      ,[province_id]
      ,[name_en]
  FROM [dbo].[XxX_districts]





set identity_insert DistrictJsons off





set identity_insert CityJsons on
INSERT INTO [dbo].[CityJsons]
           (id,[DId]
           ,[DName]
           ,[PostCode]
           ,[Latitude]
           ,[Longitude])
SELECT [id]
      ,[district_id]
      ,[name_en]
      ,[postcode]
      ,[latitude]
      ,[longitude]
  FROM [dbo].[XxX_cities]
set identity_insert CityJsons off