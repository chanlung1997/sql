WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_TU_POSITIVE_DATA_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Appl_Sys  AS  STRING)  AS  Appl_Sys,
	CAST(BEA_Consent_Recd_Dte  AS  DATE)  AS  BEA_Consent_Recd_Dte,
	CAST(BEA_Wd_Req_Dte  AS  DATE)  AS  BEA_Wd_Req_Dte,
	CAST(Other_Bank_Consent_Recd_Dte  AS  DATE)  AS  Other_Bank_Consent_Recd_Dte,
	CAST(Other_Bank_Wd_Req_Dte  AS  DATE)  AS  Other_Bank_Wd_Req_Dte,
	CAST(Tot_Nbr_of_ML_TU  AS  NUMERIC)  AS  Tot_Nbr_of_ML_TU
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
	{{  aggregate_validation_columns(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__Future_Date_valid_BEA_Consent_Recd_Dte','__NoFutureDate_valid_BEA_Wd_Req_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
