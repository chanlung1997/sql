WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.ORG_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Auth_Capital_Amt  AS  NUMERIC)  AS  Auth_Capital_Amt,
	CAST(Business_Establishment  AS  STRING)  AS  Business_Establishment,
	CAST(Ccy_Code  AS  STRING)  AS  Ccy_Code,
	CAST(Contact_Person  AS  STRING)  AS  Contact_Person,
	CAST(Corporate_Plan  AS  STRING)  AS  Corporate_Plan,
	CAST(Incorporation_Dte  AS  DATE)  AS  Incorporation_Dte,
	CAST(Nbr_Of_Employee  AS  NUMERIC)  AS  Nbr_Of_Employee,
	CAST(Org_Business_Type_Code  AS  STRING)  AS  Org_Business_Type_Code,
	CAST(Paid_Up_Capital_Amt  AS  NUMERIC)  AS  Paid_Up_Capital_Amt,
	CAST(Place_Of_Operation  AS  STRING)  AS  Place_Of_Operation
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
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
	{{  aggregate_validation_columns(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Incorporation_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
