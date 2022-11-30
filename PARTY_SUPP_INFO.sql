WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_SUPP_INFO_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(BEA_Subsidiary_Ind  AS  STRING)  AS  BEA_Subsidiary_Ind,
	CAST(Bk_Minority_Shareholder_Ind  AS  STRING)  AS  Bk_Minority_Shareholder_Ind,
	CAST(Bk_Sr_Mgt_Ind  AS  STRING)  AS  Bk_Sr_Mgt_Ind,
	CAST(Borrower_Grade  AS  STRING)  AS  Borrower_Grade,
	CAST(Expsoure_Cap_Ind  AS  STRING)  AS  Expsoure_Cap_Ind,
	CAST(FITCH_Rate_Code  AS  STRING)  AS  FITCH_Rate_Code,
	CAST(FITCH_Rate_Last_Update_Dte  AS  DATE)  AS  FITCH_Rate_Last_Update_Dte,
	CAST(IS9_Borrower_Grade  AS  STRING)  AS  IS9_Borrower_Grade,
	CAST(IS9_Last_Update_dte  AS  DATE)  AS  IS9_Last_Update_dte,
	CAST(IS9_Probability  AS  STRING)  AS  IS9_Probability,
	CAST(Lending_Offr_Ind  AS  STRING)  AS  Lending_Offr_Ind,
	CAST(Mainland_Cnterparty_Type  AS  STRING)  AS  Mainland_Cnterparty_Type,
	CAST(Moody_Rating  AS  STRING)  AS  Moody_Rating,
	CAST(Moody_Rating_Last_Update_Dte  AS  DATE)  AS  Moody_Rating_Last_Update_Dte,
	CAST(Mortgage_Equity_Ratio  AS  NUMERIC)  AS  Mortgage_Equity_Ratio,
	CAST(PD_Pct  AS  NUMERIC)  AS  PD_Pct,
	CAST(PD_Pct_Last_Update_Dte  AS  DATE)  AS  PD_Pct_Last_Update_Dte,
	CAST(Province_Of_Oper_Resid_Addr  AS  STRING)  AS  Province_Of_Oper_Resid_Addr,
	CAST(Reg_FI_Ind  AS  STRING)  AS  Reg_FI_Ind,
	CAST(Reg_FI_Ind_Last_Update_Dte  AS  DATE)  AS  Reg_FI_Ind_Last_Update_Dte,
	CAST(SCRA_Ind  AS  STRING)  AS  SCRA_Ind,
	CAST(SCRA_Ind_Last_Update_Dte  AS  DATE)  AS  SCRA_Ind_Last_Update_Dte,
	CAST(SP_Rating  AS  STRING)  AS  SP_Rating,
	CAST(SP_Rating_Last_Update_Dte  AS  DATE)  AS  SP_Rating_Last_Update_Dte,
	CAST(Sub_Director_Ind  AS  STRING)  AS  Sub_Director_Ind,
	CAST(Sub_Lending_Offr_Ind  AS  STRING)  AS  Sub_Lending_Offr_Ind,
	CAST(Sub_Minority_Shareholder_Ind  AS  STRING)  AS  Sub_Minority_Shareholder_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
