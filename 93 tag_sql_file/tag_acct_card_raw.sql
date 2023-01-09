CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_acct_card_raw`  (
Acct_Nbr  STRING(20),
Appl_Id  STRING(3),
Card_Issue_Dte  STRING(8),
Card_Nbr  STRING(19),
Card_Seq_Nbr  STRING(2),
Control_Fields  STRING(8),
Expiry_Dte  STRING(8),
Atm_Actvn_Dte  STRING(8),
Atm_Linked_Dte  STRING(8),
Cancl_Dte  STRING(8),
Primary_Acct_Ind  STRING(1),
Supp_Card_Use_Ind  STRING(1),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
