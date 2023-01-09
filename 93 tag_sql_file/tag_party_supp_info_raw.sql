CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_party_supp_info_raw`  (
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(2),
Issue_Country_Code  STRING(2),
BEA_Subsidiary_Ind  STRING(1),
Bk_Minority_Shareholder_Ind  STRING(1),
Bk_Sr_Mgt_Ind  STRING(1),
Borrower_Grade  STRING(2),
Expsoure_Cap_Ind  STRING(1),
FITCH_Rate_Code  STRING(4),
FITCH_Rate_Last_Update_Dte  STRING(8),
IS9_Borrower_Grade  STRING(2),
IS9_Last_Update_dte  STRING(8),
IS9_Probability  STRING(15),
Lending_Offr_Ind  STRING(1),
Mainland_Cnterparty_Type  STRING(2),
Moody_Rating  STRING(4),
Moody_Rating_Last_Update_Dte  STRING(8),
Mortgage_Equity_Ratio  STRING(10),
PD_Pct  STRING(15),
PD_Pct_Last_Update_Dte  STRING(8),
Province_Of_Oper_Resid_Addr  STRING(2),
Reg_FI_Ind  STRING(1),
Reg_FI_Ind_Last_Update_Dte  STRING(8),
SCRA_Ind  STRING(4),
SCRA_Ind_Last_Update_Dte  STRING(8),
SP_Rating  STRING(4),
SP_Rating_Last_Update_Dte  STRING(8),
Sub_Director_Ind  STRING(1),
Sub_Lending_Offr_Ind  STRING(1),
Sub_Minority_Shareholder_Ind  STRING(1),
Sub_Sr_Mgt_Ind  STRING(1),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
