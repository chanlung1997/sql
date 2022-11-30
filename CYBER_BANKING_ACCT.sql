WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CYBER_BANKING_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Acct_Aggr_Fn_Enable_Ind  AS  STRING)  AS  Acct_Aggr_Fn_Enable_Ind,
	CAST(Acct_Aggr_Fn_Last_Update_Dte  AS  DATE)  AS  Acct_Aggr_Fn_Last_Update_Dte,
	CAST(Bill_Pmt_Fn_Enable_Ind  AS  STRING)  AS  Bill_Pmt_Fn_Enable_Ind,
	CAST(Bill_Pmt_Fn_Last_Update_Dte  AS  DATE)  AS  Bill_Pmt_Fn_Last_Update_Dte,
	CAST(Consumer_Ln_Fn_Enable_Ind  AS  STRING)  AS  Consumer_Ln_Fn_Enable_Ind,
	CAST(INS_Fn_Enable_Ind  AS  STRING)  AS  INS_Fn_Enable_Ind,
	CAST(Insl_Ln_Fn_Enable_Ind  AS  STRING)  AS  Insl_Ln_Fn_Enable_Ind,
	CAST(LDS_Fn_Enable_Ind  AS  STRING)  AS  LDS_Fn_Enable_Ind,
	CAST(Mpf_Auto_Link_Ind  AS  STRING)  AS  Mpf_Auto_Link_Ind,
	CAST(SCS_Fn_Enable_Ind  AS  STRING)  AS  SCS_Fn_Enable_Ind,
	CAST(Tfr_Fn_Enable_Ind  AS  STRING)  AS  Tfr_Fn_Enable_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Acct_Aggr_Fn_Last_Update_Dte')}},
	{{validate_NoFutureDate('Bill_Pmt_Fn_Last_Update_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
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
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Acct_Aggr_Fn_Last_Update_Dte','__NoFutureDate_valid_Bill_Pmt_Fn_Last_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
