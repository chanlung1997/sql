WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_org_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Auth_Capital_Amt  AS  NUMERIC)  AS  Auth_Capital_Amt,
	SAFE_CAST(Business_Establishment  AS  STRING)  AS  Business_Establishment,
	SAFE_CAST(Ccy_Code  AS  STRING)  AS  Ccy_Code,
	SAFE_CAST(Contact_Person  AS  STRING)  AS  Contact_Person,
	SAFE_CAST(Corporate_Plan  AS  STRING)  AS  Corporate_Plan,
	SAFE_CAST(Incorporation_Dte  AS  DATE)  AS  Incorporation_Dte,
	SAFE_CAST(Nbr_Of_Employee  AS  NUMERIC)  AS  Nbr_Of_Employee,
	SAFE_CAST(Org_Business_Type_Code  AS  STRING)  AS  Org_Business_Type_Code,
	SAFE_CAST(Paid_Up_Capital_Amt  AS  NUMERIC)  AS  Paid_Up_Capital_Amt,
	SAFE_CAST(Place_Of_Operation  AS  STRING)  AS  Place_Of_Operation,
	SAFE_CAST(Place_Of_Origin  AS  STRING)  AS  Place_Of_Origin
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Incorporation_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Auth_Capital_Amt,
	Business_Establishment,
	Ccy_Code,
	Contact_Person,
	Corporate_Plan,
	Incorporation_Dte,
	Nbr_Of_Employee,
	Org_Business_Type_Code,
	Paid_Up_Capital_Amt,
	Place_Of_Operation,
	Place_Of_Origin,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Incorporation_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
