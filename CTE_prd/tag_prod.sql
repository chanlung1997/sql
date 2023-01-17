WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_prod_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Prod_Id  AS  STRING)  AS  Prod_Id,
	SAFE_CAST(Host_Prod_Id  AS  STRING)  AS  Host_Prod_Id,
	SAFE_CAST(Prod_Categ_Code  AS  STRING)  AS  Prod_Categ_Code,
	SAFE_CAST(Prod_Desc  AS  STRING)  AS  Prod_Desc,
	SAFE_CAST(Prod_End_Dte  AS  DATE)  AS  Prod_End_Dte,
	SAFE_CAST(Prod_Name  AS  STRING)  AS  Prod_Name,
	SAFE_CAST(Prod_Start_Dte  AS  DATE)  AS  Prod_Start_Dte,
	SAFE_CAST(Script_Id  AS  STRING)  AS  Script_Id
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Prod_Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Prod_Id,
	Host_Prod_Id,
	Prod_Categ_Code,
	Prod_Desc,
	Prod_End_Dte,
	Prod_Name,
	Prod_Start_Dte,
	Script_Id,
	{{  full_valid_flag(['__NoFutureDate_valid_Prod_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
