CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_invest_acct_event_raw`  (
Acct_Nbr  STRING(20),
Appl_Id  STRING(3),
Control_Fields  STRING(8),
Event_Dte  STRING(8),
Trx_Seq  STRING(23),
Event_Amt  STRING(15),
Event_Ccy_Code  STRING(10),
Event_Desc  STRING(40),
Event_Ref  STRING(20),
Event_Type  STRING(10),
Qty  STRING(5),
Trx_Code  STRING(3),
Unit_Price  STRING(15),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
