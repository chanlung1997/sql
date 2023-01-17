WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_cr_card_appl_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Appl_Nbr  AS  STRING)  AS  Appl_Nbr,
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Cr_Card_Appl_Form_Type  AS  STRING)  AS  Cr_Card_Appl_Form_Type,
	SAFE_CAST(Cr_Limit_Amt  AS  NUMERIC)  AS  Cr_Limit_Amt,
	SAFE_CAST(Cyber_Card_Limit  AS  NUMERIC)  AS  Cyber_Card_Limit,
	SAFE_CAST(Cyber_Card_Nbr  AS  STRING)  AS  Cyber_Card_Nbr,
	SAFE_CAST(Memb_Nbr  AS  STRING)  AS  Memb_Nbr,
	SAFE_CAST(Octopus_Ind  AS  STRING)  AS  Octopus_Ind,
	SAFE_CAST(Other_Income_Source  AS  STRING)  AS  Other_Income_Source,
	SAFE_CAST(Other_Income_Amt  AS  NUMERIC)  AS  Other_Income_Amt,
	SAFE_CAST(Personal_Ref_Exist_Ind  AS  STRING)  AS  Personal_Ref_Exist_Ind,
	SAFE_CAST(Res_Mthly_Pmt_Amt  AS  NUMERIC)  AS  Res_Mthly_Pmt_Amt,
	SAFE_CAST(Yr_Graduated  AS  STRING)  AS  Yr_Graduated
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Appl_Nbr,
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Cr_Card_Appl_Form_Type,
	Cr_Limit_Amt,
	Cyber_Card_Limit,
	Cyber_Card_Nbr,
	Memb_Nbr,
	Octopus_Ind,
	Other_Income_Source,
	Other_Income_Amt,
	Personal_Ref_Exist_Ind,
	Res_Mthly_Pmt_Amt,
	Yr_Graduated,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
