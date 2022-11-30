WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CUR_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Cancel_Code  AS  STRING)  AS  Cancel_Code,
	CAST(Chq_Book_Enable_Ind  AS  STRING)  AS  Chq_Book_Enable_Ind,
	CAST(Closing_Bal_Amt  AS  NUMERIC)  AS  Closing_Bal_Amt,
	CAST(Int_Suspend_Dte  AS  DATE)  AS  Int_Suspend_Dte,
	CAST(Int_Suspend_Ind  AS  STRING)  AS  Int_Suspend_Ind,
	CAST(Last_Review_Dte  AS  DATE)  AS  Last_Review_Dte,
	CAST(Limit_Status_Code  AS  STRING)  AS  Limit_Status_Code,
	CAST(Min_Pay_Waive_Ind  AS  STRING)  AS  Min_Pay_Waive_Ind,
	CAST(Next_Review_Dte  AS  DATE)  AS  Next_Review_Dte,
	CAST(Od_Acct_Type  AS  STRING)  AS  Od_Acct_Type,
	CAST(Od_Limit_Amt  AS  NUMERIC)  AS  Od_Limit_Amt,
	CAST(Od_Limit_Close_Dte  AS  DATE)  AS  Od_Limit_Close_Dte,
	CAST(Od_Limit_Open_Dte  AS  DATE)  AS  Od_Limit_Open_Dte,
	CAST(Od_Limit_Suspend_Dte  AS  DATE)  AS  Od_Limit_Suspend_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
