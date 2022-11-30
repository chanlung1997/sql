WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_FIN_INFO_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Seq_Nbr  AS  NUMERIC)  AS  Seq_Nbr,
	CAST(Ccy_Code  AS  STRING)  AS  Ccy_Code,
	CAST(Create_By_Centre_Id  AS  STRING)  AS  Create_By_Centre_Id,
	CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	CAST(Create_Dte  AS  DATE)  AS  Create_Dte,
	CAST(Details  AS  STRING)  AS  Details,
	CAST(Fin_Info_Amt  AS  NUMERIC)  AS  Fin_Info_Amt,
	CAST(Fin_Info_Type_Code  AS  STRING)  AS  Fin_Info_Type_Code
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
	{{  aggregate_validation_columns(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Create_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
