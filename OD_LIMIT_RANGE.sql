WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.OD_LIMIT_RANGE_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Range_Nbr  AS  NUMERIC)  AS  Range_Nbr,
	CAST(Bal_Range_Limit  AS  NUMERIC)  AS  Bal_Range_Limit,
	CAST(Base_Rate  AS  NUMERIC)  AS  Base_Rate,
	CAST(Base_Rate_Loading  AS  NUMERIC)  AS  Base_Rate_Loading,
	CAST(Cr_Base_Rate_Type_Code  AS  STRING)  AS  Cr_Base_Rate_Type_Code,
	CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	CAST(Range_Limit  AS  NUMERIC)  AS  Range_Limit
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Expiry_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Expiry_Dte,
Range_Limit,
	{{  aggregate_validation_columns(['__Future_Date_valid_Expiry_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
