WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_marital_status_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Marital_Status  AS  STRING)  AS  Marital_Status,
	SAFE_CAST(Marital_Status_Desc  AS  STRING)  AS  Marital_Status_Desc
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
	Marital_Status_Desc,
	{{  full_valid_flag(['__MaritalStatus_valid_Marital_Status'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
