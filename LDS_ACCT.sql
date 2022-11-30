WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.LDS_ACCT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Accrued_Int_Amt  AS  NUMERIC)  AS  Accrued_Int_Amt,
	CAST(Accrued_Int_Amt_Hke  AS  NUMERIC)  AS  Accrued_Int_Amt_Hke,
	CAST(Alternate_Ccy_Code  AS  STRING)  AS  Alternate_Ccy_Code,
	CAST(Collateral_Ind  AS  STRING)  AS  Collateral_Ind,
	CAST(Coupon_Rate  AS  NUMERIC)  AS  Coupon_Rate,
	CAST(Determine_Dte  AS  DATE)  AS  Determine_Dte,
	CAST(Intl_dep_nbr  AS  STRING)  AS  Intl_dep_nbr,
	CAST(Intl_Int_Rate  AS  NUMERIC)  AS  Intl_Int_Rate,
	CAST(Linked_Type_Code  AS  STRING)  AS  Linked_Type_Code,
	CAST(Mstr_Agreement_Dte  AS  DATE)  AS  Mstr_Agreement_Dte,
	CAST(Maturity_Amt  AS  NUMERIC)  AS  Maturity_Amt,
	CAST(Maturity_Dte  AS  DATE)  AS  Maturity_Dte,
	CAST(Nbr_Of_Days  AS  NUMERIC)  AS  Nbr_Of_Days,
	CAST(Nbr_Of_Share  AS  NUMERIC)  AS  Nbr_Of_Share,
	CAST(Next_Coupon_Dte  AS  DATE)  AS  Next_Coupon_Dte,
	CAST(Periodic_Ind  AS  STRING)  AS  Periodic_Ind,
	CAST(Profit_Amt  AS  NUMERIC)  AS  Profit_Amt,
	CAST(Result_Code  AS  STRING)  AS  Result_Code,
	CAST(Settle_Dte  AS  DATE)  AS  Settle_Dte,
	CAST(Stock_Code  AS  STRING)  AS  Stock_Code,
	CAST(Trade_Dte  AS  DATE)  AS  Trade_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
