WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Acct_Categ_Code  AS  STRING)  AS  Acct_Categ_Code,
	SAFE_CAST(Acct_Close_Dte  AS  DATE)  AS  Acct_Close_Dte,
	SAFE_CAST(Acct_Close_Reason_Code  AS  STRING)  AS  Acct_Close_Reason_Code,
	SAFE_CAST(Acct_Cond_Code  AS  STRING)  AS  Acct_Cond_Code,
	SAFE_CAST(Acct_Name  AS  STRING)  AS  Acct_Name,
	SAFE_CAST(Acct_Obtained_Code  AS  STRING)  AS  Acct_Obtained_Code,
	SAFE_CAST(Acct_Open_Dte  AS  DATE)  AS  Acct_Open_Dte,
	SAFE_CAST(Acct_Status_Chng_Dte  AS  DATE)  AS  Acct_Status_Chng_Dte,
	SAFE_CAST(Acct_Status_Type_Code  AS  STRING)  AS  Acct_Status_Type_Code,
	SAFE_CAST(Acct_Type_Code  AS  STRING)  AS  Acct_Type_Code,
	SAFE_CAST(Bg3_Acct_Status_Type_Code  AS  STRING)  AS  Bg3_Acct_Status_Type_Code,
	SAFE_CAST(Campaign_Strategy_Id  AS  INT64)  AS  Campaign_Strategy_Id,
	SAFE_CAST(Ccy_Code  AS  STRING)  AS  Ccy_Code,
	SAFE_CAST(Contact_Rem  AS  STRING)  AS  Contact_Rem,
	SAFE_CAST(Corporate_Id  AS  STRING)  AS  Corporate_Id,
	SAFE_CAST(Cur_Prod_Start_Dte  AS  DATE)  AS  Cur_Prod_Start_Dte,
	SAFE_CAST(Id_Doc_Present_Ind  AS  STRING)  AS  Id_Doc_Present_Ind,
	SAFE_CAST(Last_Stmt_Dte  AS  DATE)  AS  Last_Stmt_Dte,
	SAFE_CAST(Last_Trx_Dte  AS  DATE)  AS  Last_Trx_Dte,
	SAFE_CAST(Manage_Offr_Id  AS  STRING)  AS  Manage_Offr_Id,
	SAFE_CAST(Next_Stmt_Dte  AS  DATE)  AS  Next_Stmt_Dte,
	SAFE_CAST(Own_Offr_Id  AS  STRING)  AS  Own_Offr_Id,
	SAFE_CAST(Plan_Id  AS  STRING)  AS  Plan_Id,
	SAFE_CAST(Prod_Id  AS  STRING)  AS  Prod_Id,
	SAFE_CAST(Referral_Offr_Id  AS  STRING)  AS  Referral_Offr_Id,
	SAFE_CAST(Stmt_Mail_Code  AS  STRING)  AS  Stmt_Mail_Code,
	SAFE_CAST(Stmt_Period_Code  AS  STRING)  AS  Stmt_Period_Code,
	SAFE_CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	SAFE_CAST(Introducing_Centre_Id  AS  STRING)  AS  Introducing_Centre_Id,
	SAFE_CAST(Processing_Centre_Id  AS  STRING)  AS  Processing_Centre_Id,
	SAFE_CAST(Processing_Offr_Id  AS  STRING)  AS  Processing_Offr_Id,
	SAFE_CAST(Seller_Id  AS  STRING)  AS  Seller_Id
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Acct_Close_Dte')}},
	{{validate_NoFutureDate('Acct_Open_Dte')}},
	{{validate_NoFutureDate('Acct_Status_Chng_Dte')}},
	{{validate_NoFutureDate('Cur_Prod_Start_Dte')}},
	{{validate_01YN('Id_Doc_Present_Ind')}},
	{{validate_NoFutureDate('Last_Stmt_Dte')}},
	{{validate_NoFutureDate('Last_Trx_Dte')}},
	{{validate_NoFutureDate('Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Acct_Categ_Code,
	Acct_Close_Dte,
	Acct_Close_Reason_Code,
	Acct_Cond_Code,
	Acct_Name,
	Acct_Obtained_Code,
	Acct_Open_Dte,
	Acct_Status_Chng_Dte,
	Acct_Status_Type_Code,
	Acct_Type_Code,
	Bg3_Acct_Status_Type_Code,
	Campaign_Strategy_Id,
	Ccy_Code,
	Contact_Rem,
	Corporate_Id,
	Cur_Prod_Start_Dte,
	Id_Doc_Present_Ind,
	Last_Stmt_Dte,
	Last_Trx_Dte,
	Manage_Offr_Id,
	Next_Stmt_Dte,
	Own_Offr_Id,
	Plan_Id,
	Prod_Id,
	Referral_Offr_Id,
	Stmt_Mail_Code,
	Stmt_Period_Code,
	Start_Dte,
	Introducing_Centre_Id,
	Processing_Centre_Id,
	Processing_Offr_Id,
	Seller_Id,
	{{  full_valid_flag(['__NoFutureDate_valid_Acct_Close_Dte','__NoFutureDate_valid_Acct_Open_Dte','__NoFutureDate_valid_Acct_Status_Chng_Dte','__NoFutureDate_valid_Cur_Prod_Start_Dte','__01YN_valid_Id_Doc_Present_Ind','__NoFutureDate_valid_Last_Stmt_Dte','__NoFutureDate_valid_Last_Trx_Dte','__NoFutureDate_valid_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
