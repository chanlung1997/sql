WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_exp_rem_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_id  AS  STRING)  AS  Event_id,
	SAFE_CAST(Rel_Dr_Acct_Nbr  AS  INT64)  AS  Rel_Dr_Acct_Nbr,
	SAFE_CAST(Rel_Dr_Appl_Id  AS  STRING)  AS  Rel_Dr_Appl_Id,
	SAFE_CAST(Rel_Dr_Control_Fields  AS  STRING)  AS  Rel_Dr_Control_Fields,
	SAFE_CAST(Remitter_Acct_Nbr  AS  STRING)  AS  Remitter_Acct_Nbr,
	SAFE_CAST(Remitter_Add  AS  STRING)  AS  Remitter_Add,
	SAFE_CAST(Remitter_Msg  AS  STRING)  AS  Remitter_Msg,
	SAFE_CAST(Remitter_Name  AS  STRING)  AS  Remitter_Name,
	SAFE_CAST(Swift_Code  AS  STRING)  AS  Swift_Code,
	SAFE_CAST(Trx_Req_Dte  AS  DATE)  AS  Trx_Req_Dte,
	SAFE_CAST(Trx_Used_Code  AS  STRING)  AS  Trx_Used_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Trx_Req_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Event_id,
	Rel_Dr_Acct_Nbr,
	Rel_Dr_Appl_Id,
	Rel_Dr_Control_Fields,
	Remitter_Acct_Nbr,
	Remitter_Add,
	Remitter_Msg,
	Remitter_Name,
	Swift_Code,
	Trx_Req_Dte,
	Trx_Used_Code,
	{{  full_valid_flag(['__NoFutureDate_valid_Trx_Req_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
