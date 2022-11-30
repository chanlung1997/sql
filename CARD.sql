WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CARD_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Card_Issue_Dte  AS  DATE)  AS  Card_Issue_Dte,
	CAST(Card_Nbr  AS  STRING)  AS  Card_Nbr,
	CAST(Card_Seq_Nbr  AS  STRING)  AS  Card_Seq_Nbr,
	CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	CAST(Cancl_Dte  AS  DATE)  AS  Cancl_Dte,
	CAST(Card_Categ_Code  AS  STRING)  AS  Card_Categ_Code,
	CAST(Card_Network  AS  STRING)  AS  Card_Network,
	CAST(Card_Status_Code  AS  STRING)  AS  Card_Status_Code,
	CAST(Card_Type_Code  AS  STRING)  AS  Card_Type_Code,
	CAST(Chip_Card_Ind  AS  STRING)  AS  Chip_Card_Ind,
	CAST(Dr_Card_Function  AS  STRING)  AS  Dr_Card_Function,
	CAST(Eff_Dte  AS  DATE)  AS  Eff_Dte,
	CAST(First_Issue_Dte  AS  DATE)  AS  First_Issue_Dte,
	CAST(Lang_Code  AS  STRING)  AS  Lang_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Card_Issue_Dte')}},
	{{validate_Future_Date('Expiry_Dte')}},
	{{validate_NoFutureDate('Cancl_Dte')}},
	{{validate_01YN('Chip_Card_Ind')}},
	{{validate_Future_Date('Eff_Dte')}},
	{{validate_NoFutureDate('First_Issue_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Card_Issue_Dte,
Card_Nbr,
Card_Seq_Nbr,
Expiry_Dte,
Cancl_Dte,
Card_Categ_Code,
Card_Network,
Card_Status_Code,
Card_Type_Code,
Chip_Card_Ind,
Dr_Card_Function,
Eff_Dte,
First_Issue_Dte,
Lang_Code,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Card_Issue_Dte','__Future_Date_valid_Expiry_Dte','__NoFutureDate_valid_Cancl_Dte','__01YN_valid_Chip_Card_Ind','__Future_Date_valid_Eff_Dte','__NoFutureDate_valid_First_Issue_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
