WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_indv_mthly_income_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(End_Dte  AS  DATE)  AS  End_Dte,
	SAFE_CAST(Mthly_Income_Hke  AS  NUMERIC)  AS  Mthly_Income_Hke,
	SAFE_CAST(Payroll_Ccy_Code  AS  STRING)  AS  Payroll_Ccy_Code,
	SAFE_CAST(Update_Dte  AS  DATE)  AS  Update_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Start_Dte')}},
	{{validate_NoFutureDate('Update_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Start_Dte,
	Appl_Id,
	End_Dte,
	Mthly_Income_Hke,
	Payroll_Ccy_Code,
	Update_Dte,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Start_Dte','__NoFutureDate_valid_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
