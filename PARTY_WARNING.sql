WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_WARNING_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Create_Dte  AS  DATE)  AS  Create_Dte,
	CAST(Last_Update_Dte  AS  DATE)  AS  Last_Update_Dte,
	CAST(Seq_Nbr  AS  STRING)  AS  Seq_Nbr,
	CAST(Warning_Categ_Code  AS  STRING)  AS  Warning_Categ_Code,
	CAST(End_Dte  AS  DATE)  AS  End_Dte,
	CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	CAST(Last_Update_Centre_Id  AS  STRING)  AS  Last_Update_Centre_Id,
	CAST(Last_Update_Offr_Id  AS  STRING)  AS  Last_Update_Offr_Id,
	CAST(Multi_Watch_List_Ind  AS  STRING)  AS  Multi_Watch_List_Ind,
	CAST(Place_by_Centre_Id  AS  STRING)  AS  Place_by_Centre_Id,
	CAST(Place_By_Offr_Id  AS  STRING)  AS  Place_By_Offr_Id,
	CAST(UID_Hit_Pct  AS  STRING)  AS  UID_Hit_Pct,
	CAST(User_Comment  AS  STRING)  AS  User_Comment
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Last_Update_Dte')}},
	{{validate_Future_Date('Expiry_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Doc_Nbr,
Doc_Type_Code,
Issue_Country_Code,
Create_Dte,
Last_Update_Dte,
Seq_Nbr,
Warning_Categ_Code,
End_Dte,
Expiry_Dte,
Last_Update_Centre_Id,
Last_Update_Offr_Id,
Multi_Watch_List_Ind,
Place_by_Centre_Id,
Place_By_Offr_Id,
UID_Hit_Pct,
User_Comment,
	{{  aggregate_validation_columns(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Last_Update_Dte','__Future_Date_valid_Expiry_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
