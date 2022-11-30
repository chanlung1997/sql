WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Acct_Categ_Code  AS  STRING)  AS  Acct_Categ_Code,
	CAST(Acct_Close_Dte  AS  DATE)  AS  Acct_Close_Dte,
	CAST(Acct_Close_Reason_Code  AS  STRING)  AS  Acct_Close_Reason_Code,
	CAST(Acct_Cond_Code  AS  STRING)  AS  Acct_Cond_Code,
	CAST(Acct_Name  AS  STRING)  AS  Acct_Name,
	CAST(Acct_Obtained_Code  AS  STRING)  AS  Acct_Obtained_Code,
	CAST(Acct_Open_Dte  AS  DATE)  AS  Acct_Open_Dte,
	CAST(Acct_Status_Chng_Dte  AS  DATE)  AS  Acct_Status_Chng_Dte,
	CAST(Acct_Status_Type_Code  AS  STRING)  AS  Acct_Status_Type_Code,
	CAST(Acct_Type_Code  AS  STRING)  AS  Acct_Type_Code,
	CAST(Bg3_Acct_Status_Type_Code  AS  STRING)  AS  Bg3_Acct_Status_Type_Code,
	CAST(Campaign_Strategy_Id  AS  INT64)  AS  Campaign_Strategy_Id,
	CAST(Ccy_Code  AS  STRING)  AS  Ccy_Code,
	CAST(Contact_Rem  AS  STRING)  AS  Contact_Rem,
	CAST(Corporate_Id  AS  STRING)  AS  Corporate_Id,
	CAST(Cur_Prod_Start_Dte  AS  DATE)  AS  Cur_Prod_Start_Dte,
	CAST(Id_Doc_Present_Ind  AS  STRING)  AS  Id_Doc_Present_Ind,
	CAST(Last_Stmt_Dte  AS  DATE)  AS  Last_Stmt_Dte,
	CAST(Last_Trx_Dte  AS  DATE)  AS  Last_Trx_Dte,
	CAST(Manage_Offr_Id  AS  STRING)  AS  Manage_Offr_Id,
	CAST(Next_Stmt_Dte  AS  DATE)  AS  Next_Stmt_Dte,
	CAST(Own_Offr_Id  AS  STRING)  AS  Own_Offr_Id,
	CAST(Plan_Id  AS  STRING)  AS  Plan_Id,
	CAST(Prod_Id  AS  STRING)  AS  Prod_Id,
	CAST(Referral_Offr_Id  AS  STRING)  AS  Referral_Offr_Id,
	CAST(Stmt_Mail_Code  AS  STRING)  AS  Stmt_Mail_Code,
	CAST(Stmt_Period_Code  AS  STRING)  AS  Stmt_Period_Code,
	CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	CAST(Introducing_Centre_Id  AS  STRING)  AS  Introducing_Centre_Id,
	CAST(Processing_Centre_Id  AS  STRING)  AS  Processing_Centre_Id,
	CAST(Processing_Offr_Id  AS  STRING)  AS  Processing_Offr_Id
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
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Acct_Close_Dte','__NoFutureDate_valid_Acct_Open_Dte','__NoFutureDate_valid_Acct_Status_Chng_Dte','__NoFutureDate_valid_Cur_Prod_Start_Dte','__01YN_valid_Id_Doc_Present_Ind','__NoFutureDate_valid_Last_Stmt_Dte','__NoFutureDate_valid_Last_Trx_Dte','__NoFutureDate_valid_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
