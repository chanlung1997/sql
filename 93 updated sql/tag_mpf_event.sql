WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_mpf_event_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Event_Id  AS  STRING)  AS  Event_Id,
	SAFE_CAST(Confirm_Dte  AS  DATE)  AS  Confirm_Dte,
	SAFE_CAST(Contrib_Batch_Nbr  AS  STRING)  AS  Contrib_Batch_Nbr,
	SAFE_CAST(Contrib_Bill_Type_Code  AS  STRING)  AS  Contrib_Bill_Type_Code,
	SAFE_CAST(Cover_Fr_Dte  AS  DATE)  AS  Cover_Fr_Dte,
	SAFE_CAST(Cover_To_Dte  AS  DATE)  AS  Cover_To_Dte,
	SAFE_CAST(Er_Acct_Nbr  AS  INT64)  AS  Er_Acct_Nbr,
	SAFE_CAST(Er_Appl_Id  AS  STRING)  AS  Er_Appl_Id,
	SAFE_CAST(Er_Control_Fields  AS  STRING)  AS  Er_Control_Fields,
	SAFE_CAST(Er_Ee_Ind  AS  STRING)  AS  Er_Ee_Ind,
	SAFE_CAST(Event_Unit  AS  NUMERIC)  AS  Event_Unit,
	SAFE_CAST(Fund_Code  AS  STRING)  AS  Fund_Code,
	SAFE_CAST(Fund_Price_Dte  AS  DATE)  AS  Fund_Price_Dte,
	SAFE_CAST(Mpf_Plan_Type_Code  AS  STRING)  AS  Mpf_Plan_Type_Code,
	SAFE_CAST(Plan_Nbr  AS  STRING)  AS  Plan_Nbr
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Confirm_Dte')}},
	{{validate_Max_len_12('Contrib_Batch_Nbr')}},
	{{validate_Future_Date('Cover_Fr_Dte')}},
	{{validate_Future_Date('Cover_To_Dte')}},
	{{validate_NoFutureDate('Fund_Price_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Event_Id,
	Confirm_Dte,
	Contrib_Batch_Nbr,
	Contrib_Bill_Type_Code,
	Cover_Fr_Dte,
	Cover_To_Dte,
	Er_Acct_Nbr,
	Er_Appl_Id,
	Er_Control_Fields,
	Er_Ee_Ind,
	Event_Unit,
	Fund_Code,
	Fund_Price_Dte,
	Mpf_Plan_Type_Code,
	Plan_Nbr,
	{{  full_valid_flag(['__NoFutureDate_valid_Confirm_Dte','__Max_len_12_valid_Contrib_Batch_Nbr','__Future_Date_valid_Cover_Fr_Dte','__Future_Date_valid_Cover_To_Dte','__NoFutureDate_valid_Fund_Price_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
