WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CUSTODIAN_ACCT_PORTFOLIO_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Portfolio_Type_Code  AS  STRING)  AS  Portfolio_Type_Code,
	CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
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
End_Dte,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
