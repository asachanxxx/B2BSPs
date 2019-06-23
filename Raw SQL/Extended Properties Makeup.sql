--Make up the level wide extended information

INSERT INTO [dbo].[LevelWiseExtended]
           ([Level3Id]
           ,[Level3Name]
           ,[Extended]
           ,[Value])
 select 0, level3 , Extended ,  Name from [All$]

  INSERT INTO [dbo].[LevelWiseExtended]
           ([Level3Id]
           ,[Level3Name]
           ,[Extended]
           ,[Value])
 select 0,level3 ,'Cache'  , Name from [dbo].[Cache$]

 
INSERT INTO [dbo].[LevelWiseExtended]
           ([Level3Id]
           ,[Level3Name]
           ,[Extended]
           ,[Value])
 select 0, level3 , 'Chipset'   , Name from [dbo].[Chipset$]

INSERT INTO [dbo].[LevelWiseExtended]
           ([Level3Id]
           ,[Level3Name]
           ,[Extended]
           ,[Value])
 select 0, level3 , 'Color'   , Name from [dbo].[Color$]
 
 INSERT INTO [dbo].[LevelWiseExtended]
           ([Level3Id]
           ,[Level3Name]
           ,[Extended]
           ,[Value])
 select 0, level3 , 'Core Name'   , Name from ['Core Name$']