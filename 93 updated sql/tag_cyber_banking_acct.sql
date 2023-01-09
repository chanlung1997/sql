WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cyber_banking_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Acct_Aggr_Fn_Enable_Ind  AS  STRING)  AS  Acct_Aggr_Fn_Enable_Ind,
	SAFE_CAST(Acct_Aggr_Fn_Last_Update_Dte  AS  DATE)  AS  Acct_Aggr_Fn_Last_Update_Dte,
	SAFE_CAST(Bill_Pmt_Fn_Enable_Ind  AS  STRING)  AS  Bill_Pmt_Fn_Enable_Ind,
	SAFE_CAST(Bill_Pmt_Fn_Last_Update_Dte  AS  DATE)  AS  Bill_Pmt_Fn_Last_Update_Dte,
	SAFE_CAST(Consumer_Ln_Fn_Enable_Ind  AS  STRING)  AS  Consumer_Ln_Fn_Enable_Ind,
	SAFE_CAST(INS_Fn_Enable_Ind  AS  STRING)  AS  INS_Fn_Enable_Ind,
	SAFE_CAST(Insl_Ln_Fn_Enable_Ind  AS  STRING)  AS  Insl_Ln_Fn_Enable_Ind,
	SAFE_CAST(LDS_Fn_Enable_Ind  AS  STRING)  AS  LDS_Fn_Enable_Ind,
	SAFE_CAST(Mpf_Auto_Link_Ind  AS  STRING)  AS  Mpf_Auto_Link_Ind,
	SAFE_CAST(SCS_Fn_Enable_Ind  AS  STRING)  AS  SCS_Fn_Enable_Ind,
	SAFE_CAST(Tfr_Fn_Enable_Ind  AS  STRING)  AS  Tfr_Fn_Enable_Ind,
	SAFE_CAST(Tfr_Fn_Last_Update_Dte  AS  DATE)  AS  Tfr_Fn_Last_Update_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Acct_Aggr_Fn_Last_Update_Dte')}},
	{{validate_NoFutureDate('Bill_Pmt_Fn_Last_Update_Dte')}},
	{{validate_NoFutureDate('Tfr_Fn_Last_Update_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Acct_Aggr_Fn_Enable_Ind,
	Acct_Aggr_Fn_Last_Update_Dte,
	Bill_Pmt_Fn_Enable_Ind,
	Bill_Pmt_Fn_Last_Update_Dte,
	Consumer_Ln_Fn_Enable_Ind,
	INS_Fn_Enable_Ind,
	Insl_Ln_Fn_Enable_Ind,
	LDS_Fn_Enable_Ind,
	Mpf_Auto_Link_Ind,
	SCS_Fn_Enable_Ind,
	Tfr_Fn_Enable_Ind,
	Tfr_Fn_Last_Update_Dte,
	{{  full_valid_flag(['__NoFutureDate_valid_Acct_Aggr_Fn_Last_Update_Dte','__NoFutureDate_valid_Bill_Pmt_Fn_Last_Update_Dte','__NoFutureDate_valid_Tfr_Fn_Last_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
