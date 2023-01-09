WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_acct_dly_bal_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	SAFE_CAST(Avail_Bal_Amt  AS  NUMERIC)  AS  Avail_Bal_Amt,
	SAFE_CAST(Avail_Bal_Amt_Hke  AS  NUMERIC)  AS  Avail_Bal_Amt_Hke,
	SAFE_CAST(Cash_Bal_Amt  AS  NUMERIC)  AS  Cash_Bal_Amt,
	SAFE_CAST(Cur_Bal_Amt  AS  NUMERIC)  AS  Cur_Bal_Amt,
	SAFE_CAST(Cur_Bal_Amt_Hke  AS  NUMERIC)  AS  Cur_Bal_Amt_Hke,
	SAFE_CAST(End_Dte  AS  DATE)  AS  End_Dte,
	SAFE_CAST(Retail_Bal_Amt  AS  NUMERIC)  AS  Retail_Bal_Amt
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
	Start_Dte,
	Avail_Bal_Amt,
	Avail_Bal_Amt_Hke,
	Cash_Bal_Amt,
	Cur_Bal_Amt,
	Cur_Bal_Amt_Hke,
	End_Dte,
	Retail_Bal_Amt,
	{{  full_valid_flag(['__NoFutureDate_valid_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
