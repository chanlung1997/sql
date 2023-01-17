WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_other_chq_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Chq_Nbr  AS  INT64)  AS  Chq_Nbr,
	SAFE_CAST(Chq_Prefix_Nbr  AS  STRING)  AS  Chq_Prefix_Nbr,
	SAFE_CAST(Chq_Seq_Nbr  AS  STRING)  AS  Chq_Seq_Nbr,
	SAFE_CAST(Chq_Ccy_Code  AS  STRING)  AS  Chq_Ccy_Code,
	SAFE_CAST(Event_Dte  AS  DATE)  AS  Event_Dte,
	SAFE_CAST(Trx_Nbr  AS  STRING)  AS  Trx_Nbr,
	SAFE_CAST(Acct_Ccy_Code  AS  STRING)  AS  Acct_Ccy_Code,
	SAFE_CAST(Appl_Doc_Nbr  AS  INT64)  AS  Appl_Doc_Nbr,
	SAFE_CAST(Appl_Doc_Type_Code  AS  STRING)  AS  Appl_Doc_Type_Code,
	SAFE_CAST(Appl_Issue_Country_Code  AS  STRING)  AS  Appl_Issue_Country_Code,
	SAFE_CAST(Chq_Amt  AS  NUMERIC)  AS  Chq_Amt,
	SAFE_CAST(Chq_Status_Code  AS  STRING)  AS  Chq_Status_Code,
	SAFE_CAST(Chq_Type  AS  STRING)  AS  Chq_Type,
	SAFE_CAST(Chq_Type_Code  AS  STRING)  AS  Chq_Type_Code,
	SAFE_CAST(Last_Mod_Centre_Id  AS  STRING)  AS  Last_Mod_Centre_Id,
	SAFE_CAST(Last_Mod_Offr_Id  AS  STRING)  AS  Last_Mod_Offr_Id,
	SAFE_CAST(Last_Mod_Dte  AS  DATE)  AS  Last_Mod_Dte,
	SAFE_CAST(Last_Mod_Time  AS  INT64)  AS  Last_Mod_Time,
	SAFE_CAST(MSOF_Ref  AS  STRING)  AS  MSOF_Ref,
	SAFE_CAST(POF_Remarks  AS  STRING)  AS  POF_Remarks,
	SAFE_CAST(Purpose_Of_Fund  AS  STRING)  AS  Purpose_Of_Fund,
	SAFE_CAST(Rel_to_Acct_Hldr  AS  STRING)  AS  Rel_to_Acct_Hldr,
	SAFE_CAST(Source_Of_Fund  AS  STRING)  AS  Source_Of_Fund,
	SAFE_CAST(Trx_Dte  AS  DATE)  AS  Trx_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Max_len_14('Acct_Nbr')}},
	{{validate_Max_len_11('Appl_Doc_Nbr')}},
	{{validate_CountryCode('Appl_Issue_Country_Code')}},
	{{validate_NoFutureDate('Last_Mod_Dte')}},
	{{validate_NoFutureDate('Trx_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Chq_Nbr,
	Chq_Prefix_Nbr,
	Chq_Seq_Nbr,
	Chq_Ccy_Code,
	Event_Dte,
	Trx_Nbr,
	Acct_Ccy_Code,
	Appl_Doc_Nbr,
	Appl_Doc_Type_Code,
	Appl_Issue_Country_Code,
	Chq_Amt,
	Chq_Status_Code,
	Chq_Type,
	Chq_Type_Code,
	Last_Mod_Centre_Id,
	Last_Mod_Offr_Id,
	Last_Mod_Dte,
	Last_Mod_Time,
	MSOF_Ref,
	POF_Remarks,
	Purpose_Of_Fund,
	Rel_to_Acct_Hldr,
	Source_Of_Fund,
	Trx_Dte,
	{{  full_valid_flag(['__Max_len_14_valid_Acct_Nbr','__Max_len_11_valid_Appl_Doc_Nbr','__CountryCode_valid_Appl_Issue_Country_Code','__NoFutureDate_valid_Last_Mod_Dte','__NoFutureDate_valid_Trx_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
