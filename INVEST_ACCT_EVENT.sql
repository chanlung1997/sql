WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.INVEST_ACCT_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Event_Dte  AS  DATE)  AS  Event_Dte,
	CAST(Trx_Seq  AS  STRING)  AS  Trx_Seq,
	CAST(Event_Amt  AS  NUMERIC)  AS  Event_Amt,
	CAST(Event_Ccy_Code  AS  STRING)  AS  Event_Ccy_Code,
	CAST(Event_Desc  AS  STRING)  AS  Event_Desc,
	CAST(Event_Ref  AS  STRING)  AS  Event_Ref,
	CAST(Event_Type  AS  STRING)  AS  Event_Type,
	CAST(Qty  AS  NUMERIC)  AS  Qty,
	CAST(Trx_Code  AS  STRING)  AS  Trx_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Acpt_len_6_14_15('Acct_Nbr')}},
	{{validate_Event_Type_8items('Event_Type')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Acct_Nbr,
Appl_Id,
Control_Fields,
Event_Dte,
Trx_Seq,
Event_Amt,
Event_Ccy_Code,
Event_Desc,
Event_Ref,
Event_Type,
Qty,
Trx_Code,
	{{  aggregate_validation_columns(['__Acpt_len_6_14_15_valid_Acct_Nbr','__Event_Type_8items_valid_Event_Type'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
