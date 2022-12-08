WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.LN_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Accum_Waived_Od_Int  AS  NUMERIC)  AS  Accum_Waived_Od_Int,
	CAST(Appl_Appl_Id  AS  STRING)  AS  Appl_Appl_Id,
	CAST(Appl_Control_Fields  AS  STRING)  AS  Appl_Control_Fields,
	CAST(Appl_Nbr  AS  STRING)  AS  Appl_Nbr,
	CAST(Appl_Ppsl_Seq_Nbr  AS  NUMERIC)  AS  Appl_Ppsl_Seq_Nbr,
	CAST(Agency_Code  AS  STRING)  AS  Agency_Code,
	CAST(Bk_Return_Code  AS  STRING)  AS  Bk_Return_Code,
	CAST(Debt_Status  AS  STRING)  AS  Debt_Status,
	CAST(Facility_Code  AS  STRING)  AS  Facility_Code,
	CAST(Gov_Guarantee_Pct  AS  NUMERIC)  AS  Gov_Guarantee_Pct,
	CAST(Impair_Ln_Ind  AS  STRING)  AS  Impair_Ln_Ind,
	CAST(Insl_Freq_Nbr_Unit  AS  NUMERIC)  AS  Insl_Freq_Nbr_Unit,
	CAST(Insl_Freq_Unit_Type_Code  AS  STRING)  AS  Insl_Freq_Unit_Type_Code,
	CAST(Int_Base_Rate  AS  NUMERIC)  AS  Int_Base_Rate,
	CAST(Int_Start_Dte  AS  DATE)  AS  Int_Start_Dte,
	CAST(Int_Rate_Adj_Pct  AS  NUMERIC)  AS  Int_Rate_Adj_Pct,
	CAST(Int_Rate_Base_Code  AS  STRING)  AS  Int_Rate_Base_Code,
	CAST(Int_Rate_Code  AS  STRING)  AS  Int_Rate_Code,
	CAST(Int_Rate_Loading  AS  NUMERIC)  AS  Int_Rate_Loading,
	CAST(Int_Rate_Mode  AS  STRING)  AS  Int_Rate_Mode,
	CAST(Int_Rate_Tot  AS  NUMERIC)  AS  Int_Rate_Tot,
	CAST(Int_Rate_Type  AS  STRING)  AS  Int_Rate_Type,
	CAST(Last_Rate_Chng_Dte  AS  DATE)  AS  Last_Rate_Chng_Dte,
	CAST(Last_Settle_Dte  AS  DATE)  AS  Last_Settle_Dte,
	CAST(Ln_Introducer_Code  AS  STRING)  AS  Ln_Introducer_Code,
	CAST(Ln_Seq_Nbr  AS  NUMERIC)  AS  Ln_Seq_Nbr,
	CAST(Ln_Type_Code  AS  STRING)  AS  Ln_Type_Code,
	CAST(Ln_Use_Country  AS  STRING)  AS  Ln_Use_Country,
	CAST(Maturity_Dte  AS  DATE)  AS  Maturity_Dte,
	CAST(Mortgage_Plan_Code  AS  STRING)  AS  Mortgage_Plan_Code,
	CAST(Repmt_Type_Code  AS  STRING)  AS  Repmt_Type_Code,
	CAST(Next_Pmt_Due_Dte  AS  DATE)  AS  Next_Pmt_Due_Dte,
	CAST(Od_Fixed_Int_Ind  AS  STRING)  AS  Od_Fixed_Int_Ind,
	CAST(Od_Grace_Period  AS  NUMERIC)  AS  Od_Grace_Period,
	CAST(Od_Int_Adj_Pct  AS  NUMERIC)  AS  Od_Int_Adj_Pct,
	CAST(Od_Int_Amt  AS  NUMERIC)  AS  Od_Int_Amt,
	CAST(Od_Int_Rate  AS  NUMERIC)  AS  Od_Int_Rate,
	CAST(Od_Prin_Amt  AS  NUMERIC)  AS  Od_Prin_Amt,
	CAST(Od_Rate_Chng_Opt  AS  STRING)  AS  Od_Rate_Chng_Opt,
	CAST(Od_Rate_Type  AS  STRING)  AS  Od_Rate_Type,
	CAST(Orig_Ln_Amt  AS  NUMERIC)  AS  Orig_Ln_Amt,
	CAST(OS_Od_Int_Amt  AS  NUMERIC)  AS  OS_Od_Int_Amt,
	CAST(Os_Prin_Amt  AS  NUMERIC)  AS  Os_Prin_Amt,
	CAST(Pmt_Due_Dte  AS  DATE)  AS  Pmt_Due_Dte,
	CAST(Ppsl_Dte  AS  DATE)  AS  Ppsl_Dte,
	CAST(Prod_Code  AS  STRING)  AS  Prod_Code,
	CAST(Project_Code  AS  STRING)  AS  Project_Code,
	CAST(Promote_Code  AS  STRING)  AS  Promote_Code,
	CAST(Purpose_Of_Fin_HKMA  AS  STRING)  AS  Purpose_Of_Fin_HKMA,
	CAST(Rate_Chng_Eff_Dte  AS  DATE)  AS  Rate_Chng_Eff_Dte,
	CAST(Rate_Chng_Opt  AS  STRING)  AS  Rate_Chng_Opt,
	CAST(Repmt_Method_Code  AS  STRING)  AS  Repmt_Method_Code,
	CAST(Reprice_Option  AS  STRING)  AS  Reprice_Option,
	CAST(Solicitor_Code  AS  STRING)  AS  Solicitor_Code,
	CAST(Tenor  AS  NUMERIC)  AS  Tenor,
	CAST(Written_Off_Amt  AS  NUMERIC)  AS  Written_Off_Amt
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Int_Start_Dte')}},
	{{validate_NoFutureDate('Last_Rate_Chng_Dte')}},
	{{validate_NoFutureDate('Last_Settle_Dte')}},
	{{validate_Future_Date('Maturity_Dte')}},
	{{validate_Future_Date('Pmt_Due_Dte')}},
	{{validate_Future_Date('Ppsl_Dte')}},
	{{validate_NoFutureDate('Rate_Chng_Eff_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Int_Start_Dte,
Int_Rate_Adj_Pct,
Int_Rate_Base_Code,
Int_Rate_Code,
Int_Rate_Loading,
Int_Rate_Mode,
Int_Rate_Tot,
Int_Rate_Type,
Last_Rate_Chng_Dte,
Last_Settle_Dte,
Ln_Introducer_Code,
Ln_Seq_Nbr,
Ln_Type_Code,
Ln_Use_Country,
Maturity_Dte,
Mortgage_Plan_Code,
Repmt_Type_Code,
Next_Pmt_Due_Dte,
Od_Fixed_Int_Ind,
Od_Grace_Period,
Od_Int_Adj_Pct,
Od_Int_Amt,
Od_Int_Rate,
Od_Prin_Amt,
Od_Rate_Chng_Opt,
Od_Rate_Type,
Orig_Ln_Amt,
OS_Od_Int_Amt,
Os_Prin_Amt,
Pmt_Due_Dte,
Ppsl_Dte,
Prod_Code,
Project_Code,
Promote_Code,
Purpose_Of_Fin_HKMA,
Rate_Chng_Eff_Dte,
Rate_Chng_Opt,
Repmt_Method_Code,
Reprice_Option,
Solicitor_Code,
Tenor,
Written_Off_Amt,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Int_Start_Dte','__NoFutureDate_valid_Last_Rate_Chng_Dte','__NoFutureDate_valid_Last_Settle_Dte','__Future_Date_valid_Maturity_Dte','__Future_Date_valid_Pmt_Due_Dte','__Future_Date_valid_Ppsl_Dte','__NoFutureDate_valid_Rate_Chng_Eff_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4