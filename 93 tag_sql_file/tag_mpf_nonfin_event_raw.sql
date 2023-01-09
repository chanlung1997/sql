CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_mpf_nonfin_event_raw`  (
Event_Id  STRING(50),
Buy_Fund_Code  STRING(10),
Cheque_Message_Code  STRING(3),
Confirmed_Dte  STRING(8),
Contrib_Batch_Nbr  STRING(12),
Contrib_Bill_Type_Code  STRING(1),
Contrib_Upto_Dte  STRING(8),
Cover_Fr_Dte  STRING(8),
Cover_To_Dte  STRING(8),
Eff_Dte  STRING(8),
Er_Acct_Nbr  STRING(20),
Er_Appl_Id  STRING(3),
Er_Ee_Ind  STRING(1),
Er_Control_Fields  STRING(8),
Lsp_Amt  STRING(13),
Lsp_Ind  STRING(1),
Lsp_To_Ind  STRING(1),
Mpf_Orso_Ind  STRING(1),
Mpf_Plan_Type_Code  STRING(2),
Own_Trustee_Ind  STRING(1),
Overpmt_Payee_Ind  STRING(2),
Overpmt_Er_Amt  STRING(13),
Overpmt_Ee_Amt  STRING(13),
Payee_Type_Ind  STRING(2),
Partial_Full_Term_Ind  STRING(1),
Plan_Nbr  STRING(4),
Pct  STRING(8),
Pmt_Method_Code  STRING(10),
Pmt_Nbr  STRING(13),
Pmt_Ref  STRING(10),
Pmt_Type_Code  STRING(2),
Relevant_Income  STRING(13),
Scheme_Nbr  STRING(20),
Sell_Fund_Code  STRING(10),
Susp_Type_Code  STRING(1),
Term_Reason_Code  STRING(4),
To_Other_Register_Scheme_ind  STRING(1),
To_Plan_Nbr  STRING(4),
To_Scheme_Dte  STRING(8),
To_Scheme_Type  STRING(2),
To_Trust_Code  STRING(10),
Tran_Amt  STRING(13),
Transfer_Mode  STRING(1),
Trust_Reg_Nbr  STRING(30),
Trustee_Code  STRING(10),
Unit_Value  STRING(16),
Vol_Cont_To_Trustee_Ind  STRING(1),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
