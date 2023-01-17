WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_ln_ppsl_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Appl_Nbr  AS  STRING)  AS  Appl_Nbr,
	SAFE_CAST(Appl_Control_Fields  AS  STRING)  AS  Appl_Control_Fields,
	SAFE_CAST(Appl_Ppsl_Seq_Nbr  AS  NUMERIC)  AS  Appl_Ppsl_Seq_Nbr,
	SAFE_CAST(Admin_Code  AS  STRING)  AS  Admin_Code,
	SAFE_CAST(Advance_Dte  AS  DATE)  AS  Advance_Dte,
	SAFE_CAST(Agent_Code  AS  STRING)  AS  Agent_Code,
	SAFE_CAST(Appl_Source  AS  STRING)  AS  Appl_Source,
	SAFE_CAST(Apply_Ln_Amt  AS  NUMERIC)  AS  Apply_Ln_Amt,
	SAFE_CAST(Apply_Nbr_Of_Insl  AS  NUMERIC)  AS  Apply_Nbr_Of_Insl,
	SAFE_CAST(Aprov_Ln_Amt  AS  NUMERIC)  AS  Aprov_Ln_Amt,
	SAFE_CAST(Aprov_Nbr_Of_Insl  AS  NUMERIC)  AS  Aprov_Nbr_Of_Insl,
	SAFE_CAST(Asset_Class  AS  STRING)  AS  Asset_Class,
	SAFE_CAST(Chrg_Code  AS  STRING)  AS  Chrg_Code,
	SAFE_CAST(Compliance_Result  AS  STRING)  AS  Compliance_Result,
	SAFE_CAST(Corr_Add  AS  STRING)  AS  Corr_Add,
	SAFE_CAST(Cr_Facility_Ind  AS  STRING)  AS  Cr_Facility_Ind,
	SAFE_CAST(Cr_Line_Ind  AS  STRING)  AS  Cr_Line_Ind,
	SAFE_CAST(Cust_Cap  AS  NUMERIC)  AS  Cust_Cap,
	SAFE_CAST(Dealer_Code  AS  STRING)  AS  Dealer_Code,
	SAFE_CAST(Dealer_Comm_Pct  AS  NUMERIC)  AS  Dealer_Comm_Pct,
	SAFE_CAST(Dealer_Guarantee_Ind  AS  STRING)  AS  Dealer_Guarantee_Ind,
	SAFE_CAST(Dsr_Val  AS  NUMERIC)  AS  Dsr_Val,
	SAFE_CAST(Dsr2_Val  AS  NUMERIC)  AS  Dsr2_Val,
	SAFE_CAST(ETI  AS  NUMERIC)  AS  ETI,
	SAFE_CAST(Facility_Appl_Id  AS  STRING)  AS  Facility_Appl_Id,
	SAFE_CAST(Facility_Acct_Nbr  AS  STRING)  AS  Facility_Acct_Nbr,
	SAFE_CAST(Facility_Code  AS  STRING)  AS  Facility_Code,
	SAFE_CAST(Facility_Control_Fields  AS  STRING)  AS  Facility_Control_Fields,
	SAFE_CAST(Hire_Purchase_Ind  AS  STRING)  AS  Hire_Purchase_Ind,
	SAFE_CAST(HKMC_Prem_Type_Code  AS  STRING)  AS  HKMC_Prem_Type_Code,
	SAFE_CAST(Hkmc_Sale_Ind  AS  STRING)  AS  Hkmc_Sale_Ind,
	SAFE_CAST(Latest_Util_Amt  AS  NUMERIC)  AS  Latest_Util_Amt,
	SAFE_CAST(Ln_Appl_Id  AS  STRING)  AS  Ln_Appl_Id,
	SAFE_CAST(Ln_Acct_Nbr  AS  STRING)  AS  Ln_Acct_Nbr,
	SAFE_CAST(Ln_Control_Fields  AS  STRING)  AS  Ln_Control_Fields,
	SAFE_CAST(Ln_Ccy_Code  AS  STRING)  AS  Ln_Ccy_Code,
	SAFE_CAST(Ln_Collat_Ratio  AS  NUMERIC)  AS  Ln_Collat_Ratio,
	SAFE_CAST(Ln_Group_Code  AS  STRING)  AS  Ln_Group_Code,
	SAFE_CAST(Ln_Income_Ratio  AS  NUMERIC)  AS  Ln_Income_Ratio,
	SAFE_CAST(Ln_Net_Purchase_Ratio  AS  NUMERIC)  AS  Ln_Net_Purchase_Ratio,
	SAFE_CAST(Ln_Purchase_Ratio  AS  NUMERIC)  AS  Ln_Purchase_Ratio,
	SAFE_CAST(Ln_Use_Country  AS  STRING)  AS  Ln_Use_Country,
	SAFE_CAST(LTP  AS  NUMERIC)  AS  LTP,
	SAFE_CAST(Mail_Code  AS  STRING)  AS  Mail_Code,
	SAFE_CAST(Prod_Cap  AS  NUMERIC)  AS  Prod_Cap,
	SAFE_CAST(Project_Code  AS  STRING)  AS  Project_Code,
	SAFE_CAST(Promote_Code  AS  STRING)  AS  Promote_Code,
	SAFE_CAST(Purpose_of_Fin_Hkma  AS  STRING)  AS  Purpose_of_Fin_Hkma,
	SAFE_CAST(Seller_Name  AS  STRING)  AS  Seller_Name,
	SAFE_CAST(Solicitor_Code  AS  STRING)  AS  Solicitor_Code,
	SAFE_CAST(Tav1_Val  AS  NUMERIC)  AS  Tav1_Val,
	SAFE_CAST(Tav2_Val  AS  NUMERIC)  AS  Tav2_Val,
	SAFE_CAST(Tax_Amt  AS  NUMERIC)  AS  Tax_Amt,
	SAFE_CAST(Unlisted_Dealer_Ind  AS  STRING)  AS  Unlisted_Dealer_Ind,
	SAFE_CAST(Mortgage_Plan_Code  AS  STRING)  AS  Mortgage_Plan_Code,
	SAFE_CAST(Stressed_DSR_Actual_Tenor  AS  NUMERIC)  AS  Stressed_DSR_Actual_Tenor,
	SAFE_CAST(Stressed_DSR_Max_Tenor  AS  NUMERIC)  AS  Stressed_DSR_Max_Tenor,
	SAFE_CAST(Rise_Mortgage_Rate_Pct  AS  NUMERIC)  AS  Rise_Mortgage_Rate_Pct,
	SAFE_CAST(Max_Allow_Tenor  AS  NUMERIC)  AS  Max_Allow_Tenor,
	SAFE_CAST(Stressed_Test_Dte  AS  DATE)  AS  Stressed_Test_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Advance_Dte')}},
	{{validate_CountryCode('Ln_Use_Country')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Appl_Id,
	Appl_Nbr,
	Appl_Control_Fields,
	Appl_Ppsl_Seq_Nbr,
	Admin_Code,
	Advance_Dte,
	Agent_Code,
	Appl_Source,
	Apply_Ln_Amt,
	Apply_Nbr_Of_Insl,
	Aprov_Ln_Amt,
	Aprov_Nbr_Of_Insl,
	Asset_Class,
	Chrg_Code,
	Compliance_Result,
	Corr_Add,
	Cr_Facility_Ind,
	Cr_Line_Ind,
	Cust_Cap,
	Dealer_Code,
	Dealer_Comm_Pct,
	Dealer_Guarantee_Ind,
	Dsr_Val,
	Dsr2_Val,
	ETI,
	Facility_Appl_Id,
	Facility_Acct_Nbr,
	Facility_Code,
	Facility_Control_Fields,
	Hire_Purchase_Ind,
	HKMC_Prem_Type_Code,
	Hkmc_Sale_Ind,
	Latest_Util_Amt,
	Ln_Appl_Id,
	Ln_Acct_Nbr,
	Ln_Control_Fields,
	Ln_Ccy_Code,
	Ln_Collat_Ratio,
	Ln_Group_Code,
	Ln_Income_Ratio,
	Ln_Net_Purchase_Ratio,
	Ln_Purchase_Ratio,
	Ln_Use_Country,
	LTP,
	Mail_Code,
	Prod_Cap,
	Project_Code,
	Promote_Code,
	Purpose_of_Fin_Hkma,
	Seller_Name,
	Solicitor_Code,
	Tav1_Val,
	Tav2_Val,
	Tax_Amt,
	Unlisted_Dealer_Ind,
	Mortgage_Plan_Code,
	Stressed_DSR_Actual_Tenor,
	Stressed_DSR_Max_Tenor,
	Rise_Mortgage_Rate_Pct,
	Max_Allow_Tenor,
	Stressed_Test_Dte,
	{{  full_valid_flag(['__NoFutureDate_valid_Advance_Dte','__CountryCode_valid_Ln_Use_Country'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
