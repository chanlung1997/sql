CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_party_grp_member_raw`  (
Grp_Type_Code  STRING(2),
Party_Intl_Nbr  STRING(8),
Rel_Code  STRING(2),
Rel_Party_Grp_Nbr  STRING(8),
Rel_Start_Dte  STRING(8),
Created_by_Offr_Id  STRING(8),
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(1),
Grp_Type_Name  STRING(20),
Issue_Country_Code  STRING(3),
Last_Update_Centre_Id  STRING(4),
Last_Update_Offr_Id  STRING(8),
Rel_Desc  STRING(29),
Rel_End_Dte  STRING(8),
Rel_Party_Grp_Name  STRING(60),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
