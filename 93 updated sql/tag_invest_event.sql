WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_invest_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Ccy_Pair  AS  STRING)  AS  Ccy_Pair,
	SAFE_CAST(Deal_Rate  AS  NUMERIC)  AS  Deal_Rate,
	SAFE_CAST(Delivery_Dte  AS  DATE)  AS  Delivery_Dte,
	SAFE_CAST(Event_Amt  AS  NUMERIC)  AS  Event_Amt,
	SAFE_CAST(Event_Amt_Hke  AS  NUMERIC)  AS  Event_Amt_Hke,
	SAFE_CAST(Event_Ccy_Code  AS  STRING)  AS  Event_Ccy_Code,
	SAFE_CAST(Event_Country_Code  AS  STRING)  AS  Event_Country_Code,
	SAFE_CAST(Event_Ex_Rate  AS  NUMERIC)  AS  Event_Ex_Rate,
	SAFE_CAST(Event_Type  AS  STRING)  AS  Event_Type,
	SAFE_CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	SAFE_CAST(Val_Dte  AS  DATE)  AS  Val_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Delivery_Dte')}},
	{{validate_CountryCode('Event_Country_Code')}},
	{{validate_Event_Type_3items('Event_Type')}},
	{{validate_NoFutureDate('Expiry_Dte')}},
	{{validate_Future_Date('Val_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Event_Id,
	Ccy_Pair,
	Deal_Rate,
	Delivery_Dte,
	Event_Amt,
	Event_Amt_Hke,
	Event_Ccy_Code,
	Event_Country_Code,
	Event_Ex_Rate,
	Event_Type,
	Expiry_Dte,
	Val_Dte,
	{{  full_valid_flag(['__NoFutureDate_valid_Delivery_Dte','__CountryCode_valid_Event_Country_Code','__Event_Type_3items_valid_Event_Type','__NoFutureDate_valid_Expiry_Dte','__Future_Date_valid_Val_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
