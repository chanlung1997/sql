WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_security_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Commission_Amt  AS  NUMERIC)  AS  Commission_Amt,
	SAFE_CAST(Deposit_Amt  AS  NUMERIC)  AS  Deposit_Amt,
	SAFE_CAST(Depot_Ind  AS  STRING)  AS  Depot_Ind,
	SAFE_CAST(Due_Dte  AS  DATE)  AS  Due_Dte,
	SAFE_CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	SAFE_CAST(Financing_Pct  AS  NUMERIC)  AS  Financing_Pct,
	SAFE_CAST(Input_Request_Price  AS  NUMERIC)  AS  Input_Request_Price,
	SAFE_CAST(Int_Rate  AS  NUMERIC)  AS  Int_Rate,
	SAFE_CAST(Ln_Amt  AS  NUMERIC)  AS  Ln_Amt,
	SAFE_CAST(Location_Ind  AS  STRING)  AS  Location_Ind,
	SAFE_CAST(Qty  AS  NUMERIC)  AS  Qty,
	SAFE_CAST(Stock_Code  AS  STRING)  AS  Stock_Code
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
	Event_Id,
	Commission_Amt,
	Deposit_Amt,
	Depot_Ind,
	Due_Dte,
	Expiry_Dte,
	Financing_Pct,
	Input_Request_Price,
	Int_Rate,
	Ln_Amt,
	Location_Ind,
	Qty,
	Stock_Code,
	{{  full_valid_flag(['__Future_Date_valid_Due_Dte','__Future_Date_valid_Expiry_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
