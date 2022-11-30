WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CR_CARD_ACCT_CYCLE_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Cycle_Dte  AS  DATE)  AS  Cycle_Dte,
	CAST(Anl_Fee_Amt  AS  NUMERIC)  AS  Anl_Fee_Amt,
	CAST(Anl_Fee_Reversal_Amt  AS  NUMERIC)  AS  Anl_Fee_Reversal_Amt,
	CAST(Cash_Advance_Amt  AS  NUMERIC)  AS  Cash_Advance_Amt,
	CAST(Cash_Advance_Cnt  AS  NUMERIC)  AS  Cash_Advance_Cnt,
	CAST(Cash_Advance_Fee_Amt  AS  NUMERIC)  AS  Cash_Advance_Fee_Amt,
	CAST(Cash_Advance_Fee_Reversal_Amt  AS  NUMERIC)  AS  Cash_Advance_Fee_Reversal_Amt,
	CAST(Cash_Advance_Reversal_Amt  AS  NUMERIC)  AS  Cash_Advance_Reversal_Amt,
	CAST(Cash_Advance_Reversal_Cnt  AS  NUMERIC)  AS  Cash_Advance_Reversal_Cnt,
	CAST(Cur_Due_Amt  AS  NUMERIC)  AS  Cur_Due_Amt,
	CAST(Delq_Code  AS  STRING)  AS  Delq_Code,
	CAST(Fin_Chrg_Amt  AS  NUMERIC)  AS  Fin_Chrg_Amt,
	CAST(IBNP_Cash_Amt  AS  NUMERIC)  AS  IBNP_Cash_Amt,
	CAST(IBNP_Retail_Amt  AS  NUMERIC)  AS  IBNP_Retail_Amt,
	CAST(Late_Fee_Amt  AS  NUMERIC)  AS  Late_Fee_Amt,
	CAST(Late_Fee_Reversal_Amt  AS  NUMERIC)  AS  Late_Fee_Reversal_Amt,
	CAST(Pmt_Amt  AS  NUMERIC)  AS  Pmt_Amt,
	CAST(Pmt_Cnt  AS  NUMERIC)  AS  Pmt_Cnt,
	CAST(Pmt_Pct_Code  AS  STRING)  AS  Pmt_Pct_Code,
	CAST(Pmt_Reversal_Amt  AS  NUMERIC)  AS  Pmt_Reversal_Amt,
	CAST(Pmt_Reversal_Cnt  AS  NUMERIC)  AS  Pmt_Reversal_Cnt,
	CAST(Retail_Amt  AS  NUMERIC)  AS  Retail_Amt,
	CAST(Retail_Cnt  AS  NUMERIC)  AS  Retail_Cnt,
	CAST(Retail_Reversal_Amt  AS  NUMERIC)  AS  Retail_Reversal_Amt,
	CAST(Retail_Reversal_Cnt  AS  NUMERIC)  AS  Retail_Reversal_Cnt
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
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Cycle_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
