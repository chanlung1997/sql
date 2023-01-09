CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_chnl_raw`  (
Chnl_Id  STRING(14),
Chnl_Type_Code  STRING(3),
Chnl_Subtype_Code  STRING(3),
Chnl_Desc  STRING(30),
Chnl_End_Dte  STRING(8),
Chnl_Start_Dte  STRING(8),
Chnl_Status_Code  STRING(3),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
