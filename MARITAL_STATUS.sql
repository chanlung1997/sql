WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.MARITAL_STATUS_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Marital_Status  AS  STRING)  AS  Marital_Status
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_MaritalStatus('Marital_Status')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Marital_Status,
	{{  aggregate_validation_columns(['__MaritalStatus_valid_Marital_Status'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
