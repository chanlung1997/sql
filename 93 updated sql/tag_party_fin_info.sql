WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_fin_info_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Seq_Nbr  AS  NUMERIC)  AS  Seq_Nbr,
	SAFE_CAST(Ccy_Code  AS  STRING)  AS  Ccy_Code,
	SAFE_CAST(Create_By_Centre_Id  AS  STRING)  AS  Create_By_Centre_Id,
	SAFE_CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	SAFE_CAST(Create_Dte  AS  DATE)  AS  Create_Dte,
	SAFE_CAST(Details  AS  STRING)  AS  Details,
	SAFE_CAST(Fin_Info_Amt  AS  NUMERIC)  AS  Fin_Info_Amt,
	SAFE_CAST(Fin_Info_Type_Code  AS  STRING)  AS  Fin_Info_Type_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Create_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Seq_Nbr,
	Ccy_Code,
	Create_By_Centre_Id,
	Create_By_Offr_Id,
	Create_Dte,
	Details,
	Fin_Info_Amt,
	Fin_Info_Type_Code,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Create_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
