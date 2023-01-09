CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_octopus_raw`  (
Acct_Nbr  STRING(20),
Appl_Id  STRING(3),
Control_Fields  STRING(8),
Octopus_Card_Nbr  STRING(16),
Start_Dte  STRING(8),
Appl_Dte  STRING(8),
End_Dte  STRING(8),
Holder_Id  STRING(18),
Holder_Name  STRING(30),
Octopus_Card_Status_Code  STRING(1),
Octopus_Card_Status_Dte  STRING(8),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
