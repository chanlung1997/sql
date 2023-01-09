WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_fps_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Chq_Nbr  AS  STRING)  AS  Chq_Nbr,
	SAFE_CAST(Cr_Dr_Ind  AS  STRING)  AS  Cr_Dr_Ind,
	SAFE_CAST(Event_Amt  AS  NUMERIC)  AS  Event_Amt,
	SAFE_CAST(Event_Amt_Hke  AS  NUMERIC)  AS  Event_Amt_Hke,
	SAFE_CAST(Event_Amt_Media_Code  AS  STRING)  AS  Event_Amt_Media_Code,
	SAFE_CAST(Event_Categ_Code  AS  STRING)  AS  Event_Categ_Code,
	SAFE_CAST(Event_Ccy_Code  AS  STRING)  AS  Event_Ccy_Code,
	SAFE_CAST(Event_Country_Code  AS  STRING)  AS  Event_Country_Code,
	SAFE_CAST(Event_Ex_Rate  AS  NUMERIC)  AS  Event_Ex_Rate,
	SAFE_CAST(Fin_Event_Comment  AS  STRING)  AS  Fin_Event_Comment,
	SAFE_CAST(Mrch_Id  AS  STRING)  AS  Mrch_Id,
	SAFE_CAST(MSOF_Ref  AS  STRING)  AS  MSOF_Ref,
	SAFE_CAST(Override_Ind  AS  STRING)  AS  Override_Ind,
	SAFE_CAST(POF_Remarks  AS  STRING)  AS  POF_Remarks,
	SAFE_CAST(Purpose_Of_Fund  AS  STRING)  AS  Purpose_Of_Fund,
	SAFE_CAST(Rel_to_Acct_Hldr  AS  STRING)  AS  Rel_to_Acct_Hldr,
	SAFE_CAST(Source_Of_Fund  AS  STRING)  AS  Source_Of_Fund,
	SAFE_CAST(Trx_Linked_Ref  AS  STRING)  AS  Trx_Linked_Ref,
	SAFE_CAST(Trx_Nbr  AS  STRING)  AS  Trx_Nbr,
	SAFE_CAST(Val_Dte  AS  DATE)  AS  Val_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
