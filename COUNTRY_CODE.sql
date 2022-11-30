WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.COUNTRY_CODE_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Entity_Nbr  AS  STRING)  AS  Entity_Nbr,
	CAST(Country_Code  AS  STRING)  AS  Country_Code,
	CAST(Country_Name  AS  STRING)  AS  Country_Name,
	CAST(Country_Risk_Ind  AS  STRING)  AS  Country_Risk_Ind,
	CAST(CRS_Report_Ind  AS  STRING)  AS  CRS_Report_Ind,
	CAST(Region_Code  AS  STRING)  AS  Region_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_CountryCode('Country_Code')}},
	{{validate_CountryCode('Country_Name')}},
	{{validate_01YN('Country_Risk_Ind')}},
	{{validate_01YN('CRS_Report_Ind')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Country_Code,
Country_Name,
Country_Risk_Ind,
CRS_Report_Ind,
Region_Code,
	{{  aggregate_validation_columns(['__CountryCode_valid_Country_Code','__CountryCode_valid_Country_Name','__01YN_valid_Country_Risk_Ind','__01YN_valid_CRS_Report_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
