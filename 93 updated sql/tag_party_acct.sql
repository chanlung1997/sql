WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Acct_Party_End_Dte  AS  DATE)  AS  Acct_Party_End_Dte,
	SAFE_CAST(Acct_Party_Role_Code  AS  STRING)  AS  Acct_Party_Role_Code,
	SAFE_CAST(Acct_Party_Role_Seq  AS  INT64)  AS  Acct_Party_Role_Seq,
	SAFE_CAST(Acct_Party_Start_Dte  AS  DATE)  AS  Acct_Party_Start_Dte,
	SAFE_CAST(Aloc_Pct  AS  NUMERIC)  AS  Aloc_Pct,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	SAFE_CAST(Guarantor_Limit_Hke  AS  NUMERIC)  AS  Guarantor_Limit_Hke,
	SAFE_CAST(Primary_Owner_Ind  AS  STRING)  AS  Primary_Owner_Ind,
	SAFE_CAST(Rel_Setup_By_Offr_Id  AS  STRING)  AS  Rel_Setup_By_Offr_Id,
	SAFE_CAST(Stmt_Type_Code  AS  STRING)  AS  Stmt_Type_Code
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
	Stmt_Type_Code,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Acct_Party_End_Dte','__NoFutureDate_valid_Acct_Party_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
