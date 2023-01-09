CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_acct_dly_bal_raw`  (
Acct_Nbr  STRING(20),
Appl_Id  STRING(3),
Control_Fields  STRING(8),
Start_Dte  STRING(8),
Avail_Bal_Amt  STRING(15),
Avail_Bal_Amt_Hke  STRING(15),
Cash_Bal_Amt  STRING(15),
Cur_Bal_Amt  STRING(15),
Cur_Bal_Amt_Hke  STRING(15),
End_Dte  STRING(8),
Retail_Bal_Amt  STRING(15),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
