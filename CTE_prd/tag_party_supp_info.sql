WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_supp_info_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(BEA_Subsidiary_Ind  AS  STRING)  AS  BEA_Subsidiary_Ind,
	SAFE_CAST(Bk_Minority_Shareholder_Ind  AS  STRING)  AS  Bk_Minority_Shareholder_Ind,
	SAFE_CAST(Bk_Sr_Mgt_Ind  AS  STRING)  AS  Bk_Sr_Mgt_Ind,
	SAFE_CAST(Borrower_Grade  AS  STRING)  AS  Borrower_Grade,
	SAFE_CAST(Expsoure_Cap_Ind  AS  STRING)  AS  Expsoure_Cap_Ind,
	SAFE_CAST(FITCH_Rate_Code  AS  STRING)  AS  FITCH_Rate_Code,
	SAFE_CAST(FITCH_Rate_Last_Update_Dte  AS  DATE)  AS  FITCH_Rate_Last_Update_Dte,
	SAFE_CAST(IS9_Borrower_Grade  AS  STRING)  AS  IS9_Borrower_Grade,
	SAFE_CAST(IS9_Last_Update_dte  AS  DATE)  AS  IS9_Last_Update_dte,
	SAFE_CAST(IS9_Probability  AS  STRING)  AS  IS9_Probability,
	SAFE_CAST(Lending_Offr_Ind  AS  STRING)  AS  Lending_Offr_Ind,
	SAFE_CAST(Mainland_Cnterparty_Type  AS  STRING)  AS  Mainland_Cnterparty_Type,
	SAFE_CAST(Moody_Rating  AS  STRING)  AS  Moody_Rating,
	SAFE_CAST(Moody_Rating_Last_Update_Dte  AS  DATE)  AS  Moody_Rating_Last_Update_Dte,
	SAFE_CAST(Mortgage_Equity_Ratio  AS  NUMERIC)  AS  Mortgage_Equity_Ratio,
	SAFE_CAST(PD_Pct  AS  NUMERIC)  AS  PD_Pct,
	SAFE_CAST(PD_Pct_Last_Update_Dte  AS  DATE)  AS  PD_Pct_Last_Update_Dte,
	SAFE_CAST(Province_Of_Oper_Resid_Addr  AS  STRING)  AS  Province_Of_Oper_Resid_Addr,
	SAFE_CAST(Reg_FI_Ind  AS  STRING)  AS  Reg_FI_Ind,
	SAFE_CAST(Reg_FI_Ind_Last_Update_Dte  AS  DATE)  AS  Reg_FI_Ind_Last_Update_Dte,
	SAFE_CAST(SCRA_Ind  AS  STRING)  AS  SCRA_Ind,
	SAFE_CAST(SCRA_Ind_Last_Update_Dte  AS  DATE)  AS  SCRA_Ind_Last_Update_Dte,
	SAFE_CAST(SP_Rating  AS  STRING)  AS  SP_Rating,
	SAFE_CAST(SP_Rating_Last_Update_Dte  AS  DATE)  AS  SP_Rating_Last_Update_Dte,
	SAFE_CAST(Sub_Director_Ind  AS  STRING)  AS  Sub_Director_Ind,
	SAFE_CAST(Sub_Lending_Offr_Ind  AS  STRING)  AS  Sub_Lending_Offr_Ind,
	SAFE_CAST(Sub_Minority_Shareholder_Ind  AS  STRING)  AS  Sub_Minority_Shareholder_Ind,
	SAFE_CAST(Sub_Sr_Mgt_Ind  AS  STRING)  AS  Sub_Sr_Mgt_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Moody_Rating_Last_Update_Dte')}},
	{{validate_NoFutureDate('PD_Pct_Last_Update_Dte')}},
	{{validate_NoFutureDate('SP_Rating_Last_Update_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	BEA_Subsidiary_Ind,
	Bk_Minority_Shareholder_Ind,
	Bk_Sr_Mgt_Ind,
	Borrower_Grade,
	Expsoure_Cap_Ind,
	FITCH_Rate_Code,
	FITCH_Rate_Last_Update_Dte,
	IS9_Borrower_Grade,
	IS9_Last_Update_dte,
	IS9_Probability,
	Lending_Offr_Ind,
	Mainland_Cnterparty_Type,
	Moody_Rating,
	Moody_Rating_Last_Update_Dte,
	Mortgage_Equity_Ratio,
	PD_Pct,
	PD_Pct_Last_Update_Dte,
	Province_Of_Oper_Resid_Addr,
	Reg_FI_Ind,
	Reg_FI_Ind_Last_Update_Dte,
	SCRA_Ind,
	SCRA_Ind_Last_Update_Dte,
	SP_Rating,
	SP_Rating_Last_Update_Dte,
	Sub_Director_Ind,
	Sub_Lending_Offr_Ind,
	Sub_Minority_Shareholder_Ind,
	Sub_Sr_Mgt_Ind,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Moody_Rating_Last_Update_Dte','__NoFutureDate_valid_PD_Pct_Last_Update_Dte','__NoFutureDate_valid_SP_Rating_Last_Update_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
