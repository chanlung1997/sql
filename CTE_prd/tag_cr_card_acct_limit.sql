WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_card_acct_limit_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Limit_Start_Dte  AS  DATE)  AS  Limit_Start_Dte,
	SAFE_CAST(Limit_Type_Code  AS  STRING)  AS  Limit_Type_Code,
	SAFE_CAST(Cr_Limit_Amt  AS  NUMERIC)  AS  Cr_Limit_Amt,
	SAFE_CAST(Cr_Limit_Avail  AS  NUMERIC)  AS  Cr_Limit_Avail,
	SAFE_CAST(Limit_End_Dte  AS  DATE)  AS  Limit_End_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Limit_Start_Dte')}},
	{{validate_NoFutureDate('Limit_End_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Limit_Start_Dte,
	Limit_Type_Code,
	Cr_Limit_Amt,
	Cr_Limit_Avail,
	Limit_End_Dte,
	{{  full_valid_flag(['__Future_Date_valid_Limit_Start_Dte','__NoFutureDate_valid_Limit_End_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
