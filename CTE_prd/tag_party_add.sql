WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_add_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Add_Contact_Id  AS  STRING)  AS  Add_Contact_Id,
	SAFE_CAST(Add_Use_Code  AS  STRING)  AS  Add_Use_Code,
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Add_Line_1  AS  STRING)  AS  Add_Line_1,
	SAFE_CAST(Add_Line_2  AS  STRING)  AS  Add_Line_2,
	SAFE_CAST(Add_Line_3  AS  STRING)  AS  Add_Line_3,
	SAFE_CAST(Add_Line_4  AS  STRING)  AS  Add_Line_4,
	SAFE_CAST(Add_Line_5  AS  STRING)  AS  Add_Line_5,
	SAFE_CAST(Country_Code  AS  STRING)  AS  Country_Code,
	SAFE_CAST(Ctry_Val  AS  STRING)  AS  Ctry_Val,
	SAFE_CAST(Ctry_Val_Update_Ctr_Id  AS  STRING)  AS  Ctry_Val_Update_Ctr_Id,
	SAFE_CAST(Ctry_Val_Update_Dte  AS  DATE)  AS  Ctry_Val_Update_Dte,
	SAFE_CAST(Ctry_Val_Update_Offr_Id  AS  STRING)  AS  Ctry_Val_Update_Offr_Id,
	SAFE_CAST(District_Code  AS  STRING)  AS  District_Code,
	SAFE_CAST(Last_Update_Dte  AS  DATE)  AS  Last_Update_Dte,
	SAFE_CAST(Permanent_Add_Ind  AS  STRING)  AS  Permanent_Add_Ind,
	SAFE_CAST(Postal_Code  AS  STRING)  AS  Postal_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_CountryCode('Country_Code')}},
	{{validate_Acpt_range_0132to9999('Ctry_Val_Update_Ctr_Id')}},
	{{validate_NoFutureDate('Ctry_Val_Update_Dte')}},
	{{validate_Acpt_len_6_7_space_null('Ctry_Val_Update_Offr_Id')}},
	{{validate_NoFutureDate('Last_Update_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Add_Contact_Id,
	Add_Use_Code,
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Add_Line_1,
	Add_Line_2,
	Add_Line_3,
	Add_Line_4,
	Add_Line_5,
	Country_Code,
	Ctry_Val,
	Ctry_Val_Update_Ctr_Id,
	Ctry_Val_Update_Dte,
	Ctry_Val_Update_Offr_Id,
	District_Code,
	Last_Update_Dte,
	Permanent_Add_Ind,
	Postal_Code,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__CountryCode_valid_Country_Code','__Acpt_range_0132to9999_valid_Ctry_Val_Update_Ctr_Id','__NoFutureDate_valid_Ctry_Val_Update_Dte','__Acpt_len_6_7_space_null_valid_Ctry_Val_Update_Offr_Id','__NoFutureDate_valid_Last_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
