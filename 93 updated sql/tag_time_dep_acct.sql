WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_time_dep_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Accrued_Int_Amt  AS  NUMERIC)  AS  Accrued_Int_Amt,
	SAFE_CAST(Actl_Int_Rate  AS  NUMERIC)  AS  Actl_Int_Rate,
	SAFE_CAST(Auto_Rnw_Code  AS  STRING)  AS  Auto_Rnw_Code,
	SAFE_CAST(Auto_Rnw_Term_Code  AS  STRING)  AS  Auto_Rnw_Term_Code,
	SAFE_CAST(Auto_Rnw_Type_Code  AS  STRING)  AS  Auto_Rnw_Type_Code,
	SAFE_CAST(Contract_Int_Amt  AS  NUMERIC)  AS  Contract_Int_Amt,
	SAFE_CAST(Dep_Int_Rate_Code  AS  STRING)  AS  Dep_Int_Rate_Code,
	SAFE_CAST(Dep_Nature_Code  AS  STRING)  AS  Dep_Nature_Code,
	SAFE_CAST(Eff_Dte  AS  DATE)  AS  Eff_Dte,
	SAFE_CAST(Fwd_Buy_Rate  AS  NUMERIC)  AS  Fwd_Buy_Rate,
	SAFE_CAST(Fwd_Contract_Ind  AS  STRING)  AS  Fwd_Contract_Ind,
	SAFE_CAST(Hkd_Int_Rate  AS  NUMERIC)  AS  Hkd_Int_Rate,
	SAFE_CAST(Hkd_Prin  AS  NUMERIC)  AS  Hkd_Prin,
	SAFE_CAST(Incremental_Rate  AS  NUMERIC)  AS  Incremental_Rate,
	SAFE_CAST(Int_Deduce_Amt  AS  NUMERIC)  AS  Int_Deduce_Amt,
	SAFE_CAST(Int_Deduce_Day  AS  NUMERIC)  AS  Int_Deduce_Day,
	SAFE_CAST(Int_Distrb_Acct_Nbr  AS  INT64)  AS  Int_Distrb_Acct_Nbr,
	SAFE_CAST(Int_Distrb_Appl_Id  AS  STRING)  AS  Int_Distrb_Appl_Id,
	SAFE_CAST(Int_Distrb_Control_Fields  AS  STRING)  AS  Int_Distrb_Control_Fields,
	SAFE_CAST(Last_Rnw_Dte  AS  DATE)  AS  Last_Rnw_Dte,
	SAFE_CAST(Maturity_Dte  AS  DATE)  AS  Maturity_Dte,
	SAFE_CAST(Odue_Int_Amt  AS  NUMERIC)  AS  Odue_Int_Amt,
	SAFE_CAST(Odue_Int_Rate  AS  NUMERIC)  AS  Odue_Int_Rate,
	SAFE_CAST(Paid_Dte  AS  DATE)  AS  Paid_Dte,
	SAFE_CAST(Paid_Int_Amt  AS  NUMERIC)  AS  Paid_Int_Amt,
	SAFE_CAST(Pend_Int_Adj_Amt  AS  NUMERIC)  AS  Pend_Int_Adj_Amt,
	SAFE_CAST(Rnw_Apply_Times  AS  NUMERIC)  AS  Rnw_Apply_Times,
	SAFE_CAST(Rnw_Incremental_Rate  AS  NUMERIC)  AS  Rnw_Incremental_Rate,
	SAFE_CAST(Rnw_Lump_Sum_Amt  AS  NUMERIC)  AS  Rnw_Lump_Sum_Amt,
	SAFE_CAST(Rnw_Lump_Sum_Ccy_Code  AS  STRING)  AS  Rnw_Lump_Sum_Ccy_Code,
	SAFE_CAST(Rnw_Nbr  AS  NUMERIC)  AS  Rnw_Nbr,
	SAFE_CAST(Rnw_Time_Dep_Type_Code  AS  STRING)  AS  Rnw_Time_Dep_Type_Code,
	SAFE_CAST(Term_Code  AS  STRING)  AS  Term_Code,
	SAFE_CAST(Time_Dep_Type_Code  AS  STRING)  AS  Time_Dep_Type_Code,
	SAFE_CAST(Tt_Sell_Rate  AS  NUMERIC)  AS  Tt_Sell_Rate,
	SAFE_CAST(Uplift_Req_Dte  AS  DATE)  AS  Uplift_Req_Dte
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
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Accrued_Int_Amt,
	Actl_Int_Rate,
	Auto_Rnw_Code,
	Auto_Rnw_Term_Code,
	Auto_Rnw_Type_Code,
	Contract_Int_Amt,
	Dep_Int_Rate_Code,
	Dep_Nature_Code,
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
	Uplift_Req_Dte,
	{{  full_valid_flag(['__NoFutureDate_valid_Eff_Dte','__NoFutureDate_valid_Last_Rnw_Dte','__Future_Date_valid_Maturity_Dte','__NoFutureDate_valid_Paid_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
