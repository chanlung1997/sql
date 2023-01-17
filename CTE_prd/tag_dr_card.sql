WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_dr_card_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Card_Issue_Dte  AS  DATE)  AS  Card_Issue_Dte,
	SAFE_CAST(Card_Nbr  AS  STRING)  AS  Card_Nbr,
	SAFE_CAST(Card_Seq_Nbr  AS  STRING)  AS  Card_Seq_Nbr,
	SAFE_CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	SAFE_CAST(Actvn_Dte  AS  DATE)  AS  Actvn_Dte,
	SAFE_CAST(Anl_Fee_Expiry_Dte  AS  DATE)  AS  Anl_Fee_Expiry_Dte,
	SAFE_CAST(Card_Delivery_Code  AS  STRING)  AS  Card_Delivery_Code,
	SAFE_CAST(Card_Hld_Type_Code  AS  STRING)  AS  Card_Hld_Type_Code,
	SAFE_CAST(Card_Retain_Atm_Nbr  AS  STRING)  AS  Card_Retain_Atm_Nbr,
	SAFE_CAST(Card_Retain_Bank_Code  AS  STRING)  AS  Card_Retain_Bank_Code,
	SAFE_CAST(Card_Retain_Dte  AS  DATE)  AS  Card_Retain_Dte,
	SAFE_CAST(Cash_Voucher_Last_Update_Dte  AS  DATE)  AS  Cash_Voucher_Last_Update_Dte,
	SAFE_CAST(Company_Type  AS  STRING)  AS  Company_Type,
	SAFE_CAST(JC_Cash_Voucher_Ind  AS  STRING)  AS  JC_Cash_Voucher_Ind,
	SAFE_CAST(Old_AIO_Prod_Code  AS  STRING)  AS  Old_AIO_Prod_Code,
	SAFE_CAST(Old_Card_Seq_Nbr  AS  STRING)  AS  Old_Card_Seq_Nbr,
	SAFE_CAST(Pin_Issue_Dte  AS  DATE)  AS  Pin_Issue_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Card_Issue_Dte')}},
	{{validate_Future_Date('Expiry_Dte')}},
	{{validate_NoFutureDate('Actvn_Dte')}},
	{{validate_Future_Date('Anl_Fee_Expiry_Dte')}},
	{{validate_NoFutureDate('Card_Retain_Dte')}},
	{{validate_NoFutureDate('Cash_Voucher_Last_Update_Dte')}},
	{{validate_NoFutureDate('Pin_Issue_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Card_Issue_Dte,
	Card_Nbr,
	Card_Seq_Nbr,
	Expiry_Dte,
	Actvn_Dte,
	Anl_Fee_Expiry_Dte,
	Card_Delivery_Code,
	Card_Hld_Type_Code,
	Card_Retain_Atm_Nbr,
	Card_Retain_Bank_Code,
	Card_Retain_Dte,
	Cash_Voucher_Last_Update_Dte,
	Company_Type,
	JC_Cash_Voucher_Ind,
	Old_AIO_Prod_Code,
	Old_Card_Seq_Nbr,
	Pin_Issue_Dte,
	{{  full_valid_flag(['__NoFutureDate_valid_Card_Issue_Dte','__Future_Date_valid_Expiry_Dte','__NoFutureDate_valid_Actvn_Dte','__Future_Date_valid_Anl_Fee_Expiry_Dte','__NoFutureDate_valid_Card_Retain_Dte','__NoFutureDate_valid_Cash_Voucher_Last_Update_Dte','__NoFutureDate_valid_Pin_Issue_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
