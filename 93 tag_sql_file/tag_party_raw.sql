CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_party_raw`  (
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(2),
Issue_Country_Code  STRING(2),
Bonus_Point  STRING(8),
Cis_Search_Dte  STRING(8),
Create_By_Offr_Id  STRING(24),
Doc_Expiry_Dte  STRING(8),
Doc_Issue_Dte  STRING(8),
Domicile_Oic  STRING(24),
Has_Mortgage_Ind  STRING(1),
Industry_Code  STRING(8),
Party_Acct_Status_Code  STRING(2),
Party_Chinese_Name  STRING(120),
Party_Chinese_Name_Full  STRING(210),
Party_End_Dte  STRING(8),
Party_Name  STRING(100),
Party_Name_Full  STRING(210),
Party_Start_Dte  STRING(8),
Party_Type_Code  STRING(3),
Referral_By_Ind  STRING(1),
Restricted_Cust  STRING(3),
RO_Party_Id  STRING(15),
Source_Chnl_Type_Code  STRING(3),
Universal_Cntl_Group_Ind  STRING(1),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);