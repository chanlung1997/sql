WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_card_acct_cycle_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Cycle_Dte  AS  DATE)  AS  Cycle_Dte,
	SAFE_CAST(Anl_Fee_Amt  AS  NUMERIC)  AS  Anl_Fee_Amt,
	SAFE_CAST(Anl_Fee_Reversal_Amt  AS  NUMERIC)  AS  Anl_Fee_Reversal_Amt,
	SAFE_CAST(Cash_Advance_Amt  AS  NUMERIC)  AS  Cash_Advance_Amt,
	SAFE_CAST(Cash_Advance_Cnt  AS  NUMERIC)  AS  Cash_Advance_Cnt,
	SAFE_CAST(Cash_Advance_Fee_Amt  AS  NUMERIC)  AS  Cash_Advance_Fee_Amt,
	SAFE_CAST(Cash_Advance_Fee_Reversal_Amt  AS  NUMERIC)  AS  Cash_Advance_Fee_Reversal_Amt,
	SAFE_CAST(Cash_Advance_Reversal_Amt  AS  NUMERIC)  AS  Cash_Advance_Reversal_Amt,
	SAFE_CAST(Cash_Advance_Reversal_Cnt  AS  NUMERIC)  AS  Cash_Advance_Reversal_Cnt,
	SAFE_CAST(Cur_Due_Amt  AS  NUMERIC)  AS  Cur_Due_Amt,
	SAFE_CAST(Delq_Code  AS  STRING)  AS  Delq_Code,
	SAFE_CAST(Fin_Chrg_Amt  AS  NUMERIC)  AS  Fin_Chrg_Amt,
	SAFE_CAST(IBNP_Cash_Amt  AS  NUMERIC)  AS  IBNP_Cash_Amt,
	SAFE_CAST(IBNP_Retail_Amt  AS  NUMERIC)  AS  IBNP_Retail_Amt,
	SAFE_CAST(Late_Fee_Amt  AS  NUMERIC)  AS  Late_Fee_Amt,
	SAFE_CAST(Late_Fee_Reversal_Amt  AS  NUMERIC)  AS  Late_Fee_Reversal_Amt,
	SAFE_CAST(Pmt_Amt  AS  NUMERIC)  AS  Pmt_Amt,
	SAFE_CAST(Pmt_Cnt  AS  NUMERIC)  AS  Pmt_Cnt,
	SAFE_CAST(Pmt_Pct_Code  AS  STRING)  AS  Pmt_Pct_Code,
	SAFE_CAST(Pmt_Reversal_Amt  AS  NUMERIC)  AS  Pmt_Reversal_Amt,
	SAFE_CAST(Pmt_Reversal_Cnt  AS  NUMERIC)  AS  Pmt_Reversal_Cnt,
	SAFE_CAST(Retail_Amt  AS  NUMERIC)  AS  Retail_Amt,
	SAFE_CAST(Retail_Cnt  AS  NUMERIC)  AS  Retail_Cnt,
	SAFE_CAST(Retail_Reversal_Amt  AS  NUMERIC)  AS  Retail_Reversal_Amt,
	SAFE_CAST(Retail_Reversal_Cnt  AS  NUMERIC)  AS  Retail_Reversal_Cnt,
	SAFE_CAST(Stmt_Bal  AS  NUMERIC)  AS  Stmt_Bal
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Cycle_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Cycle_Dte,
	Anl_Fee_Amt,
	Anl_Fee_Reversal_Amt,
	Cash_Advance_Amt,
	Cash_Advance_Cnt,
	Cash_Advance_Fee_Amt,
	Cash_Advance_Fee_Reversal_Amt,
	Cash_Advance_Reversal_Amt,
	Cash_Advance_Reversal_Cnt,
	Cur_Due_Amt,
	Delq_Code,
	Fin_Chrg_Amt,
	IBNP_Cash_Amt,
	IBNP_Retail_Amt,
	Late_Fee_Amt,
	Late_Fee_Reversal_Amt,
	Pmt_Amt,
	Pmt_Cnt,
	Pmt_Pct_Code,
	Pmt_Reversal_Amt,
	Pmt_Reversal_Cnt,
	Retail_Amt,
	Retail_Cnt,
	Retail_Reversal_Amt,
	Retail_Reversal_Cnt,
	Stmt_Bal,
	{{  full_valid_flag(['__NoFutureDate_valid_Cycle_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
