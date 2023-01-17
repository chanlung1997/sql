WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_country_code_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Entity_Nbr  AS  STRING)  AS  Entity_Nbr,
	SAFE_CAST(Country_Code  AS  STRING)  AS  Country_Code,
	SAFE_CAST(Country_Name  AS  STRING)  AS  Country_Name,
	SAFE_CAST(Country_Risk_Ind  AS  STRING)  AS  Country_Risk_Ind,
	SAFE_CAST(CRS_Report_Ind  AS  STRING)  AS  CRS_Report_Ind,
	SAFE_CAST(Region_Code  AS  STRING)  AS  Region_Code,
	SAFE_CAST(Special_Risk_Ind  AS  STRING)  AS  Special_Risk_Ind
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
	Entity_Nbr,
	Country_Code,
	Country_Name,
	Country_Risk_Ind,
	CRS_Report_Ind,
	Region_Code,
	Special_Risk_Ind,
	{{  full_valid_flag(['__CountryCode_valid_Country_Code','__CountryCode_valid_Country_Name','__01YN_valid_Country_Risk_Ind','__01YN_valid_CRS_Report_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
