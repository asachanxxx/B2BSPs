select * from EmailSettings

INSERT INTO [dbo].[EmailSettings]
           ([InfoEmail]
           ,[FromPassword]
           ,[Subject]
           ,[Host]
           ,[Port]
           ,[EnableSsl]
           ,[UseDefaultCredentials])
     VALUES
		('mr.hk.hunter@gmail.com' , 'asdqwe123#' , 'Welcome to Techthrong' ,'smtp.gmail.com' , '587', 1, 0)
