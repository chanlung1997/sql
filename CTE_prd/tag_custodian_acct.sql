WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_custodian_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(acct_nbr  AS  INT64)  AS  acct_nbr,
	SAFE_CAST(appl_id  AS  STRING)  AS  appl_id,
	SAFE_CAST(control_fields  AS  STRING)  AS  control_fields,
	SAFE_CAST(acct_code  AS  STRING)  AS  acct_code,
	SAFE_CAST(lending_pct  AS  NUMERIC)  AS  lending_pct
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
