CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_other_bank_trf_b_event_raw`  (
Event_Id  STRING(23),
Ben_Instit_Name  STRING(180),
Ben_Name  STRING(180),
Ccy_Code  STRING(3),
Event_Rem  STRING(140),
Ext_Cust_Info  STRING(180),
Instit_Info_Rem  STRING(180),
Instr_Amt  STRING(16),
Instr_Amt_Hke  STRING(16),
Inter_Bank_Info  STRING(180),
Sender_Receiver_Info  STRING(210),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
