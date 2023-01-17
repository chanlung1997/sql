WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_grp_member_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Grp_Type_Code  AS  STRING)  AS  Grp_Type_Code,
	SAFE_CAST(Party_Intl_Nbr  AS  STRING)  AS  Party_Intl_Nbr,
	SAFE_CAST(Rel_Code  AS  STRING)  AS  Rel_Code,
	SAFE_CAST(Rel_Party_Grp_Nbr  AS  STRING)  AS  Rel_Party_Grp_Nbr,
	SAFE_CAST(Rel_Start_Dte  AS  DATE)  AS  Rel_Start_Dte,
	SAFE_CAST(Created_by_Offr_Id  AS  STRING)  AS  Created_by_Offr_Id,
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Grp_Type_Name  AS  STRING)  AS  Grp_Type_Name,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Last_Update_Centre_Id  AS  STRING)  AS  Last_Update_Centre_Id,
	SAFE_CAST(Last_Update_Offr_Id  AS  STRING)  AS  Last_Update_Offr_Id,
	SAFE_CAST(Rel_Desc  AS  STRING)  AS  Rel_Desc,
	SAFE_CAST(Rel_End_Dte  AS  DATE)  AS  Rel_End_Dte,
	SAFE_CAST(Rel_Party_Grp_Name  AS  STRING)  AS  Rel_Party_Grp_Name
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Rel_Start_Dte')}},
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_Grp_Type_Name('Grp_Type_Name')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_Future_Date('Rel_End_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Grp_Type_Code,
	Party_Intl_Nbr,
	Rel_Code,
	Rel_Party_Grp_Nbr,
	Rel_Start_Dte,
	Created_by_Offr_Id,
	Doc_Nbr,
	Doc_Type_Code,
	Grp_Type_Name,
	Issue_Country_Code,
	Last_Update_Centre_Id,
	Last_Update_Offr_Id,
	Rel_Desc,
	Rel_End_Dte,
	Rel_Party_Grp_Name,
	{{  full_valid_flag(['__NoFutureDate_valid_Rel_Start_Dte','__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__Grp_Type_Name_valid_Grp_Type_Name','__CountryCode_valid_Issue_Country_Code','__Future_Date_valid_Rel_End_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
