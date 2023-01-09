CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_mpf_event_raw`  (
Event_Id  STRING(23),
Confirm_Dte  STRING(8),
Contrib_Batch_Nbr  STRING(12),
Contrib_Bill_Type_Code  STRING(1),
Cover_Fr_Dte  STRING(8),
Cover_To_Dte  STRING(8),
Er_Acct_Nbr  STRING(20),
Er_Appl_Id  STRING(3),
Er_Control_Fields  STRING(8),
Er_Ee_Ind  STRING(1),
Event_Unit  STRING(15),
Fund_Code  STRING(10),
Fund_Price_Dte  STRING(8),
Mpf_Plan_Type_Code  STRING(2),
Plan_Nbr  STRING(4),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
