WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.DEP_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Acct_Br_Code  AS  STRING)  AS  Acct_Br_Code,
	CAST(Acct_Preopen_Dte  AS  DATE)  AS  Acct_Preopen_Dte,
	CAST(Acct_Segment  AS  STRING)  AS  Acct_Segment,
	CAST(Act_CNY_Bk_B_Turnover  AS  NUMERIC)  AS  Act_CNY_Bk_B_Turnover,
	CAST(Act_CNY_Bk_S_Turnover  AS  NUMERIC)  AS  Act_CNY_Bk_S_Turnover,
	CAST(BSA_Ind  AS  STRING)  AS  BSA_Ind,
	CAST(CNY_Corp_Next_Review_Dte  AS  DATE)  AS  CNY_Corp_Next_Review_Dte,
	CAST(Dep_Type_Code  AS  STRING)  AS  Dep_Type_Code,
	CAST(Dormant_Dte  AS  DATE)  AS  Dormant_Dte,
	CAST(Dormant_Ind  AS  STRING)  AS  Dormant_Ind,
	CAST(Est_CNY_Bk_B_Turnover  AS  NUMERIC)  AS  Est_CNY_Bk_B_Turnover,
	CAST(Est_CNY_Bk_S_Turnover  AS  NUMERIC)  AS  Est_CNY_Bk_S_Turnover,
	CAST(Exec_Admin_Ind  AS  STRING)  AS  Exec_Admin_Ind,
	CAST(Function_Code  AS  STRING)  AS  Function_Code,
	CAST(GRE_Code  AS  STRING)  AS  GRE_Code,
	CAST(Last_Dep_Dte  AS  DATE)  AS  Last_Dep_Dte,
	CAST(Last_Wd_Dte  AS  DATE)  AS  Last_Wd_Dte,
	CAST(Mandate_Nbr  AS  STRING)  AS  Mandate_Nbr,
	CAST(MAO_Ind  AS  STRING)  AS  MAO_Ind,
	CAST(Qualify_Code  AS  STRING)  AS  Qualify_Code,
	CAST(Reactvn_Dte  AS  DATE)  AS  Reactvn_Dte,
	CAST(SGP_Ind  AS  STRING)  AS  SGP_Ind,
	CAST(SGP_Last_Update_Dte  AS  DATE)  AS  SGP_Last_Update_Dte,
	CAST(Stake_Hld_Ind  AS  STRING)  AS  Stake_Hld_Ind,
	CAST(Stmt_Day  AS  NUMERIC)  AS  Stmt_Day,
	CAST(WMC_Ind  AS  STRING)  AS  WMC_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Acct_Preopen_Dte')}},
	{{validate_Future_Date('CNY_Corp_Next_Review_Dte')}},
	{{validate_NoFutureDate('Dormant_Dte')}},
	{{validate_NoFutureDate('Last_Dep_Dte')}},
	{{validate_NoFutureDate('Last_Wd_Dte')}},
	{{validate_Acpt_len_18_null('Mandate_Nbr')}},
	{{validate_NoFutureDate('Reactvn_Dte')}},
	{{validate_NoFutureDate('SGP_Last_Update_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Acct_Preopen_Dte,
Acct_Segment,
Act_CNY_Bk_B_Turnover,
Act_CNY_Bk_S_Turnover,
BSA_Ind,
CNY_Corp_Next_Review_Dte,
Dep_Type_Code,
Dormant_Dte,
Dormant_Ind,
Est_CNY_Bk_B_Turnover,
Est_CNY_Bk_S_Turnover,
Exec_Admin_Ind,
Function_Code,
GRE_Code,
Last_Dep_Dte,
Last_Wd_Dte,
Mandate_Nbr,
MAO_Ind,
Qualify_Code,
Reactvn_Dte,
SGP_Ind,
SGP_Last_Update_Dte,
Stake_Hld_Ind,
Stmt_Day,
WMC_Ind,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Acct_Preopen_Dte','__Future_Date_valid_CNY_Corp_Next_Review_Dte','__NoFutureDate_valid_Dormant_Dte','__NoFutureDate_valid_Last_Dep_Dte','__NoFutureDate_valid_Last_Wd_Dte','__Acpt_len_18_null_valid_Mandate_Nbr','__NoFutureDate_valid_Reactvn_Dte','__NoFutureDate_valid_SGP_Last_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
