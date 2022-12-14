WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_fin_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
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
	{{validate_Future_Date('Val_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Event_Ex_Rate,
	Fin_Event_Comment,
	Mrch_Id,
	MSOF_Ref,
	Override_Ind,
	POF_Remarks,
	Purpose_Of_Fund,
	Rel_to_Acct_Hldr,
	Source_Of_Fund,
	Trx_Linked_Ref,
	Trx_Nbr,
	Val_Dte,
	{{  full_valid_flag(['__Future_Date_valid_Val_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
