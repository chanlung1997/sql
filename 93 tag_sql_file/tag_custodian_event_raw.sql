CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_custodian_event_raw`  (
Event_Id  STRING(23),
Accrued_Int_Amt  STRING(19),
Fee_Income  STRING(19),
Event_Nature_Code  STRING(5),
Pmt_Instr_Code  STRING(2),
Qty  STRING(19),
Stock_Code  STRING(5),
Taxation_Amt  STRING(19),
Trade_Ind  STRING(1),
Unit_Price  STRING(19),
US_Source_of_Fund_Ind  STRING(1),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
