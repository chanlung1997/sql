CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_party_tu_positive_data_raw`  (
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(1),
Issue_Country_Code  STRING(3),
Appl_Sys  STRING(3),
BEA_Consent_Recd_Dte  STRING(8),
BEA_Wd_Req_Dte  STRING(8),
Other_Bank_Consent_Recd_Dte  STRING(8),
Other_Bank_Wd_Req_Dte  STRING(8),
Tot_Nbr_of_ML_TU  STRING(3),
Tot_Nbr_of_ML_Applicant  STRING(3),
__row_number  STRING,   
__sys_code  STRING,   
__file_name  STRING,   
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__load_type  STRING 
);
