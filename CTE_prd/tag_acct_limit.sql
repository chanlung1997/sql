WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_acct_limit_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Limit_Type_Code  AS  STRING)  AS  Limit_Type_Code,
	SAFE_CAST(Update_Dte  AS  DATE)  AS  Update_Dte,
	SAFE_CAST(Limit_Amt  AS  NUMERIC)  AS  Limit_Amt
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Update_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Limit_Type_Code,
	Update_Dte,
	Limit_Amt,
	{{  full_valid_flag(['__NoFutureDate_valid_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
