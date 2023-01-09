WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_optin_cust_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Party_Intl_Nbr  AS  STRING)  AS  Party_Intl_Nbr,
	SAFE_CAST(Prod_Type_Code  AS  STRING)  AS  Prod_Type_Code,
	SAFE_CAST(Optin_Ind  AS  STRING)  AS  Optin_Ind,
	SAFE_CAST(Party_Name  AS  STRING)  AS  Party_Name
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Chnl_Type_Code,
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Party_Intl_Nbr,
	Prod_Type_Code,
	Optin_Ind,
	Party_Name,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
