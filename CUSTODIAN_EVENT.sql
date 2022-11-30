WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CUSTODIAN_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Accrued_Int_Amt  AS  NUMERIC)  AS  Accrued_Int_Amt,
	CAST(Fee_Income  AS  NUMERIC)  AS  Fee_Income,
	CAST(Event_Nature_Code  AS  STRING)  AS  Event_Nature_Code,
	CAST(Pmt_Instr_Code  AS  STRING)  AS  Pmt_Instr_Code,
	CAST(Qty  AS  NUMERIC)  AS  Qty,
	CAST(Stock_Code  AS  STRING)  AS  Stock_Code,
	CAST(Taxation_Amt  AS  NUMERIC)  AS  Taxation_Amt,
	CAST(Trade_Ind  AS  STRING)  AS  Trade_Ind,
	CAST(Unit_Price  AS  NUMERIC)  AS  Unit_Price
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
