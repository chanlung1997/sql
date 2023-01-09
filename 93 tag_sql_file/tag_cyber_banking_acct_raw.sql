CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_cyber_banking_acct_raw`  (
Acct_Nbr  STRING(20),
Appl_Id  STRING(3),
Control_Fields  STRING(8),
Acct_Aggr_Fn_Enable_Ind  STRING(1),
Acct_Aggr_Fn_Last_Update_Dte  STRING(8),
Bill_Pmt_Fn_Enable_Ind  STRING(1),
Bill_Pmt_Fn_Last_Update_Dte  STRING(8),
Consumer_Ln_Fn_Enable_Ind  STRING(1),
INS_Fn_Enable_Ind  STRING(1),
Insl_Ln_Fn_Enable_Ind  STRING(1),
LDS_Fn_Enable_Ind  STRING(1),
Mpf_Auto_Link_Ind  STRING(1),
SCS_Fn_Enable_Ind  STRING(1),
Tfr_Fn_Enable_Ind  STRING(1),
Tfr_Fn_Last_Update_Dte  STRING(8),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
