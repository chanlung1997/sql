WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_CR_CARD_APPL_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Appl_Nbr  AS  STRING)  AS  Appl_Nbr,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Cr_Card_Appl_Form_Type  AS  STRING)  AS  Cr_Card_Appl_Form_Type,
	CAST(Cr_Limit_Amt  AS  NUMERIC)  AS  Cr_Limit_Amt,
	CAST(Cyber_Card_Limit  AS  NUMERIC)  AS  Cyber_Card_Limit,
	CAST(Cyber_Card_Nbr  AS  STRING)  AS  Cyber_Card_Nbr,
	CAST(Memb_Nbr  AS  STRING)  AS  Memb_Nbr,
	CAST(Octopus_Ind  AS  STRING)  AS  Octopus_Ind,
	CAST(Other_Income_Source  AS  STRING)  AS  Other_Income_Source,
	CAST(Other_Income_Amt  AS  NUMERIC)  AS  Other_Income_Amt,
	CAST(Personal_Ref_Exist_Ind  AS  STRING)  AS  Personal_Ref_Exist_Ind,
	CAST(Res_Mthly_Pmt_Amt  AS  NUMERIC)  AS  Res_Mthly_Pmt_Amt
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
	{{  aggregate_validation_columns(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
