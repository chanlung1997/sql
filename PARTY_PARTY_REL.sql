WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_PARTY_REL_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Party_Rel_Start_Dte  AS  DATE)  AS  Party_Rel_Start_Dte,
	CAST(Party_Rel_Type_Code  AS  STRING)  AS  Party_Rel_Type_Code,
	CAST(Related_Doc_Nbr  AS  INT64)  AS  Related_Doc_Nbr,
	CAST(Related_Doc_Type_Code  AS  STRING)  AS  Related_Doc_Type_Code,
	CAST(Related_Issue_Country_Code  AS  STRING)  AS  Related_Issue_Country_Code,
	CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	CAST(Party_Rel_End_Dte  AS  DATE)  AS  Party_Rel_End_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Party_Rel_Start_Dte')}},
	{{validate_CountryCode('Related_Issue_Country_Code')}},
	{{validate_Future_Date('Party_Rel_End_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Doc_Nbr,
Doc_Type_Code,
Issue_Country_Code,
Party_Rel_Start_Dte,
Party_Rel_Type_Code,
Related_Doc_Nbr,
Related_Doc_Type_Code,
Related_Issue_Country_Code,
Create_By_Offr_Id,
Party_Rel_End_Dte,
	{{  aggregate_validation_columns(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Party_Rel_Start_Dte','__CountryCode_valid_Related_Issue_Country_Code','__Future_Date_valid_Party_Rel_End_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
