WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CUSTODIAN_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(acct_nbr  AS  INT64)  AS  acct_nbr,
	CAST(appl_id  AS  STRING)  AS  appl_id,
	CAST(control_fields  AS  STRING)  AS  control_fields,
	CAST(acct_code  AS  STRING)  AS  acct_code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
