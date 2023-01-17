WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_od_limit_range_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Range_Nbr  AS  NUMERIC)  AS  Range_Nbr,
	SAFE_CAST(Bal_Range_Limit  AS  NUMERIC)  AS  Bal_Range_Limit,
	SAFE_CAST(Base_Rate  AS  NUMERIC)  AS  Base_Rate,
	SAFE_CAST(Base_Rate_Loading  AS  NUMERIC)  AS  Base_Rate_Loading,
	SAFE_CAST(Cr_Base_Rate_Type_Code  AS  STRING)  AS  Cr_Base_Rate_Type_Code,
	SAFE_CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	SAFE_CAST(Range_Limit  AS  NUMERIC)  AS  Range_Limit,
	SAFE_CAST(Security_Type_Code  AS  STRING)  AS  Security_Type_Code
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
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Range_Nbr,
	Bal_Range_Limit,
	Base_Rate,
	Base_Rate_Loading,
	Cr_Base_Rate_Type_Code,
	Expiry_Dte,
	Range_Limit,
	Security_Type_Code,
	{{  full_valid_flag(['__Future_Date_valid_Expiry_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
