CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_indv_mthly_income_raw`  (
Doc_Nbr  STRING(25),
Doc_Type_Code  STRING(2),
Issue_Country_Code  STRING(2),
Start_Dte  STRING(8),
Appl_Id  STRING(3),
End_Dte  STRING(8),
Mthly_Income_Hke  STRING(15),
Payroll_Ccy_Code  STRING(3),
Update_Dte  STRING(8),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
