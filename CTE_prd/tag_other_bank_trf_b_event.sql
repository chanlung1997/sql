WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_other_bank_trf_b_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Ben_Instit_Name  AS  STRING)  AS  Ben_Instit_Name,
	SAFE_CAST(Ben_Name  AS  STRING)  AS  Ben_Name,
	SAFE_CAST(Ccy_Code  AS  STRING)  AS  Ccy_Code,
	SAFE_CAST(Event_Rem  AS  STRING)  AS  Event_Rem,
	SAFE_CAST(Ext_Cust_Info  AS  STRING)  AS  Ext_Cust_Info,
	SAFE_CAST(Instit_Info_Rem  AS  STRING)  AS  Instit_Info_Rem,
	SAFE_CAST(Instr_Amt  AS  NUMERIC)  AS  Instr_Amt,
	SAFE_CAST(Instr_Amt_Hke  AS  NUMERIC)  AS  Instr_Amt_Hke,
	SAFE_CAST(Inter_Bank_Info  AS  STRING)  AS  Inter_Bank_Info,
	SAFE_CAST(Sender_Receiver_Info  AS  STRING)  AS  Sender_Receiver_Info
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
