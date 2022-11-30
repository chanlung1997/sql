WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.HIRE_PURCHASE_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Item_Serial_Nbr  AS  STRING)  AS  Item_Serial_Nbr,
	CAST(Seq_Nbr  AS  NUMERIC)  AS  Seq_Nbr,
	CAST(Categ_Type_Code  AS  STRING)  AS  Categ_Type_Code,
	CAST(Hire_Purchase_Type_Code  AS  STRING)  AS  Hire_Purchase_Type_Code,
	CAST(Insl_Amt  AS  NUMERIC)  AS  Insl_Amt,
	CAST(Insl_Start_Dte  AS  DATE)  AS  Insl_Start_Dte,
	CAST(Merchandise_Nbr  AS  STRING)  AS  Merchandise_Nbr,
	CAST(Merchant_Desc  AS  STRING)  AS  Merchant_Desc,
	CAST(Mthly_Handling_Fee  AS  NUMERIC)  AS  Mthly_Handling_Fee
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Max_len_10('Item_Serial_Nbr')}},
	{{validate_NoFutureDate('Insl_Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Item_Serial_Nbr,
Seq_Nbr,
Categ_Type_Code,
Hire_Purchase_Type_Code,
Insl_Amt,
Insl_Start_Dte,
Merchandise_Nbr,
Merchant_Desc,
Mthly_Handling_Fee,
	{{  aggregate_validation_columns(['__Max_len_10_valid_Item_Serial_Nbr','__NoFutureDate_valid_Insl_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
