WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_custodian_acct_portfolio_dtl_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Prod_Risk_Rating  AS  STRING)  AS  Prod_Risk_Rating,
	SAFE_CAST(Qty  AS  NUMERIC)  AS  Qty,
	SAFE_CAST(Qty_Being_Held  AS  NUMERIC)  AS  Qty_Being_Held,
	SAFE_CAST(Share_Nature_Code  AS  STRING)  AS  Share_Nature_Code,
	SAFE_CAST(Share_Nature_Desc  AS  STRING)  AS  Share_Nature_Desc,
	SAFE_CAST(Share_Sub_Type_Code  AS  STRING)  AS  Share_Sub_Type_Code,
	SAFE_CAST(Share_Sub_Type_Desc  AS  STRING)  AS  Share_Sub_Type_Desc,
	SAFE_CAST(Share_Type_Code  AS  STRING)  AS  Share_Type_Code,
	SAFE_CAST(Share_Type_Desc  AS  STRING)  AS  Share_Type_Desc,
	SAFE_CAST(Stock_Name  AS  STRING)  AS  Stock_Name,
	SAFE_CAST(Unit_Price  AS  NUMERIC)  AS  Unit_Price
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
