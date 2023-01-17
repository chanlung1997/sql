CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_party_fin_info_raw`  (
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(2),
Issue_Country_Code  STRING(2),
Seq_Nbr  STRING(3),
Ccy_Code  STRING(3),
Create_By_Centre_Id  STRING(24),
Create_By_Offr_Id  STRING(24),
Create_Dte  STRING(8),
Details  STRING(120),
Fin_Info_Amt  STRING(15),
Fin_Info_Type_Code  STRING(3),
__row_number  STRING,   
__sys_code  STRING,   
__file_name  STRING,   
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__load_type  STRING 
);
