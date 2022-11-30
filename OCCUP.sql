WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.OCCUP_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Occup_Code  AS  STRING)  AS  Occup_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_OccupCode('Occup_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Occup_Code,
	{{  aggregate_validation_columns(['__OccupCode_valid_Occup_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
