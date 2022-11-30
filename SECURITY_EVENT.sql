WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.SECURITY_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Commission_Amt  AS  NUMERIC)  AS  Commission_Amt,
	CAST(Deposit_Amt  AS  NUMERIC)  AS  Deposit_Amt,
	CAST(Depot_Ind  AS  STRING)  AS  Depot_Ind,
	CAST(Due_Dte  AS  DATE)  AS  Due_Dte,
	CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	CAST(Financing_Pct  AS  NUMERIC)  AS  Financing_Pct,
	CAST(Input_Request_Price  AS  NUMERIC)  AS  Input_Request_Price,
	CAST(Int_Rate  AS  NUMERIC)  AS  Int_Rate,
	CAST(Ln_Amt  AS  NUMERIC)  AS  Ln_Amt,
	CAST(Location_Ind  AS  STRING)  AS  Location_Ind,
	CAST(Qty  AS  NUMERIC)  AS  Qty
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Due_Dte')}},
	{{validate_Future_Date('Expiry_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Due_Dte,
Expiry_Dte,
Financing_Pct,
Input_Request_Price,
Int_Rate,
Ln_Amt,
Location_Ind,
Qty,
	{{  aggregate_validation_columns(['__Future_Date_valid_Due_Dte','__Future_Date_valid_Expiry_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
