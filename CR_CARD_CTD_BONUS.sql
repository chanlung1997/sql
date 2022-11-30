WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CR_CARD_CTD_BONUS_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(acct_nbr  AS  INT64)  AS  acct_nbr,
	CAST(appl_id  AS  STRING)  AS  appl_id,
	CAST(control_fields  AS  STRING)  AS  control_fields,
	CAST(cycle_dte  AS  DATE)  AS  cycle_dte,
	CAST(ctd_adj  AS  NUMERIC)  AS  ctd_adj,
	CAST(ctd_avail_bal  AS  NUMERIC)  AS  ctd_avail_bal,
	CAST(ctd_earn  AS  NUMERIC)  AS  ctd_earn
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('cycle_dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
cycle_dte,
ctd_adj,
ctd_avail_bal,
ctd_earn,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_cycle_dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
