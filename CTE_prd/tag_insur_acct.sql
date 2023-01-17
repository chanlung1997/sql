WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_insur_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	SAFE_CAST(Insur_Type_Code  AS  STRING)  AS  Insur_Type_Code,
	SAFE_CAST(Prem_Pmt_Method_Code  AS  STRING)  AS  Prem_Pmt_Method_Code,
	SAFE_CAST(Pmt_Mode_Code  AS  STRING)  AS  Pmt_Mode_Code,
	SAFE_CAST(Policy_Issue_Dte  AS  DATE)  AS  Policy_Issue_Dte,
	SAFE_CAST(Policy_Prem_Amt  AS  NUMERIC)  AS  Policy_Prem_Amt,
	SAFE_CAST(Policy_Prem_Amt_Hke  AS  NUMERIC)  AS  Policy_Prem_Amt_Hke,
	SAFE_CAST(Policy_Term  AS  NUMERIC)  AS  Policy_Term,
	SAFE_CAST(Sum_Insured  AS  NUMERIC)  AS  Sum_Insured
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
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Expiry_Dte,
	Insur_Type_Code,
	Prem_Pmt_Method_Code,
	Pmt_Mode_Code,
	Policy_Issue_Dte,
	Policy_Prem_Amt,
	Policy_Prem_Amt_Hke,
	Policy_Term,
	Sum_Insured,
	{{  full_valid_flag(['__Future_Date_valid_Expiry_Dte','__NoFutureDate_valid_Policy_Issue_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
