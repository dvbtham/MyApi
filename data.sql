USE [master]
GO
/****** Object:  Database [VungKhaLuanDb]    Script Date: 11/20/2017 15:53:04 ******/
CREATE DATABASE [VungKhaLuanDb] ON  PRIMARY 
( NAME = N'VungKhaLuanDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\VungKhaLuanDb.mdf' , SIZE = 5376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VungKhaLuanDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\VungKhaLuanDb_log.LDF' , SIZE = 6912KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VungKhaLuanDb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VungKhaLuanDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VungKhaLuanDb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET ARITHABORT OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET AUTO_CLOSE ON
GO
ALTER DATABASE [VungKhaLuanDb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [VungKhaLuanDb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [VungKhaLuanDb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [VungKhaLuanDb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET  ENABLE_BROKER
GO
ALTER DATABASE [VungKhaLuanDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [VungKhaLuanDb] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [VungKhaLuanDb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [VungKhaLuanDb] SET  READ_WRITE
GO
ALTER DATABASE [VungKhaLuanDb] SET RECOVERY SIMPLE
GO
ALTER DATABASE [VungKhaLuanDb] SET  MULTI_USER
GO
ALTER DATABASE [VungKhaLuanDb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [VungKhaLuanDb] SET DB_CHAINING OFF
GO
USE [VungKhaLuanDb]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'd4f85e40-0054-4892-a931-57fb7565d111', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f5c9f7d4-2180-4723-b02c-15a8e9179d03', N'Mod')
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201711171125313_InitialDB', N'LeHuuKhoa.Persistence.Migrations.Configuration', 0x1F8B0800000000000400DD5D5B6FDCB8157E2FD0FF3098A7B6F07A1C7B374D037B175E3BEE1A1B2746C659F4CDA0257A2C4497595DB2768BFEB23EF427F52F941475E15522298EA459043032BC7C240F0F0F0F0FA973FEF79FFF9EFEF01C858BAF30CD82243E5BBE3A3C5A2E60EC257E106FCE9645FEF8CD9BE50FDFFFF10FA7EFFCE879F14B5DEE04974335E3EC6CF994E7DBB7AB55E63DC108648751E0A549963CE6875E12AD809FAC8E8F8EFEB67AF56A0511C412612D16A79F8A380F2258FE403F2F92D883DBBC00E14DE2C330ABD251CEBA445D7C0011CCB6C08367CBF7F0A7A2F8F9290187B7B837598EBA0B978BF33000A8336B183E2E17208E931CE4A8AB6F3F67709DA749BC596F510208EF5EB610957B046106AB21BC6D8BEB8EE6E8188F66D556ACA1BC22CB93C810F0D549459E155FDD8AC8CB867C8880EF10A1F3173CEA928867CBDB24CB2F400E3749FAB25CF00DBEBD08535C98A6F34592C24332318774ED834553E6A0610DC441F8DFC1E2A208F3228567312CF21484078BDBE2210CBC9FE1CB5DF205C667711186744F515F511E9380926ED3640BD3FCE5137CACFA7FED2F172BB6DE8AAFD854A3EA9051215E409CBD5CDC80E7F730DEE44F88E78F102F5F05CFD0AF532AE6F81C076821A04A795AA09F1F5087C143089BFC55679BF8EFF8AD5E06D936042F1F531FA675EB3FBEE4E640D711D8C0CF69D83184E3EF5EEF62083F02EFCB264D8AD82FFB307E07D64F499A5FC2CC4B832D5E13594717D07FB5BAD0336B6E1BEB1BEF07F035D894CB9DEB075EDDA8039F6058E6664FC19688D472DDDFB762E32A4DA24F4958556932EEEF40BA81391A4222CB5D2745EA71DD395DB512AA576ED9C9AB7D9453D771FEFA5BC94C52235FE7689C7F87314C117DFD5B90E7308D31062C49D7C77377411E4E20A0D661B199402CB60B6CE78B1929334827C977DF4EB5ACA6D8DC2E51DB1729C48C57378E93EE82C80EEBF3D697637557BD8139406BEAB724EDA2811B72E3B6C664A3F32247FB50F7E41EBF71D0D02F01FC2DA3E4CEC9B1B9B290DD26DB22042911D295DA91A02D00C436605802674F2D3FD8435DC210E6C381F0B830423319F59E4812AD375C32C9EA1DB7CEE7F65B92DCECA7CC6E5BE5D53BB16E4FDABDDD7EF797F647D00D747B74158450AD8CE0DC7BC26E6C779A0CA932D2E60E5246CEB75BA42394FD4207CCD45C2FE100F65145192090F6E22835E1092848F3271FBC0CDE5A9176489D036503D809E5DE45207041368D5690B2F518A49103090FB20CEB113F81EC69E77BFB1A7A458A24CA3A07D176E7ADDD3E2531FC50440F9DACE0BC2D675373F75B72053C74DA7917E35A83F1DE27DE97A4C8DFC57EA97AE69EA9DAD90038E9CEB9E7C12CBB42CC0CFD8BA4684F0E76BA18DE4E7A04A62BB1A55626421044F2BD9BDBF8EEEBA2ED262E2F2128178A62A65AC6FB6413C47A5DAD8BAABB4A4AF476B52A66DA550CA6D7D3AAA4BAA36581DE7E9252B26E6A2B4AB53502E39533D4A52ADD3456EDF36CFB01E68775ED43827B95224C24A4BF1C0AB0070BEDCAAD8275ACAB609DBC7A783C79F3DD6BE09FBCFE169E7C37893D482A0BDCD9833029A750EECAE963CE563B3398E0967E0161E1BA29ABD5500A01F7ABA1849DFF6A28BB8992BF06A582BAEAAF511746F05AE56B7E365D735CCFC65E0ECC30C76E7C1C1960B55CF05EE47EB560D4F92F16392B4B8BE201D970FD54D2BFEEEF4C38AE3611D95D34E19AD3587270EB9A1C823B69C3217513DDF753DDB35DB76D84D16920ECB60F921212FB60F94766AE6C734DB573628BB4B7562A7BC3D832ADB8DA8EA3A7E3E6B95F9DF61CAFDD68AB98FCEBE09F70983500A30817176DA21BA97903E3C29CBF70AD3DE5AF1D1FC546E1AF5BB0E9DE792DADB46A01593EE691094894718FB9813159B4A9E2454E9B35EC4949D923E39D1ED5DA47BE1DEFFE6224F3E3CEDF8D8DF5CEC3F48818C477C94F494B636DCBB3726D56ABCF66710A7A8BB86E071DFEDC1FFCF6E3D0F73BB99CDDF95D033EB9CA59979EEFFBAA58CBC262AEC0CA9222662C5D44DCD992685DD7D9550836ED2B749BB326CE77B00BA169F0611ABEA069A3B51B96F63710DFE7318789D28C8AAFDE8589620A3732B22A7F7C24928E10A98370ADBA3A947035D22484AB76A59A72DD84BB4CBC22A229C7535A4EB9F32C4BBCA0A485FCA54A7DDFC636FD2EF6177A976FED214278027383C816E034B414F0F87811F731268FB116E71EF932E202641EF0C5A58E46E61BF6AFD110DBFE496E9ED81EFE456818095F98E25A00BF2BC8D0E407712E4AEA20F6822D08B528C6D5D694F498084D3B7CCE25DCE2671D71AE45129D0E28ED8BABA62D6E86FA2875BAA238D18C41AB5B565D06E0AF5CE7C6A0DC5DAF8241ABCBA0511894A5D8040CCA9264EF18945CAEEBCE3F77D33E37F664AFF815DC4954F051989321D704BCC9D063F6AC49BF1156CDB8F4C130FB88B97F6EE57012B6E9E1EAA3C34351F1B1621C493F4660170931755A6DDFF24FC726CDF3EDCE9915DF720F6415F1D33016B07D55BE43F967CF617CF7C7E2317E1E74DAA53F089A8CCFDA7BB72EB6905CC2B16C414E9966BC26DEDD71771EF3E431A1DB23F19830073AEDCA6F8FC7E6AF5212F5B2027BADEA88BFD82F4BBA85E38CF88BEEF698FC45CF814EBBCA870CA3F0576BEB56F281C4F04D314169E1D15079A48012AE2237AB3BD1BCC5918CC117C268B598A2BAAA9C8429245664D55C769994C59395EC54B5A3535F87217BFC239F9A4A2330A09A123A8DCB5FD7ED8411C99502B69FA31A8D59983A5E5D3E94C6F56799530434B0CA129E55F72B3C6760F035CC59CD31C01F0DB47719522D5D10642C52E541420AD25BB9BAA3112A0B87CA1E1CC1F42B0395D8870D60EB6F413A612BAB9E016CF5E146272A599A1AF3507D402B9D0BA2FFF480A800B42A5777C64265B2A5F5751F497C69D7CB0DB6A7721F11A504A496618BA4FA58892ADCFD59132F27B42F5A9A3135AB429039DA972214966C65F0FB084B090B2AD56BA39F4A325BBF89B57F109538CBBC824AF5609C53A9E2D27E2249ECCD0616E7412462ADC30A0A5503194C20C6E1814816A5ADB3D7DA49F5BBDA9E3A4820B36FF6D1D076B0EDAEAA18AEDC66A761B5331FB260A7A32068F5C0C9C8A9C7D9F2912BAC481A76246EE4D516D6337AD17244C14821860C9CE8421D0317CD1B1A060EFB8133268D3ECEB11938F5844C326AC5A1BBEFD84D7794680B5D63154FD954FDAA6F83072A7B70240EB8EF40A97BA4A4062015C1BA27404762BD7E05D51C599ABCD315F1E259259CAE14EE3E4F6FC0761BC41BCAFD6795B25813DF9F17DFACCD3D62460463E53174E60F584D4B79922266E172F14B261F5E0569965F821C3C00FCFAE8C28F8462D2039A425DAD9B14CE60E234D69A6C5D05FFBFFA5C51E60E953DB38927DB0AE60A8D143F322A070DB995AFAEBEC06E5901F6F624BE3EBC48C2228AD54775756DF28E90AE4F52F41158DF9734129BA38FD8BA8061C6D5A4EA23098F93694021531F57E2AB924696641BD05309DB8778BAE2384CB097082C2D18B3D845A2B584C886E566F558AE9AB1564BE5BD9106A8920C78A774C5C8B04B9962C5214A0631C16B9E8BD2584DA2010E7513CA4075DC90768C927676C88C92CE30C36B1C1EF2784D863E1EE30591C66332CCF094332B64EAE3B6AF206840F5DB083552E5B29086A9920C643BEBB390598A6C961166EBBA90436C334CF01AFF852C5A93AC8FD53E3FA7A1DAD4D94871954A6C2AC579ABB1B940EF4598AB26E4506F695CD1310A4B93AA8F54FBA2A371EA347D94CAB51C0D5225196250DEC904302ACF607D310EE49835C6E418ECCFAC973866A366B30C7A49FB82633A496758E129282A2F61A0E908DEDF18A547C8D54796F881A3A125D916D8923EF379063BA8E82A8ED94AC56C7DECD66F1C0DD9A6CE667F90DC610CDF2CC4DB40F3ED420363371B46FD06999F383314CA1117A333B7C9865895AB2D01AC4A9F2543296FA4863014B9071EC6500A0CB5FC61BC58B1E2A7D3F5961A93714DC588F82ED75C6A3C33B69D0173A86EE286F04679193D8C35E410BB1516F54B181A45F53A66527B10B907716313925D4869DA85E455BBCE6A3C75552F23D528F55B5D1A45F57E77B23972353F967363362F539FEB5A9F40FC9C9254332471AF6F5367C31FAA9B4153FE289F1D99F387BCDA5CF9A37E28CB9E3EE58F67A793CAE56DAD03898CAF4A2CA4B1B4DA5C677457F746AE2CED942F1A86E9DAE4D9F09D6BED6DA0E666A6B58DC5873B9D1BE189005FA469BD4A697E374F04AAEBF9FE30A1C27D3D29B25CD48795B3E5FA05CD6874880B1CAE7F0D2FC2A064FEBAC00D88834798E5C4E9C7F2F8E8E80D1766743E213F5759E6332EC57AE27EB27336823FA2F82B48BD27908A815B06B81B72062A8B9A9907F14B80F96160D81869274BAF486EFC9B39C35786BDAC5BF853049EFF4CC3DA86B654020E75DD3B3E5F3F049B92497A3D3E9AC63CA1A3333AE3733AF8A2BBC52306C51BC4319C5FBD6158428CC476D8C25733D7B10F9FCF96FF2AEBBE5D5CFFE3BEAD7EB02885C3DBC5D1E2DFC32926464FC497FE3822F631DE7FA0179030DB7F75114C51035A37FE21176B71D0D428E2290EC2E463261A4D765D593DD5D8819E598798D88A56BB892CB2E2436005C44755B483E1222ADA80F0D114FB09631D986F268A0ECB39D3293ABB534EB89075B5D01918B24EDE3FF3713311E974066D1F80CE6A414882CF0D1284D2007383102541E45CE13921A12A489C0D9632409C8CAB75062B0F1867D33565B0389BCD850F15A7BF5DD635CBE483C575F6390E7E2D50C61DA206B76DF68B9301D1C44697EF3BD1F6D9E82B465A0BA9AAABB3D845E41AA6820B51B70CE00644D6B2E08C3D0B4AE54CD5B815634E39C39E92B5ED034D5930CFE8419AA616136CE826A3DE90AA63CCACFCEE7DA641956A639206054945968283823119B44D2A1AB46D16A8E87763C393A956565B281F0AC846D7E30301393C738B77E47BAB88399B3236BA8E9170245595C2B1F7A06A16FE661E06121B9343AF8164E44B1697B66DBB3830FD074ABBE82BF3E0117746B4BE458807BDFBD3ADEB580D33F02E2EF1A945F569A2880C63BA95EBFA7CC0E0C830FFB80B3363B6CAD39A82D9468CAE3036B3A93E2D9839B319C5509819AF11F7710A561B2F54C2D89CA678EE363346D389883080BDFA9CF95297B4062EF3F7851D147E31C476F626DE41EB818D9BB451C2124CC3383DBE81A6E39A3D895F40FCD65173B5F3D002A2CF364B7FF656FCA2F8B266277CA2DDD69EC421183744C0B47CA2BDCEC7E4937D882730348400F1A84C61EC386AC01893ACF85C4B32C17B181B602EE100A63CCDF47C45338FA3CCE4FEFE45AF93FC9C561FDB50E2AE555D5BBBA354B3255FC49C2DFD87047100B15F522564EE7E65ED29BDFDABF0FB61855398D0825042D61809EC2D77D9CC3729314E0A8D4ACA7437AB70B1DED57665ABEA6CBB2AD3DDB6C2717957DB64B977364D8A74B72CF71C2B631DA28D48D98764A95848EE93996F4201AF86D68325DBAB004B9265B072FFC20241CA9D5F2446992C2584CCEDB172827B26B76F62E5933A71D404C679714F9410E50EC8AC7685231F61779D719004274461C490C2198D7BA2EC2A26821392D00B48EE836538419CC4407035787A736F1DDC3A1AA4ABD807BCB623FAAF9E6A884E821CD05B58EBB0A46F48422D65C89F89C318F4D27EDCA1B9095420C426E81C14AD4DB42E47860F66C7C108A4925026054791A706C107440F02E8D456C4F8B30EF2EB1266C1A68538459831F498F35A53E63A7E4CEA6323D7A3BA88E4B3471F1DE6CED33C78045E8EB2F1171D41BC592ECA57F2F8BBA207E85FC71F8B7C5BE468C8307A081931868F9F5DED971116D83E9F7E249F60BB1802EA6680BF84F918FF5804A1DFF4FB4AF2F6450181CFB5D5B33D3C97397EBEB77969903E24B1265045BEE6387E07A36D88C0B28FF11A7C85367D43ECF71E6E80F7D2BEB75781F44F044BF6D3CB006C52106515465B1FFD443CEC47CFDFFF1F327F192595B70000, N'6.1.3-40302')
/****** Object:  Table [dbo].[PostCategories]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCategories](
	[Id] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DisplayOrder] [tinyint] NOT NULL,
	[ImageUrl] [nvarchar](256) NOT NULL,
	[BackgroundImage] [nvarchar](256) NOT NULL,
	[ShortDescriptions] [nvarchar](max) NULL,
	[Descriptions] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.PostCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'duyen-luan', N'Duyên Luận', 2, N'/Content/UserFiles/images/category/duyen-luan.png', N'/Content/UserFiles/images/backgroundImages/duyen%20luan%202.png', NULL, N'<p dir="ltr" style="text-align:center"><strong>Ngỏ </strong></p>

<p dir="ltr" style="text-align:center">&laquo;Một duy&ecirc;n, hai nợ, ba t&igrave;nh&raquo;</p>

<p style="text-align:center">Một duy&ecirc;n, nếu kh&ocirc;ng t&igrave;m m&agrave; gặp th&igrave; gọi l&agrave; duy&ecirc;n? Chưa đủ, nếu đ&uacute;ng l&agrave; duy&ecirc;n, th&igrave; phải n&acirc;ng niu, &ocirc;m ấp, che chở, sống thở với duy&ecirc;n.</p>

<p style="text-align:center">Hai nợ, nếu nhớ duy&ecirc;n m&agrave; phải mang nợ, th&igrave; chắc con nợ ch&oacute;ng chầy sẽ mang lại &acirc;n: &acirc;n t&igrave;nh để bảo vệ nh&acirc;n duy&ecirc;n.</p>

<p style="text-align:center">Ba t&igrave;nh, nhờ duy&ecirc;n m&agrave; c&oacute; &acirc;n t&igrave;nh, gạt &acirc;n o&aacute;n, đủ lực biến nh&acirc;n t&igrave;nh th&agrave;nh nh&acirc;n t&iacute;nh, l&agrave;m ra v&ocirc; v&agrave;n nh&acirc;n nghĩa, nh&acirc;n đạo, nh&acirc;n từ&hellip;&nbsp;</p>

<p dir="ltr" style="text-align:center"><strong>Tựa</strong></p>

<p dir="ltr" style="text-align:center">&laquo;Nhờ duy&ecirc;n ta biết qu&ecirc; m&igrave;nh nơi đ&acirc;y&raquo;</p>

<p dir="ltr" style="text-align:center">Nhờ duy&ecirc;n, l&agrave; nhờ quen, nhờ chỗ, nhờ người, như vậy cũng đủ l&agrave;m h&agrave;nh trang cho kiếp l&agrave;m người, v&igrave; ta sống v&igrave; người m&agrave;, v&igrave; người n&agrave;y, v&igrave; người kia, v&igrave; mọi người.</p>

<p dir="ltr" style="text-align:center">Qu&ecirc; m&igrave;nh, qu&ecirc; m&igrave;nh vừa l&agrave; qu&ecirc; ta, vừa l&agrave; qu&ecirc; người, kh&ocirc;ng c&ograve;n bi&ecirc;n giới c&aacute;ch biệt m&igrave;nh-ta-người, đ&acirc;u cũng l&agrave; qu&ecirc; m&igrave;nh, đ&acirc;u cũng l&agrave; nh&agrave;&hellip;</p>

<p dir="ltr" style="text-align:center">Qu&ecirc; m&igrave;nh nơi đ&acirc;y, b&acirc;y giờ v&agrave; nơi đ&acirc;y l&agrave; của m&igrave;nh, th&igrave; khi sống ta đừng sợ th&agrave;nh bụi đời, khi qua đời đừng sợ th&agrave;nh oan hồn.</p>

<p dir="ltr" style="text-align:center"><strong>Nhập</strong></p>

<p dir="ltr" style="text-align:center"><em>&laquo;L&agrave;m sao qu&eacute;t sạch trần duy&ecirc;n&raquo; (Quan &Acirc;m Thị K&iacute;nh)</em></p>

<p style="text-align:center">Nếu trần duy&ecirc;n kh&ocirc;ng được qu&eacute;t sạch trong trần thế, th&igrave; đừng lo sợ, m&agrave; n&ecirc;n mừng vui, vui sống để gặp, để chuẩn bị gặp gỡ v&ocirc; c&ugrave;ng, v&ocirc; tận tất cả trần duy&ecirc;n!</p>
')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'khoa-hoc-luan', N'Khoa Học Luận', 8, N'/Content/UserFiles/images/category/khoa-hoc-luan.png', N'/Content/UserFiles/images/C%C3%81C%20PH%C6%AF%E1%BB%9ANG%20PH%C3%81P%20Ti%E1%BA%BEP%20C%E1%BA%ACN%20C%C4%82N%20B%E1%BA%A2N%20C%E1%BB%A6A%20KHNVXH-01.png', N'', N'<p>M&ocirc; tả về Khoa Học Luận</p>
')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'kiep-luan', N'Kiếp Luận', 3, N'/Content/UserFiles/images/category/kiep-luan.png', N'/Content/UserFiles/images/backgroundImages/kiepluan2.png', NULL, N'<p dir="ltr" style="text-align:center"><strong>Ngỏ </strong></p>

<p dir="ltr" style="text-align:center">Khốn kh&oacute;, khốn c&ugrave;ng, khốn nỗi, khốn nạn trong kiếp, trong phận, trong đời, trong cuộc sống, sao lại n&ecirc;n tha thứ, bao dung, khoan hồng, rộng lượng với tất cả? Ta đang đi đ&acirc;u trong kiếp ta đ&acirc;y? Xin trả lời: ta đang đi t&igrave;m &aacute;nh s&aacute;ng để ra khỏi đường hầm tối tăm&hellip; để gặp&hellip; người!</p>

<p dir="ltr" style="text-align:center"><strong>Tựa</strong></p>

<p dir="ltr" style="text-align:center">Kiếp (phải) thức, v&igrave; c&oacute; kiếp ngủ của những ai đ&atilde; chấp nhận như cam phận c&aacute;i kiếp của m&igrave;nh; ngược lại cũng c&oacute; kiếp thức, thức để chuyển, để đổi, để h&oacute;a kiếp thấp, h&egrave;n, nhục, nhược qua một kiếp kh&aacute;c hay, đẹp, tốt, l&agrave;nh hơn.</p>
')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'ly-thuyet-luan', N'Lý Thuyết Luận', 10, N'/Content/UserFiles/images/category/ly-thuyet-luan.png', N'/Content/UserFiles/images/backgroundImages/ly%20thuyet%20luan2.png', NULL, N'<p>M&ocirc; tả về L&yacute; Thuyết Luận</p>
')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'nghe-luan', N'Nghệ Luận', 5, N'/Content/UserFiles/images/category/nghe-luan.png', N'/Content/UserFiles/images/backgroundImages/nghe%20luan%202.png', NULL, N'<h4 style="text-align:center"><strong>Ngỏ</strong></h4>

<p style="text-align:center">&laquo;Nhất nghệ tinh&raquo;<br />
Đ&atilde; trao nghệ, th&igrave; giữ lấy nghề, th&igrave; mang lấy nghiệp.</p>

<h4 style="text-align:center"><strong>Tựa</strong></h4>

<p style="text-align:center">&laquo;Đ&atilde; mang lấy nghiệp v&agrave;o th&acirc;n,</p>

<p style="text-align:center">Chớ đừng tr&aacute;ch lẫn trời gần trời xa&raquo; (Nguyễn Du)<br />
Đ&atilde; mang lấy nghiệp th&igrave; đừng nhắc tới trời, đừng tr&aacute;ch tới th&acirc;n.</p>

<h4 style="text-align:center"><strong>Nhập</strong></h4>

<p style="text-align:center">&laquo;Sinh nghề, tử nghiệp&raquo;<br />
Nếu sinh ra m&agrave; c&oacute; nghề th&igrave; l&agrave; chuyện tốt, chuyện l&agrave;nh.<br />
Nếu nghề th&agrave;nh nghiệp cho tới chết, th&igrave; l&agrave; chuyện hay, chuyện đẹp?</p>
')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'nhan-luan', N'Nhân Luận', 1, N'/Content/UserFiles/images/category/nhan-luan.png', N'/Content/UserFiles/images/backgroundImages/tam%20luan2.png', NULL, N'<p style="text-align:center"><strong><em>Ngỏ</em></strong></p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết nhận diện được c&aacute;i <em>hay, đẹp, tốt, l&agrave;nh</em><em>,</em></p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết qu&yacute; y&ecirc;u <em>nh&acirc;n loại, nh&acirc;n thế, nh&acirc;n sinh</em></p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết qu&yacute; trọng <em>nh&acirc;n đạo, nh&acirc;n từ, nh&acirc;n nghĩa</em></p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết qu&yacute; mến <em>nh&acirc;n tri, nh&acirc;n tr&iacute;, nh&acirc;n t&iacute;nh</em>.</p>

<p style="text-align:center"><strong><em>Tựa</em></strong></p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết bảo vệ sự thật, ch&acirc;n l&yacute;, lẽ phải.</p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết bảo vệ kiến thức, tri thức, &yacute; thức</p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết dụng l&yacute; luận, lập luận, giải luận, diễn luận,</p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết đứng về ph&iacute;a nước mắt tranh luận để trao luận.</p>

<p style="text-align:center"><strong><em>Nhập</em></strong></p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống kh&ocirc;ng l&ugrave;i bước trước c&aacute;i <em>th&acirc;m, &aacute;c, độc, hiểm</em>,</p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống kh&ocirc;ng ch&ugrave;ng bước trước c&aacute;i <em>xấu, tồi, tục, dở,</em></p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết chống bất c&ocirc;ng, tham nhũng, độc t&agrave;i&hellip;</p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết đứng hẳn về ph&iacute;a <em>nh&acirc;n quyền</em>!</p>

<p style="text-align:center">Nh&acirc;n l&agrave; người khi sống biết đứng về ph&iacute;a nước mắt!</p>

<p style="text-align:center">&nbsp;</p>
')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'phuong-phap-luan', N'Phương Pháp Luận', 9, N'/Content/UserFiles/images/category/phuong-phap-luan.png', N'/Content/UserFiles/images/C%C3%81C%20PH%C6%AF%E1%BB%9ANG%20PH%C3%81P%20Ti%E1%BA%BEP%20C%E1%BA%ACN%20C%C4%82N%20B%E1%BA%A2N%20C%E1%BB%A6A%20KHNVXH-01.png', N'', N'<p>&nbsp;</p>

<p>&nbsp;</p>
')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'thi-luan', N'Thi Luận', 6, N'/Content/UserFiles/images/category/thi-luan.png', N'/Content/UserFiles/images/C%C3%81C%20PH%C6%AF%E1%BB%9ANG%20PH%C3%81P%20Ti%E1%BA%BEP%20C%E1%BA%ACN%20C%C4%82N%20B%E1%BA%A2N%20C%E1%BB%A6A%20KHNVXH-01.png', N'', N'Mô tả về Thi Luận')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'tinh-luan', N'Tình Luận', 4, N'/Content/UserFiles/images/category/tinh-luan.png', N'/Content/UserFiles/images/backgroundImages/tinh%20luan%202.png', NULL, N'<h4 dir="ltr" style="text-align:center"><strong>Ngỏ </strong></h4>

<p dir="ltr" style="text-align:center">&laquo;Nhất nghệ tinh&raquo;</p>

<p dir="ltr" style="text-align:center">Đ&atilde; trao nghệ, th&igrave; giữ lấy nghề, th&igrave; mang lấy nghiệp.<br />
&nbsp;</p>

<h4 dir="ltr" style="text-align:center"><strong>Tựa</strong></h4>

<p dir="ltr" style="text-align:center">&laquo;Đ&atilde; mang lấy nghiệp v&agrave;o th&acirc;n,</p>

<p dir="ltr" style="text-align:center">Chớ đừng tr&aacute;ch lẫn trời gần trời xa&raquo; (Nguyễn Du)</p>

<p dir="ltr" style="text-align:center">Đ&atilde; mang lấy nghiệp th&igrave; đừng nhắc tới trời, đừng tr&aacute;ch tới th&acirc;n.<br />
&nbsp;</p>

<h4 dir="ltr" style="text-align:center"><strong>Nhập</strong></h4>

<p dir="ltr" style="text-align:center">&laquo;Sinh nghề, tử nghiệp&raquo;</p>

<p dir="ltr" style="text-align:center">Nếu sinh ra m&agrave; c&oacute; nghề th&igrave; l&agrave; chuyện tốt, chuyện l&agrave;nh.</p>

<p dir="ltr" style="text-align:center">Nếu nghề th&agrave;nh nghiệp cho tới chết, th&igrave; l&agrave; chuyện hay, chuyện đẹp?</p>
')
INSERT [dbo].[PostCategories] ([Id], [Name], [DisplayOrder], [ImageUrl], [BackgroundImage], [ShortDescriptions], [Descriptions]) VALUES (N'van-luan', N'Văn Luận', 7, N'/Content/UserFiles/images/category/van-luan.png', N'/Content/UserFiles/images/backgroundImages/phuong%20phap%20luan2.png', NULL, N'<p>dsdf</p>
')
/****** Object:  Table [dbo].[Pages]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[BackgroundImage] [nvarchar](256) NULL,
	[Content] [nvarchar](max) NOT NULL,
	[PinToHome] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Pages] ([Id], [Name], [BackgroundImage], [Content], [PinToHome]) VALUES (N'trang-chu', N'Trang chủ', N'/Content/UserFiles/images/backgroundImages/vkl-min.jpg', N'<h3>V&ugrave;ng Khả Luận</h3>

<p>V&ugrave;ng xin được hiểu như kh&ocirc;ng gian trong đ&oacute; nh&acirc;n loại, nh&acirc;n thế, nh&acirc;n sinh ăn ở sao cho c&oacute; hậu với nh&acirc;n đạo, nh&acirc;n từ, nh&acirc;n nghĩa, m&agrave; kh&ocirc;ng qu&ecirc;n nh&acirc;n tri, nh&acirc;n tr&iacute;, nh&acirc;n t&iacute;nh. Khả mang lực của khả thi do c&oacute; khả thật, lấy sự thật tạo dựng ch&acirc;n l&yacute;, lấy ch&acirc;n l&yacute; để bảo vệ lẻ phải. Luận dụng khả năng của kiến thức để tạo n&ecirc;n tri thức, d&ugrave;ng l&yacute; luận để lập luận, lấy gi&atilde;i luận để diễn luận, nhận tranh luận để trao luận.&nbsp;<br />
<br />
Tiền dạng của V&ugrave;ng khả luận, mang t&ecirc;n Trang thầy Kh&oacute;a, do c&aacute;c sinh vi&ecirc;n cao học v&agrave; tiến sĩ của t&ocirc;i tại &acirc;u ch&acirc;u đọc c&aacute;c b&agrave;i của t&ocirc;i từ hơn 20 năm qua, rồi trao truyền cho nhau trong giới đại học, b&acirc;y giờ c&aacute;c b&agrave;i n&agrave;y lan ra giới học thuật trong v&agrave; ngo&agrave;i nước Việt Nam, t&ocirc;i xin ph&eacute;p được tổ chức hậu dạng trang n&agrave;y th&agrave;nh hệ thống, c&oacute; thứ tự, theo tuần tự, mang dạng luận, n&ecirc;n đặt t&ecirc;n n&oacute; l&agrave; V&ugrave;ng khả luận, nhưng vẫn lu&ocirc;n giữ nội dung của học luận.&nbsp;<br />
<br />
Tại sao lại luận ? V&igrave; luận dựa tr&ecirc;n l&yacute;, mỗi chuyện tr&ecirc;n đời n&agrave;y, trong kiếp người n&agrave;y đều c&oacute; c&aacute;i l&yacute; của n&oacute;, l&agrave;m ra rễ, cội, gốc, nguồn cho luận : l&yacute; luận để t&igrave;m sự thật ; lập luận để n&acirc;ng ch&acirc;n l&yacute;; gi&atilde;i luận để hiểu lẻ phải; diễn luận để t&igrave;m tương lai đ&uacute;ng. T&igrave;m lối ra đ&uacute;ng, mỗi lần vượt tho&aacute;t một ng&otilde; cụt trong l&yacute; l&agrave; mỗi lần vượt thắng được bế tắc trong luận.&nbsp;<br />
<br />
Luận trong giới tr&iacute; thức v&agrave; khoa học ho&agrave;n to&agrave;n ngược với sinh hoạt của giới thương mại l&agrave; &laquo;c&oacute; tiền mua ti&ecirc;n cũng được&raquo;, tr&aacute;i ngược hẳn với sinh hoạt của giới ch&iacute;nh trị &laquo;ăn l&agrave;m vua, thua l&agrave;m giặc&raquo;, v&igrave; c&aacute;c loại tiền, ti&ecirc;n, vua, giặc&hellip; n&agrave;y mang bất c&ocirc;ng, rồi dẩn bạo động v&agrave;o nh&acirc;n sinh, biến chất nh&acirc;n t&iacute;nh, tho&aacute;i h&oacute;a nh&acirc;n nghĩa, x&oacute;i m&ograve;n nh&acirc;n c&aacute;ch, nạo rỗng nh&acirc;n tr&iacute;&hellip;&nbsp;<br />
<br />
Luận của l&yacute; lấy chứng thực để tạo chứng minh. Tin tức phải c&oacute; cơ sở của dữ kiện để c&oacute; nội lực của chứng từ; chứng từ c&oacute; phương ph&aacute;p luận, c&oacute; l&yacute; thuyết luận, c&oacute; khoa học luận sẽ tạo ra luận cứ; luận l&agrave;m s&aacute;ng l&yacute; qua ch&iacute;nh l&yacute; để bảo vệ ch&iacute;nh nghĩa; khi th&agrave;nh l&yacute; sẻ c&oacute; ch&iacute;nh &yacute; để bảo tr&igrave; cho ch&iacute;nh t&acirc;m.&nbsp;<br />
<br />
V&ugrave;ng khả luận chọn nh&acirc;n l&yacute;, nh&acirc;n tr&iacute;, nh&acirc;n tri, n&ecirc;n đứng về ph&iacute;a nh&acirc;n đạo, nh&acirc;n t&igrave;nh, nh&acirc;n nghĩa, để nh&acirc;n sinh, nh&acirc;n thế, nh&acirc;n gian nhận diện được c&aacute;i hay, đẹp, tốt, l&agrave;nh lu&ocirc;n thẳng lưng, thẳng thế, thẳng bước trước c&aacute;i th&acirc;m, &aacute;c, độc, hiểm, sinh ra c&aacute;i xấu, tồi, tục, dở đe dọa nh&acirc;n t&iacute;nh. V&ugrave;ng khả luận đứng về ph&iacute;a nước mắt c&aacute;c nạn nh&acirc;n của bất c&ocirc;ng, tham nhũng, độc t&agrave;i&hellip; V&ugrave;ng khả luận đứng hẳn về ph&iacute;a nh&acirc;n quyền !</p>
', 1)
/****** Object:  Table [dbo].[Files]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[FileSize] [int] NOT NULL,
	[FileType] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Files] ON
INSERT [dbo].[Files] ([Id], [Name], [FileSize], [FileType]) VALUES (1, N'sample_doc.pdf', 5324294, 10)
INSERT [dbo].[Files] ([Id], [Name], [FileSize], [FileType]) VALUES (2, N'CHỦ THUYẾT DUY LÝ HIỆN ĐẠI.pdf', 5618175, 10)
INSERT [dbo].[Files] ([Id], [Name], [FileSize], [FileType]) VALUES (3, N'LÊ HỮU KHÓA. Cảnh quang «vườn» của DU LICH HỌC. (1).pdf', 9404297, 10)
INSERT [dbo].[Files] ([Id], [Name], [FileSize], [FileType]) VALUES (4, N'LÊ HỮU KHÓA. DI SẢN « nền »của DU LỊCH HỌC.pdf', 6886378, 10)
INSERT [dbo].[Files] ([Id], [Name], [FileSize], [FileType]) VALUES (5, N'Phương pháp tiếp cận-.phân tích-lý thuyết văn học.pdf', 5040728, 10)
INSERT [dbo].[Files] ([Id], [Name], [FileSize], [FileType]) VALUES (6, N'van hien.van hoa.vietnam.pdf', 4272401, 10)
SET IDENTITY_INSERT [dbo].[Files] OFF
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ImageUrl] [nvarchar](256) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[Gender] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Name], [ImageUrl], [Birthday], [Gender], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'14efee78-0399-4703-9889-ad3daedb6bc5', N'Lê Hữu Khóa', N'/Content/UserFiles/images/author.jpg', CAST(0x0000732500000000 AS DateTime), N'Nam', N'huu-khoa.le@univ-lille3.fr', 1, N'ALEMOYQTt7ZTcZfcDZ3HP7YLro+SccsuaL/2h+YPa+ujIlsBoqtEFqLq7Nmul1qEuA==', N'730af7f4-5208-482d-a3c3-62058aad4193', N'01652130546', 0, 0, NULL, 0, 0, N'admin')
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'14efee78-0399-4703-9889-ad3daedb6bc5', N'd4f85e40-0054-4892-a931-57fb7565d111')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'14efee78-0399-4703-9889-ad3daedb6bc5', N'f5c9f7d4-2180-4723-b02c-15a8e9179d03')
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PageId] [nvarchar](256) NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PageId] ON [dbo].[Menus] 
(
	[PageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CategoryId] [nvarchar](100) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NULL,
	[MetaKeyword] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[AuthorId] [nvarchar](128) NULL,
	[Views] [int] NOT NULL,
	[IsPopularPost] [bit] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PostType] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AuthorId] ON [dbo].[Posts] 
(
	[AuthorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Posts] 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Posts] ON
INSERT [dbo].[Posts] ([Id], [Title], [Slug], [Description], [Content], [CategoryId], [DateCreated], [DateUpdated], [MetaKeyword], [MetaDescription], [AuthorId], [Views], [IsPopularPost], [IsPublished], [IsDeleted], [PostType]) VALUES (1, N'Ca sĩ Thái Hiền', N'ca-si-thai-hien', N'<p>xcvxcvxcv</p>
', NULL, N'nghe-luan', CAST(0x07B2471CE5BD8A3D0B AS DateTime2), CAST(0x0741321DE5BD8A3D0B AS DateTime2), NULL, NULL, N'14efee78-0399-4703-9889-ad3daedb6bc5', 0, 1, 1, 0, 10)
INSERT [dbo].[Posts] ([Id], [Title], [Slug], [Description], [Content], [CategoryId], [DateCreated], [DateUpdated], [MetaKeyword], [MetaDescription], [AuthorId], [Views], [IsPopularPost], [IsPublished], [IsDeleted], [PostType]) VALUES (2, N'Chủ thuyết Duy lý Hiện đại', N'chu-thuyet-duy-ly-hien-dai', NULL, NULL, N'ly-thuyet-luan', CAST(0x0792C1A449A4893D0B AS DateTime2), CAST(0x070000000000000000 AS DateTime2), NULL, NULL, N'14efee78-0399-4703-9889-ad3daedb6bc5', 0, 1, 1, 0, 10)
INSERT [dbo].[Posts] ([Id], [Title], [Slug], [Description], [Content], [CategoryId], [DateCreated], [DateUpdated], [MetaKeyword], [MetaDescription], [AuthorId], [Views], [IsPopularPost], [IsPublished], [IsDeleted], [PostType]) VALUES (3, N'Cảnh quan', N'canh-quan', NULL, NULL, N'ly-thuyet-luan', CAST(0x07447B5189A4893D0B AS DateTime2), CAST(0x070000000000000000 AS DateTime2), NULL, NULL, N'14efee78-0399-4703-9889-ad3daedb6bc5', 0, 1, 1, 0, 10)
INSERT [dbo].[Posts] ([Id], [Title], [Slug], [Description], [Content], [CategoryId], [DateCreated], [DateUpdated], [MetaKeyword], [MetaDescription], [AuthorId], [Views], [IsPopularPost], [IsPublished], [IsDeleted], [PostType]) VALUES (4, N'Di sản', N'di-san', NULL, NULL, N'ly-thuyet-luan', CAST(0x07DE1654C0A4893D0B AS DateTime2), CAST(0x070000000000000000 AS DateTime2), NULL, NULL, N'14efee78-0399-4703-9889-ad3daedb6bc5', 0, 0, 1, 0, 10)
INSERT [dbo].[Posts] ([Id], [Title], [Slug], [Description], [Content], [CategoryId], [DateCreated], [DateUpdated], [MetaKeyword], [MetaDescription], [AuthorId], [Views], [IsPopularPost], [IsPublished], [IsDeleted], [PostType]) VALUES (5, N'Phương pháp tiếp cận, phân tích-lý thuyết văn học', N'phuong-phap-tiep-can-phan-tich-ly-thuyet-van-hoc', NULL, NULL, N'van-luan', CAST(0x07B2C82458AF8A3D0B AS DateTime2), CAST(0x07F8412A58AF8A3D0B AS DateTime2), NULL, NULL, N'14efee78-0399-4703-9889-ad3daedb6bc5', 0, 1, 1, 0, 10)
INSERT [dbo].[Posts] ([Id], [Title], [Slug], [Description], [Content], [CategoryId], [DateCreated], [DateUpdated], [MetaKeyword], [MetaDescription], [AuthorId], [Views], [IsPopularPost], [IsPublished], [IsDeleted], [PostType]) VALUES (6, N'Văn hiến, Văn hóa Việt Nam', N'van-hien-van-hoa-viet-nam', NULL, NULL, N'van-luan', CAST(0x0759FDA1FAAF8A3D0B AS DateTime2), CAST(0x070000000000000000 AS DateTime2), NULL, NULL, N'14efee78-0399-4703-9889-ad3daedb6bc5', 0, 1, 1, 0, 10)
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  Table [dbo].[PostFiles]    Script Date: 11/20/2017 15:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostFiles](
	[PostId] [bigint] NOT NULL,
	[FileId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.PostFiles] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FileId] ON [dbo].[PostFiles] 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PostId] ON [dbo].[PostFiles] 
(
	[PostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[PostFiles] ([PostId], [FileId]) VALUES (1, 1)
INSERT [dbo].[PostFiles] ([PostId], [FileId]) VALUES (2, 2)
INSERT [dbo].[PostFiles] ([PostId], [FileId]) VALUES (3, 3)
INSERT [dbo].[PostFiles] ([PostId], [FileId]) VALUES (4, 4)
INSERT [dbo].[PostFiles] ([PostId], [FileId]) VALUES (5, 5)
INSERT [dbo].[PostFiles] ([PostId], [FileId]) VALUES (6, 6)
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.Menus_dbo.Pages_PageId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menus_dbo.Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_dbo.Menus_dbo.Pages_PageId]
GO
/****** Object:  ForeignKey [FK_dbo.Posts_dbo.AspNetUsers_AuthorId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.AspNetUsers_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.AspNetUsers_AuthorId]
GO
/****** Object:  ForeignKey [FK_dbo.Posts_dbo.PostCategories_CategoryId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.PostCategories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[PostCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.PostCategories_CategoryId]
GO
/****** Object:  ForeignKey [FK_dbo.PostFiles_dbo.Files_FileId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[PostFiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PostFiles_dbo.Files_FileId] FOREIGN KEY([FileId])
REFERENCES [dbo].[Files] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostFiles] CHECK CONSTRAINT [FK_dbo.PostFiles_dbo.Files_FileId]
GO
/****** Object:  ForeignKey [FK_dbo.PostFiles_dbo.Posts_PostId]    Script Date: 11/20/2017 15:53:05 ******/
ALTER TABLE [dbo].[PostFiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PostFiles_dbo.Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostFiles] CHECK CONSTRAINT [FK_dbo.PostFiles_dbo.Posts_PostId]
GO
