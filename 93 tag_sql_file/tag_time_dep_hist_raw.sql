CREATE  OR  REPLACE  TABLE  `bqd_015_raw.tag_time_dep_hist_raw`  (
Acct_Nbr  STRING(20),
Appl_Id  STRING(3),
Control_Fields  STRING(8),
Eff_Dte  STRING(8),
Accrued_Int_Amt  STRING(17),
Actl_Int_Rate  STRING(9),
Auto_Rnw_Code  STRING(1),
Auto_Rnw_Term_Code  STRING(4),
Auto_Rnw_Type_Code  STRING(1),
Contract_Int_Amt  STRING(15),
Dep_Int_Rate_Code  STRING(1),
Dep_Nature_Code  STRING(2),
Fwd_Buy_Rate  STRING(11),
Fwd_Contract_Ind  STRING(1),
Hkd_Int_Rate  STRING(9),
Hkd_Prin  STRING(15),
Incremental_Rate  STRING(9),
Int_Deduce_Amt  STRING(15),
Int_Deduce_Day  STRING(3),
Int_Distrb_Acct_Nbr  STRING(20),
Int_Distrb_Appl_Id  STRING(3),
Int_Distrb_Control_Fields  STRING(8),
Last_Rnw_Dte  STRING(8),
Maturity_Dte  STRING(8),
Odue_Int_Amt  STRING(15),
Odue_Int_Rate  STRING(9),
Paid_Dte  STRING(8),
Paid_Int_Amt  STRING(15),
Pend_Int_Adj_Amt  STRING(15),
Rnw_Apply_Times  STRING(2),
Rnw_Incremental_Rate  STRING(9),
Rnw_Lump_Sum_Amt  STRING(15),
Rnw_Lump_Sum_Ccy_Code  STRING(3),
Rnw_Nbr  STRING(5),
Rnw_Time_Dep_Type_Code  STRING(1),
Term_Code  STRING(4),
Time_Dep_Type_Code  STRING(4),
Tt_Sell_Rate  STRING(11),
Uplift_Req_Dte  STRING(8),
__batch_date  TIMESTAMP,   
__load_date  TIMESTAMP,   
__file_name  STRING,   
__load_type  STRING,   
__sys_code  STRING,   
__row_number  STRING 
);
