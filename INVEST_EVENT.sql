WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.INVEST_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Ccy_Pair  AS  STRING)  AS  Ccy_Pair,
	CAST(Deal_Rate  AS  NUMERIC)  AS  Deal_Rate,
	CAST(Delivery_Dte  AS  DATE)  AS  Delivery_Dte,
	CAST(Event_Amt  AS  NUMERIC)  AS  Event_Amt,
	CAST(Event_Amt_Hke  AS  NUMERIC)  AS  Event_Amt_Hke,
	CAST(Event_Ccy_Code  AS  STRING)  AS  Event_Ccy_Code,
	CAST(Event_Country_Code  AS  STRING)  AS  Event_Country_Code,
	CAST(Event_Ex_Rate  AS  NUMERIC)  AS  Event_Ex_Rate,
	CAST(Event_Type  AS  STRING)  AS  Event_Type,
	CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Delivery_Dte')}},
	{{validate_CountryCode('Event_Country_Code')}},
	{{validate_Event_Type_3items('Event_Type')}},
	{{validate_NoFutureDate('Expiry_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Delivery_Dte,
Event_Amt,
Event_Amt_Hke,
Event_Ccy_Code,
Event_Country_Code,
Event_Ex_Rate,
Event_Type,
Expiry_Dte,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Delivery_Dte','__CountryCode_valid_Event_Country_Code','__Event_Type_3items_valid_Event_Type','__NoFutureDate_valid_Expiry_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
