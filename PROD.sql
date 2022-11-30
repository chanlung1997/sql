WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PROD_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Prod_Id  AS  STRING)  AS  Prod_Id,
	CAST(Host_Prod_Id  AS  STRING)  AS  Host_Prod_Id,
	CAST(Prod_Categ_Code  AS  STRING)  AS  Prod_Categ_Code,
	CAST(Prod_Desc  AS  STRING)  AS  Prod_Desc,
	CAST(Prod_End_Dte  AS  DATE)  AS  Prod_End_Dte,
	CAST(Prod_Name  AS  STRING)  AS  Prod_Name,
	CAST(Prod_Start_Dte  AS  DATE)  AS  Prod_Start_Dte
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
Prod_Start_Dte,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Prod_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
