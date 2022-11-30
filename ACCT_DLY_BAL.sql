WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.ACCT_DLY_BAL_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	CAST(Avail_Bal_Amt  AS  NUMERIC)  AS  Avail_Bal_Amt,
	CAST(Avail_Bal_Amt_Hke  AS  NUMERIC)  AS  Avail_Bal_Amt_Hke,
	CAST(Cash_Bal_Amt  AS  NUMERIC)  AS  Cash_Bal_Amt,
	CAST(Cur_Bal_Amt  AS  NUMERIC)  AS  Cur_Bal_Amt,
	CAST(Cur_Bal_Amt_Hke  AS  NUMERIC)  AS  Cur_Bal_Amt_Hke,
	CAST(End_Dte  AS  DATE)  AS  End_Dte
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
Start_Dte,
Avail_Bal_Amt,
Avail_Bal_Amt_Hke,
Cash_Bal_Amt,
Cur_Bal_Amt,
Cur_Bal_Amt_Hke,
End_Dte,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
