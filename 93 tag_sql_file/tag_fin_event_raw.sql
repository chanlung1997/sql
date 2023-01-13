CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_fin_event_raw`  (
Event_Country_Code  STRING(2),
Event_Ex_Rate  STRING(13),
Fin_Event_Comment  STRING(200),
Mrch_Id  STRING(5),
MSOF_Ref  STRING(8),
Override_Ind  STRING(1),
POF_Remarks  STRING(25),
Purpose_Of_Fund  STRING(1),
Rel_to_Acct_Hldr  STRING(1),
Source_Of_Fund  STRING(1),
Trx_Linked_Ref  STRING(18),
Trx_Nbr  STRING(9),
Val_Dte  STRING(8),
__row_number  STRING,   
__sys_code  STRING,   
__file_name  STRING,   
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__load_type  STRING 
);
