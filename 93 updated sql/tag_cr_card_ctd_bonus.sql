WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_card_ctd_bonus_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(acct_nbr  AS  INT64)  AS  acct_nbr,
	SAFE_CAST(appl_id  AS  STRING)  AS  appl_id,
	SAFE_CAST(control_fields  AS  STRING)  AS  control_fields,
	SAFE_CAST(cycle_dte  AS  DATE)  AS  cycle_dte,
	SAFE_CAST(ctd_adj  AS  NUMERIC)  AS  ctd_adj,
	SAFE_CAST(ctd_avail_bal  AS  NUMERIC)  AS  ctd_avail_bal,
	SAFE_CAST(ctd_earn  AS  NUMERIC)  AS  ctd_earn,
	SAFE_CAST(ctd_redeem  AS  NUMERIC)  AS  ctd_redeem
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
	acct_nbr,
	appl_id,
	control_fields,
	cycle_dte,
	ctd_adj,
	ctd_avail_bal,
	ctd_earn,
	ctd_redeem,
	{{  full_valid_flag(['__NoFutureDate_valid_cycle_dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
