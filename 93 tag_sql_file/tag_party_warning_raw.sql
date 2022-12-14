CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_party_warning_raw`  (
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(2),
Issue_Country_Code  STRING(2),
Create_Dte  STRING(8),
Last_Update_Dte  STRING(8),
Seq_Nbr  STRING(3),
Warning_Categ_Code  STRING(3),
End_Dte  STRING(8),
Expiry_Dte  STRING(8),
Last_Update_Centre_Id  STRING(4),
Last_Update_Offr_Id  STRING(8),
Multi_Watch_List_Ind  STRING(1),
Place_by_Centre_Id  STRING(4),
Place_By_Offr_Id  STRING(24),
UID_Hit_Pct  STRING(20),
User_Comment  STRING(40),
Watch_List_Id  STRING(9),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
