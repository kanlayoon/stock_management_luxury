USE [luxury]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_branchProduct]    Script Date: 1/30/2018 4:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_get_branchProduct]
@Manager_Status int
as
begin
	
		select [dbo].[BranchProduct].[Branch_Id],
		[dbo].[BranchProduct].[BranchProduct_Id],
		[dbo].[Product].Product_Id,
		[dbo].[Product].Product_Name,
		[dbo].[BranchProduct].BranchProduct_Amount,
		[dbo].[BranchProduct].BranchProduct_EXP,
		[dbo].[Product].Product_Des,
		[dbo].[Product].Product_Instruction,
		[dbo].[ProductType].ProductType_Name,
		[dbo].[BranchProduct].[Notifications_Amount1],
		[dbo].[BranchProduct].[Notifications_Amount2],
		[dbo].[BranchProduct].[Notifications_Amount3],
		[dbo].[BranchProduct].[Notifications_Exp1],
		[dbo].[BranchProduct].[Notifications_Exp2],
		[dbo].[BranchProduct].[Notifications_Exp3]
		
		from [dbo].[BranchProduct],[dbo].[Product],[dbo].[ProductType]
		where [dbo].BranchProduct.Branch_Id=@Manager_Status and [dbo].[BranchProduct].Product_Id = [dbo].[Product].Product_Id and [dbo].[Product].ProductType_Id = [dbo].ProductType.ProductType_Id

end