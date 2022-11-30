WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.LN_APPL_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Appl_Nbr  AS  STRING)  AS  Appl_Nbr,
	CAST(Appl_Control_Fields  AS  STRING)  AS  Appl_Control_Fields,
	CAST(Allow_Deviation_ATD_Ind  AS  STRING)  AS  Allow_Deviation_ATD_Ind,
	CAST(Aprov_Lending_Centre_Id  AS  STRING)  AS  Aprov_Lending_Centre_Id,
	CAST(ATD  AS  NUMERIC)  AS  ATD,
	CAST(Cancel_Dte  AS  DATE)  AS  Cancel_Dte,
	CAST(Clean_Exposure_Income_Ratio  AS  NUMERIC)  AS  Clean_Exposure_Income_Ratio,
	CAST(Confirm_Dte  AS  DATE)  AS  Confirm_Dte,
	CAST(Create_Dte  AS  DATE)  AS  Create_Dte,
	CAST(Cust_CAP  AS  NUMERIC)  AS  Cust_CAP,
	CAST(Cust_DSR  AS  NUMERIC)  AS  Cust_DSR,
	CAST(Further_Review_Ind  AS  STRING)  AS  Further_Review_Ind,
	CAST(Ln_Collat_Ratio  AS  NUMERIC)  AS  Ln_Collat_Ratio,
	CAST(Ln_Income_Ratio  AS  NUMERIC)  AS  Ln_Income_Ratio,
	CAST(Ln_Net_Purchase_Ratio  AS  NUMERIC)  AS  Ln_Net_Purchase_Ratio,
	CAST(Ln_Purchase_Ratio  AS  NUMERIC)  AS  Ln_Purchase_Ratio,
	CAST(Net_Worth_Consider_Ind  AS  STRING)  AS  Net_Worth_Consider_Ind,
	CAST(Prod_CAP  AS  NUMERIC)  AS  Prod_CAP,
	CAST(Prod_DSR  AS  NUMERIC)  AS  Prod_DSR,
	CAST(Refinc_FC_Ind  AS  STRING)  AS  Refinc_FC_Ind,
	CAST(Refinc_FC_Acct_Nbr  AS  STRING)  AS  Refinc_FC_Acct_Nbr,
	CAST(Refinc_FC_Ln_Type  AS  STRING)  AS  Refinc_FC_Ln_Type,
	CAST(Rej_Dte  AS  DATE)  AS  Rej_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Cancel_Dte')}},
	{{validate_NoFutureDate('Confirm_Dte')}},
	{{validate_NoFutureDate('Create_Dte')}},
	{{validate_NoFutureDate('Rej_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
Cancel_Dte,
Clean_Exposure_Income_Ratio,
Confirm_Dte,
Create_Dte,
Cust_CAP,
Cust_DSR,
Further_Review_Ind,
Ln_Collat_Ratio,
Ln_Income_Ratio,
Ln_Net_Purchase_Ratio,
Ln_Purchase_Ratio,
Net_Worth_Consider_Ind,
Prod_CAP,
Prod_DSR,
Refinc_FC_Ind,
Refinc_FC_Acct_Nbr,
Refinc_FC_Ln_Type,
Rej_Dte,
	{{  aggregate_validation_columns(['__NoFutureDate_valid_Cancel_Dte','__NoFutureDate_valid_Confirm_Dte','__NoFutureDate_valid_Create_Dte','__NoFutureDate_valid_Rej_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
