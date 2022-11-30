WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.FPS_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Chq_Nbr  AS  STRING)  AS  Chq_Nbr,
	CAST(Cr_Dr_Ind  AS  STRING)  AS  Cr_Dr_Ind,
	CAST(Event_Amt  AS  NUMERIC)  AS  Event_Amt,
	CAST(Event_Amt_Hke  AS  NUMERIC)  AS  Event_Amt_Hke,
	CAST(Event_Amt_Media_Code  AS  STRING)  AS  Event_Amt_Media_Code,
	CAST(Event_Categ_Code  AS  STRING)  AS  Event_Categ_Code,
	CAST(Event_Ccy_Code  AS  STRING)  AS  Event_Ccy_Code,
	CAST(Event_Country_Code  AS  STRING)  AS  Event_Country_Code,
	CAST(Event_Ex_Rate  AS  NUMERIC)  AS  Event_Ex_Rate,
	CAST(Fin_Event_Comment  AS  STRING)  AS  Fin_Event_Comment,
	CAST(Mrch_Id  AS  STRING)  AS  Mrch_Id,
	CAST(MSOF_Ref  AS  STRING)  AS  MSOF_Ref,
	CAST(Override_Ind  AS  STRING)  AS  Override_Ind,
	CAST(POF_Remarks  AS  STRING)  AS  POF_Remarks,
	CAST(Purpose_Of_Fund  AS  STRING)  AS  Purpose_Of_Fund,
	CAST(Rel_to_Acct_Hldr  AS  STRING)  AS  Rel_to_Acct_Hldr,
	CAST(Source_Of_Fund  AS  STRING)  AS  Source_Of_Fund,
	CAST(Trx_Linked_Ref  AS  STRING)  AS  Trx_Linked_Ref,
	CAST(Trx_Nbr  AS  STRING)  AS  Trx_Nbr
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
