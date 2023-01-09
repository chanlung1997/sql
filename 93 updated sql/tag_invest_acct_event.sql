WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_invest_acct_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Event_Dte  AS  DATE)  AS  Event_Dte,
	SAFE_CAST(Trx_Seq  AS  STRING)  AS  Trx_Seq,
	SAFE_CAST(Event_Amt  AS  NUMERIC)  AS  Event_Amt,
	SAFE_CAST(Event_Ccy_Code  AS  STRING)  AS  Event_Ccy_Code,
	SAFE_CAST(Event_Desc  AS  STRING)  AS  Event_Desc,
	SAFE_CAST(Event_Ref  AS  STRING)  AS  Event_Ref,
	SAFE_CAST(Event_Type  AS  STRING)  AS  Event_Type,
	SAFE_CAST(Qty  AS  NUMERIC)  AS  Qty,
	SAFE_CAST(Trx_Code  AS  STRING)  AS  Trx_Code,
	SAFE_CAST(Unit_Price  AS  NUMERIC)  AS  Unit_Price
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
	Unit_Price,
	{{  full_valid_flag(['__Acpt_len_6_14_15_valid_Acct_Nbr','__Event_Type_8items_valid_Event_Type'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
