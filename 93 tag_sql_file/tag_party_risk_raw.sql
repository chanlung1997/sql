CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_party_risk_raw`  (
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(1),
Issue_Country_Code  STRING(3),
Update_Dte  STRING(8),
Acct_Risk_Lvl  STRING(10),
Party_Risk_Lvl  STRING(10),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
