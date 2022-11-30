WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CHNL_TYPE_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	CAST(Chnl_Type_Desc  AS  STRING)  AS  Chnl_Type_Desc,
	CAST(Chnl_Type_End_Dte  AS  DATE)  AS  Chnl_Type_End_Dte,
	CAST(Chnl_Type_Group_Code  AS  STRING)  AS  Chnl_Type_Group_Code,
	CAST(Chnl_Type_Name  AS  STRING)  AS  Chnl_Type_Name,
	CAST(Chnl_Type_Start_Dte  AS  DATE)  AS  Chnl_Type_Start_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Chnl_Type_Name('Chnl_Type_Name')}},
	{{validate_NoFutureDate('Chnl_Type_Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Chnl_Type_Name,
Chnl_Type_Start_Dte,
	{{  aggregate_validation_columns(['__Chnl_Type_Name_valid_Chnl_Type_Name','__NoFutureDate_valid_Chnl_Type_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
