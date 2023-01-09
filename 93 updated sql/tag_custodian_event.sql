WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_custodian_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Accrued_Int_Amt  AS  NUMERIC)  AS  Accrued_Int_Amt,
	SAFE_CAST(Fee_Income  AS  NUMERIC)  AS  Fee_Income,
	SAFE_CAST(Event_Nature_Code  AS  STRING)  AS  Event_Nature_Code,
	SAFE_CAST(Pmt_Instr_Code  AS  STRING)  AS  Pmt_Instr_Code,
	SAFE_CAST(Qty  AS  NUMERIC)  AS  Qty,
	SAFE_CAST(Stock_Code  AS  STRING)  AS  Stock_Code,
	SAFE_CAST(Taxation_Amt  AS  NUMERIC)  AS  Taxation_Amt,
	SAFE_CAST(Trade_Ind  AS  STRING)  AS  Trade_Ind,
	SAFE_CAST(Unit_Price  AS  NUMERIC)  AS  Unit_Price,
	SAFE_CAST(US_Source_of_Fund_Ind  AS  STRING)  AS  US_Source_of_Fund_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
