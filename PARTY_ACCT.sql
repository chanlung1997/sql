WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Acct_Party_End_Dte  AS  DATE)  AS  Acct_Party_End_Dte,
	CAST(Acct_Party_Role_Code  AS  STRING)  AS  Acct_Party_Role_Code,
	CAST(Acct_Party_Role_Seq  AS  INT64)  AS  Acct_Party_Role_Seq,
	CAST(Acct_Party_Start_Dte  AS  DATE)  AS  Acct_Party_Start_Dte,
	CAST(Aloc_Pct  AS  NUMERIC)  AS  Aloc_Pct,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	CAST(Guarantor_Limit_Hke  AS  NUMERIC)  AS  Guarantor_Limit_Hke,
	CAST(Primary_Owner_Ind  AS  STRING)  AS  Primary_Owner_Ind,
	CAST(Rel_Setup_By_Offr_Id  AS  STRING)  AS  Rel_Setup_By_Offr_Id
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Acct_Party_End_Dte')}},
	{{validate_NoFutureDate('Acct_Party_Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Doc_Nbr,
Doc_Type_Code,
Issue_Country_Code,
Acct_Nbr,
Acct_Party_End_Dte,
Acct_Party_Role_Code,
Acct_Party_Role_Seq,
Acct_Party_Start_Dte,
Aloc_Pct,
Appl_Id,
Control_Fields,
Create_By_Offr_Id,
Guarantor_Limit_Hke,
Primary_Owner_Ind,
Rel_Setup_By_Offr_Id,
	{{  aggregate_validation_columns(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Acct_Party_End_Dte','__NoFutureDate_valid_Acct_Party_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
