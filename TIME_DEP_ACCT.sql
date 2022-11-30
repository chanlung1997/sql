WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.TIME_DEP_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Accrued_Int_Amt  AS  NUMERIC)  AS  Accrued_Int_Amt,
	CAST(Actl_Int_Rate  AS  NUMERIC)  AS  Actl_Int_Rate,
	CAST(Auto_Rnw_Code  AS  STRING)  AS  Auto_Rnw_Code,
	CAST(Auto_Rnw_Term_Code  AS  STRING)  AS  Auto_Rnw_Term_Code,
	CAST(Auto_Rnw_Type_Code  AS  STRING)  AS  Auto_Rnw_Type_Code,
	CAST(Contract_Int_Amt  AS  NUMERIC)  AS  Contract_Int_Amt,
	CAST(Dep_Int_Rate_Code  AS  STRING)  AS  Dep_Int_Rate_Code,
	CAST(Dep_Nature_Code  AS  STRING)  AS  Dep_Nature_Code,
	CAST(Eff_Dte  AS  DATE)  AS  Eff_Dte,
	CAST(Fwd_Buy_Rate  AS  NUMERIC)  AS  Fwd_Buy_Rate,
	CAST(Fwd_Contract_Ind  AS  STRING)  AS  Fwd_Contract_Ind,
	CAST(Hkd_Int_Rate  AS  NUMERIC)  AS  Hkd_Int_Rate,
	CAST(Hkd_Prin  AS  NUMERIC)  AS  Hkd_Prin,
	CAST(Incremental_Rate  AS  NUMERIC)  AS  Incremental_Rate,
	CAST(Int_Deduce_Amt  AS  NUMERIC)  AS  Int_Deduce_Amt,
	CAST(Int_Deduce_Day  AS  NUMERIC)  AS  Int_Deduce_Day,
	CAST(Int_Distrb_Acct_Nbr  AS  INT64)  AS  Int_Distrb_Acct_Nbr,
	CAST(Int_Distrb_Appl_Id  AS  STRING)  AS  Int_Distrb_Appl_Id,
	CAST(Int_Distrb_Control_Fields  AS  STRING)  AS  Int_Distrb_Control_Fields,
	CAST(Last_Rnw_Dte  AS  DATE)  AS  Last_Rnw_Dte,
	CAST(Maturity_Dte  AS  DATE)  AS  Maturity_Dte,
	CAST(Odue_Int_Amt  AS  NUMERIC)  AS  Odue_Int_Amt,
	CAST(Odue_Int_Rate  AS  NUMERIC)  AS  Odue_Int_Rate,
	CAST(Paid_Dte  AS  DATE)  AS  Paid_Dte,
	CAST(Paid_Int_Amt  AS  NUMERIC)  AS  Paid_Int_Amt,
	CAST(Pend_Int_Adj_Amt  AS  NUMERIC)  AS  Pend_Int_Adj_Amt,
	CAST(Rnw_Apply_Times  AS  NUMERIC)  AS  Rnw_Apply_Times,
	CAST(Rnw_Incremental_Rate  AS  NUMERIC)  AS  Rnw_Incremental_Rate,
	CAST(Rnw_Lump_Sum_Amt  AS  NUMERIC)  AS  Rnw_Lump_Sum_Amt,
	CAST(Rnw_Lump_Sum_Ccy_Code  AS  STRING)  AS  Rnw_Lump_Sum_Ccy_Code,
	CAST(Rnw_Nbr  AS  NUMERIC)  AS  Rnw_Nbr,
	CAST(Rnw_Time_Dep_Type_Code  AS  STRING)  AS  Rnw_Time_Dep_Type_Code,
	CAST(Term_Code  AS  STRING)  AS  Term_Code,
	CAST(Time_Dep_Type_Code  AS  STRING)  AS  Time_Dep_Type_Code,
	CAST(Tt_Sell_Rate  AS  NUMERIC)  AS  Tt_Sell_Rate
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Eff_Dte')}},
	{{validate_NoFutureDate('Last_Rnw_Dte')}},
	{{validate_Future_Date('Maturity_Dte')}},
	{{validate_NoFutureDate('Paid_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Eff_Dte,
Fwd_Buy_Rate,
Fwd_Contract_Ind,
Hkd_Int_Rate,
Hkd_Prin,
Incremental_Rate,
Int_Deduce_Amt,
Int_Deduce_Day,
Int_Distrb_Acct_Nbr,
Int_Distrb_Appl_Id,
Int_Distrb_Control_Fields,
Last_Rnw_Dte,
Maturity_Dte,
Odue_Int_Amt,
Odue_Int_Rate,
Paid_Dte,
Paid_Int_Amt,
Pend_Int_Adj_Amt,
Rnw_Apply_Times,
Rnw_Incremental_Rate,
Rnw_Lump_Sum_Amt,
Rnw_Lump_Sum_Ccy_Code,
Rnw_Nbr,
Rnw_Time_Dep_Type_Code,
Term_Code,
Time_Dep_Type_Code,
Tt_Sell_Rate,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Eff_Dte','__NoFutureDate_valid_Last_Rnw_Dte','__Future_Date_valid_Maturity_Dte','__NoFutureDate_valid_Paid_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
