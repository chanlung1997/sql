WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.CUSTODIAN_ACCT_PORTFOLIO_DTL_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Prod_Risk_Rating  AS  STRING)  AS  Prod_Risk_Rating,
	CAST(Qty  AS  NUMERIC)  AS  Qty,
	CAST(Qty_Being_Held  AS  NUMERIC)  AS  Qty_Being_Held,
	CAST(Share_Nature_Code  AS  STRING)  AS  Share_Nature_Code,
	CAST(Share_Nature_Desc  AS  STRING)  AS  Share_Nature_Desc,
	CAST(Share_Sub_Type_Code  AS  STRING)  AS  Share_Sub_Type_Code,
	CAST(Share_Sub_Type_Desc  AS  STRING)  AS  Share_Sub_Type_Desc,
	CAST(Share_Type_Code  AS  STRING)  AS  Share_Type_Code,
	CAST(Share_Type_Desc  AS  STRING)  AS  Share_Type_Desc,
	CAST(Stock_Name  AS  STRING)  AS  Stock_Name
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
