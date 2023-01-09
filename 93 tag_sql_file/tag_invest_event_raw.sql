CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_invest_event_raw`  (
Event_Id  STRING(23),
Ccy_Pair  STRING(10),
Deal_Rate  STRING(13),
Delivery_Dte  STRING(8),
Event_Amt  STRING(19),
Event_Amt_Hke  STRING(19),
Event_Ccy_Code  STRING(3),
Event_Country_Code  STRING(3),
Event_Ex_Rate  STRING(13),
Event_Type  STRING(10),
Expiry_Dte  STRING(8),
Val_Dte  STRING(8),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
