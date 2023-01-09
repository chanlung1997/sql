WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_custodian_acct_portfolio_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Portfolio_Type_Code  AS  STRING)  AS  Portfolio_Type_Code,
	SAFE_CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	SAFE_CAST(End_Dte  AS  DATE)  AS  End_Dte,
	SAFE_CAST(Portfolio_Market_Val  AS  NUMERIC)  AS  Portfolio_Market_Val
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Portfolio_Type_Code,
	Start_Dte,
	End_Dte,
	Portfolio_Market_Val,
	{{  full_valid_flag(['__NoFutureDate_valid_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
