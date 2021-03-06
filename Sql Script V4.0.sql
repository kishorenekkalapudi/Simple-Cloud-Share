USE [CloudShare]
GO
/****** Object:  Table [dbo].[RoleDetails]    Script Date: 12/09/2011 02:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleDetails](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RoleDetails] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RoleDetails] ON
INSERT [dbo].[RoleDetails] ([RoleId], [Role]) VALUES (1, N'User')
INSERT [dbo].[RoleDetails] ([RoleId], [Role]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[RoleDetails] OFF
/****** Object:  StoredProcedure [dbo].[CheckUserNameExists]    Script Date: 12/09/2011 02:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckUserNameExists](
@UserName varchar(50)
)

AS
DECLARE @Result varchar(50)
BEGIN

IF(EXISTS(SELECT * FROM UserDetails WHERE UserName=@UserName))
BEGIN
SET @Result='User Name Already Exists'
END

ELSE
BEGIN
SET @Result='User Name Available'
END
SELECT @Result AS Result
END
GO
/****** Object:  StoredProcedure [dbo].[UserChangePassword]    Script Date: 12/09/2011 02:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserChangePassword](
@UserId int,
@OldPassword varchar(50),
@NewPassword varchar(50)
)

AS
DECLARE @Result varchar(50)
BEGIN

IF(EXISTS(SELECT * FROM UserDetails WHERE UserId=@UserId AND Password=@OldPassword))
BEGIN
UPDATE UserDetails SET Password=@NewPassword WHERE UserId=@UserId AND Password=@OldPassword
SET @Result='Password Changed Successfully'
END

ELSE
BEGIN
SET @Result='Wrong Old Password'
END

SELECT @Result AS Result
END
GO
/****** Object:  Table [dbo].[Templates]    Script Date: 12/09/2011 02:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Templates](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](50) NOT NULL,
	[VirtualMachineName] [varchar](50) NOT NULL,
	[Image] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Templates__145C0A3F] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Templates] ON
INSERT [dbo].[Templates] ([TemplateId], [TemplateName], [VirtualMachineName], [Image]) VALUES (1, N'Debian Template', N'Rajeev', N'~/Images/DebianLogo.jpg')
INSERT [dbo].[Templates] ([TemplateId], [TemplateName], [VirtualMachineName], [Image]) VALUES (2, N'Fedora Template', N'team5@yahoo.com', N'~/Images/FedoraLogo.jpg')
SET IDENTITY_INSERT [dbo].[Templates] OFF
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/09/2011 02:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Gender] [varchar](9) NOT NULL,
	[DateOfBirth] [smalldatetime] NOT NULL,
	[EMailAddress] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetails] ON
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [UserName], [Password], [Gender], [DateOfBirth], [EMailAddress], [Address], [PhoneNumber], [Status]) VALUES (1, N'Rajeev Chowdary', N'Gurram', N'rajeev', N'sjsu', N'Male', CAST(0x7E060000 AS SmallDateTime), N'rajeev.sjsu@gmail.com', N'3939 Bidwell Drive,
Fremont', N'435-512-2332', 1)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [UserName], [Password], [Gender], [DateOfBirth], [EMailAddress], [Address], [PhoneNumber], [Status]) VALUES (2, N'Deepak', N'P', N'deepak', N'sjsu', N'Male', CAST(0x9F980000 AS SmallDateTime), N'rajeev.gurram@gmail.com', N'Sunnyvale', N'408-795-7155', 0)
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
/****** Object:  Table [dbo].[AdminDetails]    Script Date: 12/09/2011 02:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminDetails](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AdminDetails] ([UserName], [Password]) VALUES (N'admin', N'admin')
/****** Object:  Table [dbo].[VirtualMachineDetails]    Script Date: 12/09/2011 02:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VirtualMachineDetails](
	[VirtualMachineId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TemplateId] [int] NOT NULL,
	[UserVirtualMachineName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VirtualMachineDetails] PRIMARY KEY CLUSTERED 
(
	[VirtualMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[VirtualMachineDetails] ON
INSERT [dbo].[VirtualMachineDetails] ([VirtualMachineId], [UserId], [TemplateId], [UserVirtualMachineName]) VALUES (21, 1, 2, N'Rajeev Fedora')
INSERT [dbo].[VirtualMachineDetails] ([VirtualMachineId], [UserId], [TemplateId], [UserVirtualMachineName]) VALUES (22, 1, 1, N'Rajeev')
SET IDENTITY_INSERT [dbo].[VirtualMachineDetails] OFF
/****** Object:  Table [dbo].[VirtualMachineConfigurationDetails]    Script Date: 12/09/2011 02:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VirtualMachineConfigurationDetails](
	[VirtualMachineConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[VirtualMachineId] [int] NOT NULL,
	[RAM] [int] NOT NULL,
	[CPUCores] [int] NOT NULL,
	[CPU] [varchar](50) NOT NULL,
	[HardDisk] [bigint] NOT NULL,
 CONSTRAINT [PK_VirtualMachineConfigurationDetails] PRIMARY KEY CLUSTERED 
(
	[VirtualMachineConfigurationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[VirtualMachineConfigurationDetails] ON
INSERT [dbo].[VirtualMachineConfigurationDetails] ([VirtualMachineConfigurationId], [VirtualMachineId], [RAM], [CPUCores], [CPU], [HardDisk]) VALUES (11, 21, 1024, 2, N'2.5', 80)
INSERT [dbo].[VirtualMachineConfigurationDetails] ([VirtualMachineConfigurationId], [VirtualMachineId], [RAM], [CPUCores], [CPU], [HardDisk]) VALUES (12, 22, 512, 1, N'2.5', 80)
SET IDENTITY_INSERT [dbo].[VirtualMachineConfigurationDetails] OFF
/****** Object:  Table [dbo].[VirtualMachineCreditDetails]    Script Date: 12/09/2011 02:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VirtualMachineCreditDetails](
	[CreditId] [int] IDENTITY(1,1) NOT NULL,
	[VirtualMachineConfigurationId] [int] NOT NULL,
	[VirtualMachineId] [int] NOT NULL,
	[DateOfPurchase] [smalldatetime] NOT NULL,
	[Minutes] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[CardHolderFirstName] [varchar](50) NOT NULL,
	[CardHolderLastName] [varchar](50) NOT NULL,
	[EMailAddress] [varchar](50) NOT NULL,
	[Adddress] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZIPCode] [int] NOT NULL,
	[CreditCardNumber] [bigint] NOT NULL,
	[StartingDate] [smalldatetime] NOT NULL,
	[ExpirationDate] [smalldatetime] NOT NULL,
	[CVV] [int] NOT NULL,
 CONSTRAINT [PK_VirtualMachineCreditDetails] PRIMARY KEY CLUSTERED 
(
	[CreditId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[VirtualMachineCreditDetails] ON
INSERT [dbo].[VirtualMachineCreditDetails] ([CreditId], [VirtualMachineConfigurationId], [VirtualMachineId], [DateOfPurchase], [Minutes], [Cost], [CardHolderFirstName], [CardHolderLastName], [EMailAddress], [Adddress], [City], [State], [ZIPCode], [CreditCardNumber], [StartingDate], [ExpirationDate], [CVV]) VALUES (9, 11, 21, CAST(0x9FB303B1 AS SmallDateTime), 481, 48.0000, N'Rajeev', N'Chowdary', N'rajeev.gurram@gmail.com', N'3939 Bidwell Dr', N'Fremont', N'CA', 94534, 1234567890987654, CAST(0x9FB80000 AS SmallDateTime), CAST(0x9FCE0000 AS SmallDateTime), 234)
INSERT [dbo].[VirtualMachineCreditDetails] ([CreditId], [VirtualMachineConfigurationId], [VirtualMachineId], [DateOfPurchase], [Minutes], [Cost], [CardHolderFirstName], [CardHolderLastName], [EMailAddress], [Adddress], [City], [State], [ZIPCode], [CreditCardNumber], [StartingDate], [ExpirationDate], [CVV]) VALUES (10, 12, 22, CAST(0x9FB30578 AS SmallDateTime), 1, 0.1000, N'Rajeev', N'Gurram', N'rajeev.gurram@gmail.com', N'3939', N'Fremont', N'CA', 94534, 1234567890987654, CAST(0x9FC50000 AS SmallDateTime), CAST(0x9C290000 AS SmallDateTime), 124)
SET IDENTITY_INSERT [dbo].[VirtualMachineCreditDetails] OFF
/****** Object:  StoredProcedure [dbo].[UserRegister]    Script Date: 12/09/2011 02:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserRegister](
@FirstName varchar(50),
@LastName varchar(50),
@UserName varchar(50),
@Password varchar(50),
@Gender varchar(50),
@DateOfBirth varchar(50),
@EMailAddress varchar(50),
@Address varchar(100),
@PhoneNumber varchar(15)
)

AS
DECLARE @Result AS varchar(50)
BEGIN

	IF(EXISTS(SELECT * FROM UserDetails WHERE UserName=@UserName))
	BEGIN
	SET @Result='UserName You Entered Already Registered With Us'
	END
	
	ELSE
	IF(EXISTS(SELECT * FROM UserDetails WHERE EMailAddress=@EMailAddress))
	BEGIN
	SET @Result='E-Mail Address You Entered Already Registered With Us'
	END
	
	ELSE
	IF(NOT EXISTS(SELECT * FROM UserDetails WHERE UserName=@UserName OR EMailAddress=@EMailAddress))
	BEGIN
	INSERT INTO UserDetails VALUES(
									@FirstName ,
									@LastName ,
									@UserName ,
									@Password ,
									@Gender ,
									@DateOfBirth ,
									@EMailAddress ,
									@Address ,
									@PhoneNumber,									
									0)

	SET @Result='User Registered Successfully'
	END
SELECT @Result AS Result
END
GO
/****** Object:  StoredProcedure [dbo].[UserForgetPassword]    Script Date: 12/09/2011 02:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserForgetPassword](
@Email varchar(100)
)

AS
DECLARE @Password varchar(50)
BEGIN

IF(EXISTS(SELECT Password FROM UserDetails WHERE EMailAddress=@Email))
BEGIN
SELECT @Password=Password FROM UserDetails WHERE EMailAddress=@Email
END

ELSE
BEGIN
SET @Password='E-Mail Address You Are Entered Not Registered With Us'
END
SELECT @Password AS Password
END
GO
/****** Object:  StoredProcedure [dbo].[CreateVirtualMachine]    Script Date: 12/09/2011 02:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateVirtualMachine](
@UserId int,
@TemplateId int,
@VmName varchar(50),
@NoOfMinuites int,
@Cost money,
@CardHolderFirstName varchar(50),
@CardHolderLastName varchar(50),
@EMailAddress varchar(50),
@Address varchar(50),
@City varchar(50),
@State varchar(50),
@ZipCode int,
@CreditCardNumber bigint,
@StartDate smalldatetime,
@ExpiryDate smalldatetime,
@CVV int
)


AS
DECLARE @NoOfVms int
DECLARE @Result varchar(50)
DECLARE @VmId int
DECLARE @VmCId int
BEGIN

SELECT @NoOfVms=COUNT(*) FROM VirtualMachineDetails WHERE UserId=@UserId

	IF(@NoOfVms>=3)
	BEGIN
	SET @Result='You Are Exceded The Limit Of Creation Of Virtual Machines'
	END
	
	
	
	
	ELSE
	BEGIN
	INSERT INTO VirtualMachineDetails VALUES(@UserId,@TemplateId,@VmName)
	
	
	SELECT TOP 1 @VmId=VirtualMachineId FROM VirtualMachineDetails ORDER BY VirtualMachineId DESC
	
	
	INSERT INTO VirtualMachineConfigurationDetails VALUES(@VmId,512,1,2.5,80)
	
	SELECT TOP 1 @VmCId=VirtualMachineConfigurationId FROM VirtualMachineConfigurationDetails ORDER BY VirtualMachineConfigurationId DESC
	
	
	INSERT INTO VirtualMachineCreditDetails VALUES
           (           
            @VmCId,
            @VmId,
            GETDATE(),
			@NoOfMinuites,
			@Cost,
			@CardHolderFirstName,
			@CardHolderLastName,
			@EMailAddress,
			@Address,
			@City,
			@State,
			@ZipCode,
			@CreditCardNumber,
			@StartDate,
			@ExpiryDate,
			@CVV)
	SET @Result='Virtual Machine Created Successfully'			
	END
SELECT @Result AS Result
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteVirtualMachine]    Script Date: 12/09/2011 02:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteVirtualMachine](
@VirtualMachineId int
)

AS
BEGIN

DELETE FROM VirtualMachineCreditDetails WHERE VirtualMachineId=@VirtualMachineId

DELETE FROM VirtualMachineConfigurationDetails WHERE VirtualMachineId=@VirtualMachineId

DELETE FROM VirtualMachineDetails WHERE VirtualMachineId=@VirtualMachineId

END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 12/09/2011 02:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login](
@UserName varchar(50),
@Password varchar(50),
@RoleId int)

AS
DECLARE @UID AS int
DECLARE @FN AS varchar(50)
DECLARE @LN AS varchar(50)
DECLARE @UserExists AS int
DECLARE @UserStatus AS int
DECLARE @AdminStatus int 
BEGIN

IF(@RoleId=1)

	BEGIN
		SELECT @UID=UserId,@FN=FirstName,@LN=LastName FROM UserDetails WHERE UserName=@UserName AND Password=@Password
		IF(@UID!=0)
		BEGIN
		SET @UserExists=1
			IF(EXISTS(SELECT * FROM UserDetails WHERE UserName=@UserName AND Password=@Password AND Status=1))
			BEGIN 
			SET @UserStatus=1			
			END
				ELSE
				BEGIN
				SET @UserStatus=0	
				END
		END
		ELSE
		BEGIN
		SET @UserExists=0
		END
		SELECT @UserExists AS UserExists,@UserStatus AS Status,@UID AS UserId,@FN AS FirstName,@LN AS LastName
	END	
	
IF(@RoleId=2)
	BEGIN
	IF(EXISTS(SELECT * FROM AdminDetails WHERE UserName=@UserName AND Password=@Password))
		BEGIN
		SET @AdminStatus=1
		SELECT @AdminStatus AS AdminStatus
		END
	ELSE
		BEGIN
		SET @AdminStatus=0
		SELECT @AdminStatus AS AdminStatus
		END
END

END
GO
/****** Object:  ForeignKey [FK_VirtualMachineConfigurationDetails_VirtualMachineDetails]    Script Date: 12/09/2011 02:35:46 ******/
ALTER TABLE [dbo].[VirtualMachineConfigurationDetails]  WITH CHECK ADD  CONSTRAINT [FK_VirtualMachineConfigurationDetails_VirtualMachineDetails] FOREIGN KEY([VirtualMachineId])
REFERENCES [dbo].[VirtualMachineDetails] ([VirtualMachineId])
GO
ALTER TABLE [dbo].[VirtualMachineConfigurationDetails] CHECK CONSTRAINT [FK_VirtualMachineConfigurationDetails_VirtualMachineDetails]
GO
/****** Object:  ForeignKey [FK_VirtualMachineCreditDetails_VirtualMachineConfigurationDetails]    Script Date: 12/09/2011 02:35:46 ******/
ALTER TABLE [dbo].[VirtualMachineCreditDetails]  WITH CHECK ADD  CONSTRAINT [FK_VirtualMachineCreditDetails_VirtualMachineConfigurationDetails] FOREIGN KEY([VirtualMachineConfigurationId])
REFERENCES [dbo].[VirtualMachineConfigurationDetails] ([VirtualMachineConfigurationId])
GO
ALTER TABLE [dbo].[VirtualMachineCreditDetails] CHECK CONSTRAINT [FK_VirtualMachineCreditDetails_VirtualMachineConfigurationDetails]
GO
/****** Object:  ForeignKey [FK_VirtualMachineCreditDetails_VirtualMachineDetails]    Script Date: 12/09/2011 02:35:46 ******/
ALTER TABLE [dbo].[VirtualMachineCreditDetails]  WITH CHECK ADD  CONSTRAINT [FK_VirtualMachineCreditDetails_VirtualMachineDetails] FOREIGN KEY([VirtualMachineId])
REFERENCES [dbo].[VirtualMachineDetails] ([VirtualMachineId])
GO
ALTER TABLE [dbo].[VirtualMachineCreditDetails] CHECK CONSTRAINT [FK_VirtualMachineCreditDetails_VirtualMachineDetails]
GO
/****** Object:  ForeignKey [FK_VirtualMachineDetails_Templates]    Script Date: 12/09/2011 02:35:46 ******/
ALTER TABLE [dbo].[VirtualMachineDetails]  WITH CHECK ADD  CONSTRAINT [FK_VirtualMachineDetails_Templates] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Templates] ([TemplateId])
GO
ALTER TABLE [dbo].[VirtualMachineDetails] CHECK CONSTRAINT [FK_VirtualMachineDetails_Templates]
GO
/****** Object:  ForeignKey [FK_VirtualMachineDetails_UserDetails]    Script Date: 12/09/2011 02:35:46 ******/
ALTER TABLE [dbo].[VirtualMachineDetails]  WITH CHECK ADD  CONSTRAINT [FK_VirtualMachineDetails_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[VirtualMachineDetails] CHECK CONSTRAINT [FK_VirtualMachineDetails_UserDetails]
GO
