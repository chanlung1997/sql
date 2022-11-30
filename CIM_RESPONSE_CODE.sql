WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CIM_RESPONSE_CODE_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Campaign_Class  AS  STRING)  AS  Campaign_Class,
	CAST(Response_Code  AS  STRING)  AS  Response_Code,
	CAST(Response_Desc  AS  STRING)  AS  Response_Desc,
	CAST(Response_Status_Code  AS  STRING)  AS  Response_Status_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
