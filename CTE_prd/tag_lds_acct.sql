WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_lds_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Accrued_Int_Amt  AS  NUMERIC)  AS  Accrued_Int_Amt,
	SAFE_CAST(Accrued_Int_Amt_Hke  AS  NUMERIC)  AS  Accrued_Int_Amt_Hke,
	SAFE_CAST(Alternate_Ccy_Code  AS  STRING)  AS  Alternate_Ccy_Code,
	SAFE_CAST(Collateral_Ind  AS  STRING)  AS  Collateral_Ind,
	SAFE_CAST(Coupon_Rate  AS  NUMERIC)  AS  Coupon_Rate,
	SAFE_CAST(Determine_Dte  AS  DATE)  AS  Determine_Dte,
	SAFE_CAST(Intl_dep_nbr  AS  STRING)  AS  Intl_dep_nbr,
	SAFE_CAST(Intl_Int_Rate  AS  NUMERIC)  AS  Intl_Int_Rate,
	SAFE_CAST(Linked_Type_Code  AS  STRING)  AS  Linked_Type_Code,
	SAFE_CAST(Mstr_Agreement_Dte  AS  DATE)  AS  Mstr_Agreement_Dte,
	SAFE_CAST(Maturity_Amt  AS  NUMERIC)  AS  Maturity_Amt,
	SAFE_CAST(Maturity_Dte  AS  DATE)  AS  Maturity_Dte,
	SAFE_CAST(Nbr_Of_Days  AS  NUMERIC)  AS  Nbr_Of_Days,
	SAFE_CAST(Nbr_Of_Share  AS  NUMERIC)  AS  Nbr_Of_Share,
	SAFE_CAST(Next_Coupon_Dte  AS  DATE)  AS  Next_Coupon_Dte,
	SAFE_CAST(Periodic_Ind  AS  STRING)  AS  Periodic_Ind,
	SAFE_CAST(Profit_Amt  AS  NUMERIC)  AS  Profit_Amt,
	SAFE_CAST(Result_Code  AS  STRING)  AS  Result_Code,
	SAFE_CAST(Settle_Dte  AS  DATE)  AS  Settle_Dte,
	SAFE_CAST(Stock_Code  AS  STRING)  AS  Stock_Code,
	SAFE_CAST(Trade_Dte  AS  DATE)  AS  Trade_Dte,
	SAFE_CAST(Type_Ref_Nbr  AS  STRING)  AS  Type_Ref_Nbr
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Mstr_Agreement_Dte')}},
	{{validate_Future_Date('Maturity_Dte')}},
	{{validate_Future_Date('Settle_Dte')}},
	{{validate_NoFutureDate('Trade_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Accrued_Int_Amt,
	Accrued_Int_Amt_Hke,
	Alternate_Ccy_Code,
	Collateral_Ind,
	Coupon_Rate,
	Determine_Dte,
	Intl_dep_nbr,
	Intl_Int_Rate,
	Linked_Type_Code,
	Mstr_Agreement_Dte,
	Maturity_Amt,
	Maturity_Dte,
	Nbr_Of_Days,
	Nbr_Of_Share,
	Next_Coupon_Dte,
	Periodic_Ind,
	Profit_Amt,
	Result_Code,
	Settle_Dte,
	Stock_Code,
	Trade_Dte,
	Type_Ref_Nbr,
	{{  full_valid_flag(['__Future_Date_valid_Mstr_Agreement_Dte','__Future_Date_valid_Maturity_Dte','__Future_Date_valid_Settle_Dte','__NoFutureDate_valid_Trade_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
