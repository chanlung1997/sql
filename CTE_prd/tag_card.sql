WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_card_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Card_Issue_Dte  AS  DATE)  AS  Card_Issue_Dte,
	SAFE_CAST(Card_Nbr  AS  STRING)  AS  Card_Nbr,
	SAFE_CAST(Card_Seq_Nbr  AS  STRING)  AS  Card_Seq_Nbr,
	SAFE_CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	SAFE_CAST(Cancl_Dte  AS  DATE)  AS  Cancl_Dte,
	SAFE_CAST(Card_Categ_Code  AS  STRING)  AS  Card_Categ_Code,
	SAFE_CAST(Card_Network  AS  STRING)  AS  Card_Network,
	SAFE_CAST(Card_Status_Code  AS  STRING)  AS  Card_Status_Code,
	SAFE_CAST(Card_Type_Code  AS  STRING)  AS  Card_Type_Code,
	SAFE_CAST(Chip_Card_Ind  AS  STRING)  AS  Chip_Card_Ind,
	SAFE_CAST(Dr_Card_Function  AS  STRING)  AS  Dr_Card_Function,
	SAFE_CAST(Eff_Dte  AS  DATE)  AS  Eff_Dte,
	SAFE_CAST(First_Issue_Dte  AS  DATE)  AS  First_Issue_Dte,
	SAFE_CAST(Lang_Code  AS  STRING)  AS  Lang_Code,
	SAFE_CAST(Upgrade_Ind  AS  STRING)  AS  Upgrade_Ind
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
	{{validate_NoFutureDate('First_Issue_Dte')}},
	{{validate_01YN('Upgrade_Ind')}}
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
	Upgrade_Ind,
	{{  full_valid_flag(['__NoFutureDate_valid_Card_Issue_Dte','__Future_Date_valid_Expiry_Dte','__NoFutureDate_valid_Cancl_Dte','__01YN_valid_Chip_Card_Ind','__Future_Date_valid_Eff_Dte','__NoFutureDate_valid_First_Issue_Dte','__01YN_valid_Upgrade_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
