WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.INSUR_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	CAST(Insur_Type_Code  AS  STRING)  AS  Insur_Type_Code,
	CAST(Prem_Pmt_Method_Code  AS  STRING)  AS  Prem_Pmt_Method_Code,
	CAST(Pmt_Mode_Code  AS  STRING)  AS  Pmt_Mode_Code,
	CAST(Policy_Issue_Dte  AS  DATE)  AS  Policy_Issue_Dte,
	CAST(Policy_Prem_Amt  AS  NUMERIC)  AS  Policy_Prem_Amt,
	CAST(Policy_Prem_Amt_Hke  AS  NUMERIC)  AS  Policy_Prem_Amt_Hke,
	CAST(Policy_Term  AS  NUMERIC)  AS  Policy_Term
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Expiry_Dte')}},
	{{validate_NoFutureDate('Policy_Issue_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Expiry_Dte,
Insur_Type_Code,
Prem_Pmt_Method_Code,
Pmt_Mode_Code,
Policy_Issue_Dte,
Policy_Prem_Amt,
Policy_Prem_Amt_Hke,
Policy_Term,
	{{  aggregate_validation_columns(['__Future_Date_valid_Expiry_Dte','__NoFutureDate_valid_Policy_Issue_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
