WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.MPF_NONFIN_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Buy_Fund_Code  AS  STRING)  AS  Buy_Fund_Code,
	CAST(Cheque_Message_Code  AS  STRING)  AS  Cheque_Message_Code,
	CAST(Confirmed_Dte  AS  DATE)  AS  Confirmed_Dte,
	CAST(Contrib_Batch_Nbr  AS  STRING)  AS  Contrib_Batch_Nbr,
	CAST(Contrib_Bill_Type_Code  AS  STRING)  AS  Contrib_Bill_Type_Code,
	CAST(Contrib_Upto_Dte  AS  DATE)  AS  Contrib_Upto_Dte,
	CAST(Cover_Fr_Dte  AS  DATE)  AS  Cover_Fr_Dte,
	CAST(Cover_To_Dte  AS  DATE)  AS  Cover_To_Dte,
	CAST(Eff_Dte  AS  DATE)  AS  Eff_Dte,
	CAST(Er_Acct_Nbr  AS  STRING)  AS  Er_Acct_Nbr,
	CAST(Er_Appl_Id  AS  STRING)  AS  Er_Appl_Id,
	CAST(Er_Ee_Ind  AS  STRING)  AS  Er_Ee_Ind,
	CAST(Er_Control_Fields  AS  STRING)  AS  Er_Control_Fields,
	CAST(Lsp_Amt  AS  NUMERIC)  AS  Lsp_Amt,
	CAST(Lsp_Ind  AS  STRING)  AS  Lsp_Ind,
	CAST(Lsp_To_Ind  AS  STRING)  AS  Lsp_To_Ind,
	CAST(Mpf_Orso_Ind  AS  STRING)  AS  Mpf_Orso_Ind,
	CAST(Mpf_Plan_Type_Code  AS  STRING)  AS  Mpf_Plan_Type_Code,
	CAST(Own_Trustee_Ind  AS  STRING)  AS  Own_Trustee_Ind,
	CAST(Overpmt_Payee_Ind  AS  STRING)  AS  Overpmt_Payee_Ind,
	CAST(Overpmt_Er_Amt  AS  NUMERIC)  AS  Overpmt_Er_Amt,
	CAST(Overpmt_Ee_Amt  AS  NUMERIC)  AS  Overpmt_Ee_Amt,
	CAST(Payee_Type_Ind  AS  STRING)  AS  Payee_Type_Ind,
	CAST(Partial_Full_Term_Ind  AS  STRING)  AS  Partial_Full_Term_Ind,
	CAST(Plan_Nbr  AS  STRING)  AS  Plan_Nbr,
	CAST(Pct  AS  NUMERIC)  AS  Pct,
	CAST(Pmt_Method_Code  AS  STRING)  AS  Pmt_Method_Code,
	CAST(Pmt_Nbr  AS  STRING)  AS  Pmt_Nbr,
	CAST(Pmt_Ref  AS  STRING)  AS  Pmt_Ref,
	CAST(Pmt_Type_Code  AS  STRING)  AS  Pmt_Type_Code,
	CAST(Relevant_Income  AS  NUMERIC)  AS  Relevant_Income,
	CAST(Scheme_Nbr  AS  STRING)  AS  Scheme_Nbr,
	CAST(Sell_Fund_Code  AS  STRING)  AS  Sell_Fund_Code,
	CAST(Susp_Type_Code  AS  STRING)  AS  Susp_Type_Code,
	CAST(Term_Reason_Code  AS  STRING)  AS  Term_Reason_Code,
	CAST(To_Other_Register_Scheme_ind  AS  STRING)  AS  To_Other_Register_Scheme_ind,
	CAST(To_Plan_Nbr  AS  STRING)  AS  To_Plan_Nbr,
	CAST(To_Scheme_Dte  AS  DATE)  AS  To_Scheme_Dte,
	CAST(To_Scheme_Type  AS  STRING)  AS  To_Scheme_Type,
	CAST(To_Trust_Code  AS  STRING)  AS  To_Trust_Code,
	CAST(Tran_Amt  AS  NUMERIC)  AS  Tran_Amt,
	CAST(Transfer_Mode  AS  STRING)  AS  Transfer_Mode,
	CAST(Trust_Reg_Nbr  AS  STRING)  AS  Trust_Reg_Nbr,
	CAST(Trustee_Code  AS  STRING)  AS  Trustee_Code,
	CAST(Unit_Value  AS  NUMERIC)  AS  Unit_Value
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
