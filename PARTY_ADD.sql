WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_ADD_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Add_Contact_Id  AS  STRING)  AS  Add_Contact_Id,
	CAST(Add_Use_Code  AS  STRING)  AS  Add_Use_Code,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Add_Line_1  AS  STRING)  AS  Add_Line_1,
	CAST(Add_Line_2  AS  STRING)  AS  Add_Line_2,
	CAST(Add_Line_3  AS  STRING)  AS  Add_Line_3,
	CAST(Add_Line_4  AS  STRING)  AS  Add_Line_4,
	CAST(Add_Line_5  AS  STRING)  AS  Add_Line_5,
	CAST(Country_Code  AS  STRING)  AS  Country_Code,
	CAST(Ctry_Val  AS  STRING)  AS  Ctry_Val,
	CAST(Ctry_Val_Update_Ctr_Id  AS  STRING)  AS  Ctry_Val_Update_Ctr_Id,
	CAST(Ctry_Val_Update_Dte  AS  DATE)  AS  Ctry_Val_Update_Dte,
	CAST(Ctry_Val_Update_Offr_Id  AS  STRING)  AS  Ctry_Val_Update_Offr_Id,
	CAST(District_Code  AS  STRING)  AS  District_Code,
	CAST(Last_Update_Dte  AS  DATE)  AS  Last_Update_Dte,
	CAST(Permanent_Add_Ind  AS  STRING)  AS  Permanent_Add_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
