WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_ln_appl_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Appl_Nbr  AS  STRING)  AS  Appl_Nbr,
	SAFE_CAST(Appl_Control_Fields  AS  STRING)  AS  Appl_Control_Fields,
	SAFE_CAST(Aprov_Lending_Centre_Id  AS  STRING)  AS  Aprov_Lending_Centre_Id,
	SAFE_CAST(Cancel_Dte  AS  DATE)  AS  Cancel_Dte,
	SAFE_CAST(Clean_Exposure_Income_Ratio  AS  NUMERIC)  AS  Clean_Exposure_Income_Ratio,
	SAFE_CAST(Confirm_Dte  AS  DATE)  AS  Confirm_Dte,
	SAFE_CAST(Create_Dte  AS  DATE)  AS  Create_Dte,
	SAFE_CAST(Cust_CAP  AS  NUMERIC)  AS  Cust_CAP,
	SAFE_CAST(Cust_DSR  AS  NUMERIC)  AS  Cust_DSR,
	SAFE_CAST(Further_Review_Ind  AS  STRING)  AS  Further_Review_Ind,
	SAFE_CAST(Ln_Collat_Ratio  AS  NUMERIC)  AS  Ln_Collat_Ratio,
	SAFE_CAST(Ln_Income_Ratio  AS  NUMERIC)  AS  Ln_Income_Ratio,
	SAFE_CAST(Ln_Net_Purchase_Ratio  AS  NUMERIC)  AS  Ln_Net_Purchase_Ratio,
	SAFE_CAST(Ln_Purchase_Ratio  AS  NUMERIC)  AS  Ln_Purchase_Ratio,
	SAFE_CAST(Prod_CAP  AS  NUMERIC)  AS  Prod_CAP,
	SAFE_CAST(Prod_DSR  AS  NUMERIC)  AS  Prod_DSR,
	SAFE_CAST(Refinc_FC_Ind  AS  STRING)  AS  Refinc_FC_Ind,
	SAFE_CAST(Refinc_FC_Acct_Nbr  AS  STRING)  AS  Refinc_FC_Acct_Nbr,
	SAFE_CAST(Refinc_FC_Ln_Type  AS  STRING)  AS  Refinc_FC_Ln_Type,
	SAFE_CAST(Rej_Dte  AS  DATE)  AS  Rej_Dte,
	SAFE_CAST(Review_Dte  AS  DATE)  AS  Review_Dte,
	SAFE_CAST(Tot_Income  AS  NUMERIC)  AS  Tot_Income,
	SAFE_CAST(Net_Worth_Consider_Ind  AS  STRING)  AS  Net_Worth_Consider_Ind,
	SAFE_CAST(ATD  AS  NUMERIC)  AS  ATD,
	SAFE_CAST(Allow_Deviation_ATD_Ind  AS  STRING)  AS  Allow_Deviation_ATD_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
