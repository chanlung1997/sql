WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.EXP_REM_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_id  AS  STRING)  AS  Event_id,
	CAST(Rel_Dr_Acct_Nbr  AS  INT64)  AS  Rel_Dr_Acct_Nbr,
	CAST(Rel_Dr_Appl_Id  AS  STRING)  AS  Rel_Dr_Appl_Id,
	CAST(Rel_Dr_Control_Fields  AS  STRING)  AS  Rel_Dr_Control_Fields,
	CAST(Remitter_Acct_Nbr  AS  STRING)  AS  Remitter_Acct_Nbr,
	CAST(Remitter_Add  AS  STRING)  AS  Remitter_Add,
	CAST(Remitter_Msg  AS  STRING)  AS  Remitter_Msg,
	CAST(Remitter_Name  AS  STRING)  AS  Remitter_Name,
	CAST(Swift_Code  AS  STRING)  AS  Swift_Code,
	CAST(Trx_Req_Dte  AS  DATE)  AS  Trx_Req_Dte
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
Trx_Req_Dte,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Trx_Req_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
