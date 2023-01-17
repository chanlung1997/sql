WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_acct_card_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Card_Issue_Dte  AS  DATE)  AS  Card_Issue_Dte,
	SAFE_CAST(Card_Nbr  AS  STRING)  AS  Card_Nbr,
	SAFE_CAST(Card_Seq_Nbr  AS  STRING)  AS  Card_Seq_Nbr,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	SAFE_CAST(Atm_Actvn_Dte  AS  DATE)  AS  Atm_Actvn_Dte,
	SAFE_CAST(Atm_Linked_Dte  AS  DATE)  AS  Atm_Linked_Dte,
	SAFE_CAST(Cancl_Dte  AS  DATE)  AS  Cancl_Dte,
	SAFE_CAST(Primary_Acct_Ind  AS  STRING)  AS  Primary_Acct_Ind,
	SAFE_CAST(Supp_Card_Use_Ind  AS  STRING)  AS  Supp_Card_Use_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Card_Issue_Dte')}},
	{{validate_Future_Date('Expiry_Dte')}},
	{{validate_NoFutureDate('Atm_Actvn_Dte')}},
	{{validate_Future_Date('Atm_Linked_Dte')}},
	{{validate_NoFutureDate('Cancl_Dte')}},
	{{validate_01YN('Primary_Acct_Ind')}},
	{{validate_01YN('Supp_Card_Use_Ind')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Card_Issue_Dte,
	Card_Nbr,
	Card_Seq_Nbr,
	Control_Fields,
	Expiry_Dte,
	Atm_Actvn_Dte,
	Atm_Linked_Dte,
	Cancl_Dte,
	Primary_Acct_Ind,
	Supp_Card_Use_Ind,
	{{  full_valid_flag(['__NoFutureDate_valid_Card_Issue_Dte','__Future_Date_valid_Expiry_Dte','__NoFutureDate_valid_Atm_Actvn_Dte','__Future_Date_valid_Atm_Linked_Dte','__NoFutureDate_valid_Cancl_Dte','__01YN_valid_Primary_Acct_Ind','__01YN_valid_Supp_Card_Use_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
