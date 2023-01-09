WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_tu_positive_data_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Appl_Sys  AS  STRING)  AS  Appl_Sys,
	SAFE_CAST(BEA_Consent_Recd_Dte  AS  DATE)  AS  BEA_Consent_Recd_Dte,
	SAFE_CAST(BEA_Wd_Req_Dte  AS  DATE)  AS  BEA_Wd_Req_Dte,
	SAFE_CAST(Other_Bank_Consent_Recd_Dte  AS  DATE)  AS  Other_Bank_Consent_Recd_Dte,
	SAFE_CAST(Other_Bank_Wd_Req_Dte  AS  DATE)  AS  Other_Bank_Wd_Req_Dte,
	SAFE_CAST(Tot_Nbr_of_ML_TU  AS  NUMERIC)  AS  Tot_Nbr_of_ML_TU,
	SAFE_CAST(Tot_Nbr_of_ML_Applicant  AS  NUMERIC)  AS  Tot_Nbr_of_ML_Applicant
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_Future_Date('BEA_Consent_Recd_Dte')}},
	{{validate_NoFutureDate('BEA_Wd_Req_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Appl_Sys,
	BEA_Consent_Recd_Dte,
	BEA_Wd_Req_Dte,
	Other_Bank_Consent_Recd_Dte,
	Other_Bank_Wd_Req_Dte,
	Tot_Nbr_of_ML_TU,
	Tot_Nbr_of_ML_Applicant,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__Future_Date_valid_BEA_Consent_Recd_Dte','__NoFutureDate_valid_BEA_Wd_Req_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
