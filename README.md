<img width=100% src="https://capsule-render.vercel.app/api?type=rect&color=0:73db86,100:00bfef&section=header&height=120&text=Projeto%20de%20Data%20Warehouse%20Prouni&desc=ETL%20e%20Data%20Visualization&animation=fadeIn&fontColor=ffffff&fontSize=30&descSize=15&fontAlignY=45&descAlignY=70"/>

## Navageção

1. [Sobre o projeto](#sobre-o-projeto)  
2. [Sobre o tema](#sobre-o-tema)
3. [Tecnologias utilizadas](#tecnologias-utilizadas)  
 3.1 [Bibliotecas](#bibliotecas)
3. [Conhecendo os dados](#conhecendo-os-dados)  
 3.1 [Esquema original](e#squema-original)  
 3.2 [Modelagem de dados](#modelagem-de-dados)
4. [Data Visualization](#data-visualization)  
  4.1 [Relatório de Análise de Dados em PDF](#relatório-de-análise-de-dados-em-pdf)  
   4.2 [Relatório de Análise de Dados no Power BI](#relatório-de-análise-de-dados-no-power-bi)  
5. [Publlicações](#publicações)

## Sobre o projeto
Os datasets tratados e analisados neste projeto são referentes às bolsas concedidas e o perfil dos beneficiários do Programa Universidade para Todos entre os anos de 2005 e 2020. Os dezesseis arquivos em formato *.csv* podem ser encontrados no [Portal de Dados Abertos](https://dados.gov.br/dados/conjuntos-dados) do governo federal.

Neste repositório é possível encontrar o código utilizado no processo de ETL e na construção de um cubo tabular OLAP utilizando o SSAS (SQL Server Analysis Services); um relatório em formato PDF com gráficos das informações obtidas do Data Warehouse, e algumas imagens de um relatório desenvolvido no PowerBI utilizando como fonte o cubo OLAP.
&nbsp;

## Sobre o tema
<img align=right width="28%" height="28%" src="https://faculdadetorricelli.com.br/wp-content/uploads/2021/06/143210-prouni-aprenda-como-participar-do-programa-300x226.png">

> O Programa Universidade para Todos - Prouni tem como finalidade a concessão de bolsas de estudo integrais e parciais em cursos de graduação e sequenciais de formação específica, em instituições de ensino superior privadas que oferece, em contrapartida, isenção de tributos àquelas instituições que aderem ao Programa.

> Dirigido aos estudantes egressos do ensino médio da rede pública ou da rede particular na condição de bolsistas integrais, com renda familiar per capita máxima de três salários mínimos, o Prouni conta com um sistema de seleção informatizado e impessoal, que confere transparência e segurança ao processo. Os candidatos são selecionados pelas notas obtidas no Exame Nacional do Ensino Médio - Enem conjugando-se, desse modo, inclusão à qualidade e mérito dos estudantes com melhores desempenhos acadêmicos.

## Tecnologias utilizadas
[![Jupyter Notebook](https://img.shields.io/badge/jupyter-00bfef.svg?style=for-the-badge&logo=jupyter&logoColor=white)](https://jupyter.org/try)
[![Python](https://img.shields.io/badge/python-00bfef?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Sever-00bfef?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)](https://www.microsoft.com/pt-br/sql-server/sql-server-2019)
[![Power Bi](https://img.shields.io/badge/power_bi-00bfef?style=for-the-badge&logo=powerbi&logoColor=white)](https://powerbi.microsoft.com/pt-br/)

### Bibliotecas
[![Pandas](https://img.shields.io/badge/pandas-545454.svg?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![NumPy](https://img.shields.io/badge/numpy-545454.svg?style=for-the-badge&logo=numpy&logoColor=white)](https://numpy.org/)
[![SqlAlchemy](https://shields.io/badge/SQLALCHEMY-545454?style=for-the-badge&logo=python&logoColor=white)](https://www.sqlalchemy.org/)


[![Glob](https://shields.io/badge/GLOB-545454?style=for-the-badge&logo=python&logoColor=white)](https://docs.python.org/3/library/glob.html#module-glob)
[![Unidecode](https://shields.io/badge/UNIDECODE-545454?style=for-the-badge&logo=python&logoColor=white)](https://pypi.org/project/Unidecode/)
[![Datetime](https://shields.io/badge/DATETIME-545454?style=for-the-badge&logo=python&logoColor=white)](https://docs.python.org/3/library/datetime.html)

## Conhecendo os dados
### Esquema original

| Nome | Campo | Tipo | Descrição |
|---|---|---|---|
| Ano da concessão da bolsa | ANO_CONCESSAO_BOLSA | Numérico | Ano da concessão da bolsa ProUni (início da vigência). |
| Código do e-MEC da IES que concedeu a   bolsa | CODIGO_EMEC_IES_BOLSA | Numérico | Código do e-MEC referente a IES que concedeu a bolsa ProUni. |
| Nome da IES | NOME_IES_BOLSA | Alfanumérico | Nome/Razão Social da Instituição de Ensino Superior que concedeu a bolsa   ProUni.  |
| Tipo da Bolsa | TIPO_BOLSA | Alfanumérico | Descrição do tipo da bolsa concedida ao beneficiário do ProUni (integral   – 100% ou parcial – 50%).  |
| Modalidade de ensino | MODALIDADE_ENSINO_BOLSA | Alfanumérico | Descrição da modalidade de ensino da bolsa concedida ao beneficiário do   ProUni (presencial ou ensino à distância – EAD).  |
| Nome do Curso | NOME_CURSO_BOLSA  | Alfanumérico | Nome do curso do beneficiário da bolsa ProUni.  |
| Turno do Curso | NOME_TURNO_CURSO_BOLSA | Alfanumérico  | Descrição do turno do curso do beneficiário da bolsa ProUni.  |
| CPF do beneficiário | CPF_BENEFICIARIO_BOLSA  | Alfanumérico | CPF do beneficiário da bolsa ProUni* |
| Sexo do beneficiário | SEXO_BENEFICIARIO_BOLSA | Alfanumérico | Sexo informado pelo beneficiário da bolsa ProUni.  |
| Raça/Cor | RACA_BENEFICIARIO_BOLSA | Alfanumérico | Raça/Cor informado pelo beneficiário da bolsa ProUni. |
| Data de nascimento do beneficiário | DT_NASCIMENTO_BENEFICIARIO | Data | Data de nascimento do beneficiário da bolsa ProUni.  |
| Indicação se o beneficiário é portador de   deficiência  | BENEFICIARIO_DEFICIENTE_FISICO | Alfanumérico | Indicação se o beneficiário da bolsa ProUni é portador de algum tipo de   deficiência (sim ou não).  |
| Região | REGIAO_BENEFICIARIO_BOLSA  | Alfanumérico | Nome da região de residência do beneficiário da bolsa ProUni. |
| UF | SIGLA_UF_BENEFICIARIO_BOLSA  | Alfanumérico | Sigla da UF de residência do beneficiário da bolsa ProUni. |
| Município | MUNICIPIO_BENEFICIARIO_BOLSA  | Alfanumérico | Nome do Município de residência do beneficiário da bolsa ProUni. |

(*) Casos permissivos de sobreposição de bolsas:
* bolsas suspensas com posterior renovação em período/ano diferentes;
* bolsas canceladas com nova concessão posterior em período/ano diferentes. 


### Modelagem de dados
Os dados tratados foram formatados para um banco de dados SQL com a seguinte modelagem:

<img width="40%" height="40%" src="https://raw.githubusercontent.com/maisumdiego/DadosProuni/main/Imagens/Diagrama%20geral.png">

## Data Visualization

### Relatório de Análise de Dados em PDF
<div>
<img width="40%" height="40%" src="https://raw.githubusercontent.com/maisumdiego/DadosProuni/main/Imagens/Relat%C3%B3rio%20PDF%201.png">
<img width="40%" height="40%" src="https://raw.githubusercontent.com/maisumdiego/DadosProuni/main/Imagens/Relat%C3%B3rio%20PDF%202.png">
</div>
&nbsp;

Esse relatório completo está disponível no arquivo [Relatório de Análise de Dados](https://github.com/maisumdiego/DadosProuni/blob/main/Relat%C3%B3rio%20de%20An%C3%A1lise%20de%20Dados.pdf).

### Relatório de Análise de Dados no Power BI
<div>
<img width="50%" height="50%" src="https://raw.githubusercontent.com/maisumdiego/DadosProuni/main/Imagens/Power%20BI%201.png">
<img width="50%" height="50%" src="https://github.com/maisumdiego/DadosProuni/blob/main/Imagens/Power%20BI%202.png">
</div>
&nbsp;

O arquivo desse relatório não está disponível no online, bem como sua base de dados.

## Publicações
Um artigo discorrendo um pouco do processo de ETL foi escrito e publicado no Linkedin: [Projeto Dados Prouni: processo de ETL para o SQL Server utilizando Python](https://www.linkedin.com/pulse/projeto-dados-prouni-processo-de-etl-para-o-sqlserver-diego-ferreira/).

As demais postagens referentes ao projeto podem ser encontradas no meu [perfil no Linkedin](https://www.linkedin.com/in/ddiegoferreira/).
