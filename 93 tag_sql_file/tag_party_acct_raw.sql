CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_party_acct_raw`  (
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(2),
Issue_Country_Code  STRING(2),
Acct_Nbr  STRING(20),
Acct_Party_End_Dte  STRING(8),
Acct_Party_Role_Code  STRING(3),
Acct_Party_Role_Seq  STRING(2),
Acct_Party_Start_Dte  STRING(8),
Aloc_Pct  STRING(9),
Appl_Id  STRING(3),
Control_Fields  STRING(8),
Create_By_Offr_Id  STRING(24),
Guarantor_Limit_Hke  STRING(15),
Primary_Owner_Ind  STRING(1),
Rel_Setup_By_Offr_Id  STRING(8),
Stmt_Type_Code  STRING(1),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
