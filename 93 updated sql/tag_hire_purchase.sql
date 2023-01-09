WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_hire_purchase_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Item_Serial_Nbr  AS  STRING)  AS  Item_Serial_Nbr,
	SAFE_CAST(Seq_Nbr  AS  NUMERIC)  AS  Seq_Nbr,
	SAFE_CAST(Categ_Type_Code  AS  STRING)  AS  Categ_Type_Code,
	SAFE_CAST(Hire_Purchase_Type_Code  AS  STRING)  AS  Hire_Purchase_Type_Code,
	SAFE_CAST(Insl_Amt  AS  NUMERIC)  AS  Insl_Amt,
	SAFE_CAST(Insl_Start_Dte  AS  DATE)  AS  Insl_Start_Dte,
	SAFE_CAST(Merchandise_Nbr  AS  STRING)  AS  Merchandise_Nbr,
	SAFE_CAST(Merchant_Desc  AS  STRING)  AS  Merchant_Desc,
	SAFE_CAST(Mthly_Handling_Fee  AS  NUMERIC)  AS  Mthly_Handling_Fee,
	SAFE_CAST(Nbr_Of_Insl  AS  NUMERIC)  AS  Nbr_Of_Insl
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
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Item_Serial_Nbr,
	Seq_Nbr,
	Categ_Type_Code,
	Hire_Purchase_Type_Code,
	Insl_Amt,
	Insl_Start_Dte,
	Merchandise_Nbr,
	Merchant_Desc,
	Mthly_Handling_Fee,
	Nbr_Of_Insl,
	{{  full_valid_flag(['__Max_len_10_valid_Item_Serial_Nbr','__NoFutureDate_valid_Insl_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
