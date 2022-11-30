WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.OTHER_CHQ_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Chq_Nbr  AS  INT64)  AS  Chq_Nbr,
	CAST(Chq_Prefix_Nbr  AS  STRING)  AS  Chq_Prefix_Nbr,
	CAST(Chq_Seq_Nbr  AS  STRING)  AS  Chq_Seq_Nbr,
	CAST(Chq_Ccy_Code  AS  STRING)  AS  Chq_Ccy_Code,
	CAST(Event_Dte  AS  DATE)  AS  Event_Dte,
	CAST(Trx_Nbr  AS  STRING)  AS  Trx_Nbr,
	CAST(Acct_Ccy_Code  AS  STRING)  AS  Acct_Ccy_Code,
	CAST(Appl_Doc_Nbr  AS  INT64)  AS  Appl_Doc_Nbr,
	CAST(Appl_Doc_Type_Code  AS  STRING)  AS  Appl_Doc_Type_Code,
	CAST(Appl_Issue_Country_Code  AS  STRING)  AS  Appl_Issue_Country_Code,
	CAST(Chq_Amt  AS  NUMERIC)  AS  Chq_Amt,
	CAST(Chq_Status_Code  AS  STRING)  AS  Chq_Status_Code,
	CAST(Chq_Type  AS  STRING)  AS  Chq_Type,
	CAST(Chq_Type_Code  AS  STRING)  AS  Chq_Type_Code,
	CAST(Last_Mod_Centre_Id  AS  STRING)  AS  Last_Mod_Centre_Id,
	CAST(Last_Mod_Offr_Id  AS  STRING)  AS  Last_Mod_Offr_Id,
	CAST(Last_Mod_Dte  AS  DATE)  AS  Last_Mod_Dte,
	CAST(Last_Mod_Time  AS  INT64)  AS  Last_Mod_Time,
	CAST(MSOF_Ref  AS  STRING)  AS  MSOF_Ref,
	CAST(POF_Remarks  AS  STRING)  AS  POF_Remarks,
	CAST(Purpose_Of_Fund  AS  STRING)  AS  Purpose_Of_Fund,
	CAST(Rel_to_Acct_Hldr  AS  STRING)  AS  Rel_to_Acct_Hldr,
	CAST(Source_Of_Fund  AS  STRING)  AS  Source_Of_Fund
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
