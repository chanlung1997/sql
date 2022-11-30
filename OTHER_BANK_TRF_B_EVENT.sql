WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.OTHER_BANK_TRF_B_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Ben_Instit_Name  AS  STRING)  AS  Ben_Instit_Name,
	CAST(Ben_Name  AS  STRING)  AS  Ben_Name,
	CAST(Ccy_Code  AS  STRING)  AS  Ccy_Code,
	CAST(Event_Rem  AS  STRING)  AS  Event_Rem,
	CAST(Ext_Cust_Info  AS  STRING)  AS  Ext_Cust_Info,
	CAST(Instit_Info_Rem  AS  STRING)  AS  Instit_Info_Rem,
	CAST(Instr_Amt  AS  NUMERIC)  AS  Instr_Amt,
	CAST(Instr_Amt_Hke  AS  NUMERIC)  AS  Instr_Amt_Hke,
	CAST(Inter_Bank_Info  AS  STRING)  AS  Inter_Bank_Info
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
