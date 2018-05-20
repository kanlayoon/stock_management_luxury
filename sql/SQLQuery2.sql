



INSERT INTO [dbo].[Branch]
           ([Branch_Name]
           ,[Branch_Address]
		   ,[Branch_Phone]
		   )
     VALUES
           ('????????????? ?????','????????????? ????? ???? 16',02-745-6527),
		    ('?????????????????','????????????????? ???????? ?? ???? 6',02-884-6799),
			('??????????? ???????????','??????????? ??????????? ???? 3',02-720-2051-2),
			('??????????? ?????????','??????????? ????????? ???? 4',02-108-6238),
			('??????????????????? 2','??????????????????? 2 ???? 3',02-872-4514-15)
go

INSERT INTO [dbo].[Course]
			([Course_Name],
			[Course_Des]
			)
		values
		('Bird�s nest Fresh Collagen Serum','????????????????????????? ????????????????? Collagen Capsule ????????????????????????????????? ???????????????????????????? ??????????????????????'),
		('LUXURY CARBON PEEL','????????????????????????????????????????????????????? ???????????????????????????????????????????????????????? ???????????????????????????????????????????????????'),
('LUXURY FAT BURN','??????????????????????????????????????  ????????????????????????????????????????????????????????????????????????????????????'),		
('RHINOPLASTY ','????????????????? ??????????????????????????? ??????????????????????????????????????????????????????????????????????')

go

select * from [dbo].[Manager]
alter table [dbo].[Manager]
alter column [Manager_Status] bit


INSERT INTO [dbo].[Manager]
			([Manager_FirstName],
			[Manager_LastName],
			[Manager_Gender],
			[Manager_Status],
			[Manager_Address],
			[Manager_Email],
			[Manager_Username],
			[Manager_Password]
			)

		values
		('?????','?????',0,0,'22 ????8 ?.????? ?.????? ?.????? 52150','kanlaya@gmail.com','kanlayoon','kanlaya123'),
		('????','??????',0,1,'234 ????12 ?.???????? ?.???????? ?.?????? 83110','pakapon@gmail.com','pakaporn','pakaporn123')
		go


insert into [dbo].[Product]
			([Product_Name],
			[Product_Des],
			[Product_Instruction],
			[Product_EXP],
			[Product_Amount],
			[ProductType_Id])
			
		values
		('?????????','??????????????????????????','????????????????','',350,2) 
go

select * from [dbo].[Manager]
alter table [dbo].[ProductType]
alter column [ProductType_Name] varchar(40)

insert into [dbo].[ProductType]
			([ProductType_Name])
			
		values
		(''),
		('??????????????????')
	go 