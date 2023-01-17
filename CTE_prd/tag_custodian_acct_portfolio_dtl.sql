WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_custodian_acct_portfolio_dtl_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  STRING)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Start_Dte  AS  DATE)  AS  Start_Dte,
	SAFE_CAST(End_Dte  AS  DATE)  AS  End_Dte,
	SAFE_CAST(ISIN_Code  AS  STRING)  AS  ISIN_Code,
	SAFE_CAST(Qty  AS  NUMERIC)  AS  Qty,
	SAFE_CAST(Stock_Name  AS  STRING)  AS  Stock_Name,
	SAFE_CAST(Share_Type_Code  AS  STRING)  AS  Share_Type_Code,
	SAFE_CAST(Share_Type_Desc  AS  STRING)  AS  Share_Type_Desc,
	SAFE_CAST(Share_Nature_Code  AS  STRING)  AS  Share_Nature_Code,
	SAFE_CAST(Share_Nature_Desc  AS  STRING)  AS  Share_Nature_Desc,
	SAFE_CAST(Unit_Price  AS  NUMERIC)  AS  Unit_Price,
	SAFE_CAST(Ccy_code  AS  STRING)  AS  Ccy_code,
	SAFE_CAST(Portfolio_Market_Val  AS  NUMERIC)  AS  Portfolio_Market_Val,
	SAFE_CAST(Portfolio_Market_Val_Hke  AS  NUMERIC)  AS  Portfolio_Market_Val_Hke,
	SAFE_CAST(Coupon_Rate  AS  NUMERIC)  AS  Coupon_Rate,
	SAFE_CAST(Maturity_Dte  AS  DATE)  AS  Maturity_Dte,
	SAFE_CAST(Order_Code  AS  STRING)  AS  Order_Code,
	SAFE_CAST(Stock_Code  AS  STRING)  AS  Stock_Code,
	SAFE_CAST(Portfolio_Type_Code  AS  STRING)  AS  Portfolio_Type_Code,
	SAFE_CAST(Cbs_Prod_Code  AS  STRING)  AS  Cbs_Prod_Code,
	SAFE_CAST(Qty_Being_Held  AS  NUMERIC)  AS  Qty_Being_Held,
	SAFE_CAST(Price_Dte  AS  DATE)  AS  Price_Dte,
	SAFE_CAST(Share_Sub_Type_Code  AS  STRING)  AS  Share_Sub_Type_Code,
	SAFE_CAST(Share_Sub_Type_Desc  AS  STRING)  AS  Share_Sub_Type_Desc,
	SAFE_CAST(Prod_Risk_Rating  AS  STRING)  AS  Prod_Risk_Rating,
	SAFE_CAST(Issuer_Code  AS  STRING)  AS  Issuer_Code,
	SAFE_CAST(Issuer_Name  AS  STRING)  AS  Issuer_Name
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
