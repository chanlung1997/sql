CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_cr_card_acct_limit_raw`  (
Acct_Nbr  STRING(20),
Appl_Id  STRING(3),
Control_Fields  STRING(8),
Limit_Start_Dte  STRING(8),
Limit_Type_Code  STRING(3),
Cr_Limit_Amt  STRING(11),
Cr_Limit_Avail  STRING(11),
Limit_End_Dte  STRING(8),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
