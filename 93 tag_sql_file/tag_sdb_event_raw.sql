CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_sdb_event_raw`  (
Event_Id  STRING(23),
Access_Dte  STRING(8),
Access_Time  STRING(6),
Dest_Acct_Nbr  STRING(18),
Dest_Appl_Id  STRING(3),
Dest_Control_Fields  STRING(5),
Function_Code  STRING(6),
Pmt_Method_Code  STRING(2),
Rental_Amt  STRING(17),
Security_Forfeited  STRING(17),
Security_Recd  STRING(17),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
