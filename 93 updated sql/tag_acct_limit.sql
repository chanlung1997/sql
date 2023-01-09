WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_acct_limit_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(acct_nbr  AS  INT64)  AS  acct_nbr,
	SAFE_CAST(appl_id  AS  STRING)  AS  appl_id,
	SAFE_CAST(control_fields  AS  STRING)  AS  control_fields,
	SAFE_CAST(limit_type_code  AS  STRING)  AS  limit_type_code,
	SAFE_CAST(update_dte  AS  DATE)  AS  update_dte,
	SAFE_CAST(limit_amt  AS  NUMERIC)  AS  limit_amt
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('update_dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	acct_nbr,
	appl_id,
	control_fields,
	limit_type_code,
	update_dte,
	limit_amt,
	{{  full_valid_flag(['__NoFutureDate_valid_update_dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
