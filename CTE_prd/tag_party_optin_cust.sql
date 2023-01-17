WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_optin_cust_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Party_Intl_Nbr  AS  STRING)  AS  Party_Intl_Nbr,
	SAFE_CAST(Entity_Nbr  AS  STRING)  AS  Entity_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Doc_Nbr  AS  STRING)  AS  Doc_Nbr,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Party_Name  AS  STRING)  AS  Party_Name,
	SAFE_CAST(Prod_Type_Code  AS  STRING)  AS  Prod_Type_Code,
	SAFE_CAST(Chnl_Type_Code  AS  STRING)  AS  Chnl_Type_Code,
	SAFE_CAST(Optin_Ind  AS  STRING)  AS  Optin_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_CountryCode('Issue_Country_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Party_Intl_Nbr,
	Entity_Nbr,
	Doc_Type_Code,
	Doc_Nbr,
	Issue_Country_Code,
	Party_Name,
	Prod_Type_Code,
	Chnl_Type_Code,
	Optin_Ind,
	{{  full_valid_flag(['__DocTypeCode_valid_Doc_Type_Code','__HKID_valid_Doc_Nbr','__CountryCode_valid_Issue_Country_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
