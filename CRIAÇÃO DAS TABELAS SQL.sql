CREATE TABLE [TAB_RACA]
(
	[COD_RACA] INT NOT NULL PRIMARY KEY, 
    [DESC_RACA] NVARCHAR(15) NOT NULL
)
GO

CREATE TABLE [TAB_LOCAL]
(
	[COD_MUNICIPIO] INT NOT NULL PRIMARY KEY, 
    [REGIAO] NVARCHAR(50) NOT NULL, 
    [SIGLA_UF] NVARCHAR(50) NOT NULL, 
    [DESC_MUNICIPIO] NVARCHAR(200) NOT NULL
)
GO

CREATE TABLE [TAB_IES]
(
	[COD_EMEC_IES_BOLSA] INT NOT NULL PRIMARY KEY, 
    [NOME_IES_BOLSA] NVARCHAR(200) NULL
)
GO

CREATE TABLE [TAB_REGISTRO]
(
	[COD_ID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [ANO_CONCESSAO_BOLSA] INT NOT NULL, 
    [COD_RACA] INT NOT NULL, 
    [COD_MUNICIPIO] INT NULL, 
    [COD_EMEC_IES_BOLSA] INT NOT NULL, 
    [CPF_BENEFICIARIO_BOLSA] NVARCHAR(50) NULL, 
    [SEXO_BENEFICIARIO_BOLSA] NVARCHAR(2) NULL, 
    [NOME_CURSO_BOLSA] NVARCHAR(200) NULL, 
    [DT_NASCIMENTO_BENEFICIARIO] DATE NULL, 
    [BENEFICIARIO_DEFICIENTE_FISICO] INT NULL, 
    [TIPO_BOLSA] NVARCHAR(50) NULL, 
    [MODALIDADE_ENSINO_BOLSA] NVARCHAR(50) NULL,
	[IDADE] INT NULL)
GO

ALTER TABLE TAB_REGISTRO
ADD CONSTRAINT FK_TAB_REGISTRO_TAB_RACA
FOREIGN KEY ([COD_RACA]) 
REFERENCES TAB_RACA([COD_RACA])
GO

ALTER TABLE TAB_REGISTRO
ADD CONSTRAINT FK_TAB_REGISTRO_TAB_LOCAL
FOREIGN KEY ([COD_MUNICIPIO]) 
REFERENCES [TAB_LOCAL]([COD_MUNICIPIO])
GO
    
ALTER TABLE TAB_REGISTRO
ADD CONSTRAINT FK_TAB_REGISTRO_TAB_IES 
FOREIGN KEY ([COD_EMEC_IES_BOLSA]) 
REFERENCES [TAB_IES] ([COD_EMEC_IES_BOLSA])
GO