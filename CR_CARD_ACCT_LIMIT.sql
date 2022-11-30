WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CR_CARD_ACCT_LIMIT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Limit_Start_Dte  AS  DATE)  AS  Limit_Start_Dte,
	CAST(Limit_Type_Code  AS  STRING)  AS  Limit_Type_Code,
	CAST(Cr_Limit_Amt  AS  NUMERIC)  AS  Cr_Limit_Amt,
	CAST(Cr_Limit_Avail  AS  NUMERIC)  AS  Cr_Limit_Avail
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Limit_Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Limit_Start_Dte,
Limit_Type_Code,
Cr_Limit_Amt,
Cr_Limit_Avail,
	{{  aggregate_validation_columns(['__Future_Date_valid_Limit_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
