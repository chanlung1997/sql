WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_line_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  STRING)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Create_Dte  AS  DATE)  AS  Create_Dte,
	SAFE_CAST(Anl_Fee_Recv_Ind  AS  STRING)  AS  Anl_Fee_Recv_Ind,
	SAFE_CAST(Arrangement_Fee  AS  NUMERIC)  AS  Arrangement_Fee,
	SAFE_CAST(Auto_Suspend_Dte  AS  DATE)  AS  Auto_Suspend_Dte,
	SAFE_CAST(Cr_Limit  AS  NUMERIC)  AS  Cr_Limit,
	SAFE_CAST(Down_Grade_Dte  AS  DATE)  AS  Down_Grade_Dte,
	SAFE_CAST(Down_Status_Dte  AS  DATE)  AS  Down_Status_Dte,
	SAFE_CAST(Dr_Int_Rate_Loading  AS  NUMERIC)  AS  Dr_Int_Rate_Loading,
	SAFE_CAST(Fix_Rate  AS  NUMERIC)  AS  Fix_Rate,
	SAFE_CAST(Fix_Rate_Ind  AS  STRING)  AS  Fix_Rate_Ind,
	SAFE_CAST(Group_Nbr_Chng_Dte  AS  DATE)  AS  Group_Nbr_Chng_Dte,
	SAFE_CAST(Last_Review_Dte  AS  DATE)  AS  Last_Review_Dte,
	SAFE_CAST(Limit_Status_Code  AS  STRING)  AS  Limit_Status_Code,
	SAFE_CAST(Next_Review_Dte  AS  DATE)  AS  Next_Review_Dte,
	SAFE_CAST(Privilage_Int_Rate_End_Dte  AS  DATE)  AS  Privilage_Int_Rate_End_Dte,
	SAFE_CAST(Privilage_Int_Rate_Ind  AS  STRING)  AS  Privilage_Int_Rate_Ind,
	SAFE_CAST(Repayment_Fee_Waive_Ind  AS  STRING)  AS  Repayment_Fee_Waive_Ind,
	SAFE_CAST(Review_Code  AS  STRING)  AS  Review_Code,
	SAFE_CAST(Suspend_Code  AS  STRING)  AS  Suspend_Code,
	SAFE_CAST(Cr_Line_Close_Dte  AS  DATE)  AS  Cr_Line_Close_Dte,
	SAFE_CAST(Cr_Line_Open_Dte  AS  DATE)  AS  Cr_Line_Open_Dte,
	SAFE_CAST(Repmt_In_Arrears_Amt  AS  NUMERIC)  AS  Repmt_In_Arrears_Amt,
	SAFE_CAST(Repmt_In_Arrears_Count  AS  NUMERIC)  AS  Repmt_In_Arrears_Count,
	SAFE_CAST(Suspend_Dte  AS  DATE)  AS  Suspend_Dte,
	SAFE_CAST(Tot_Dr_Int_Suspend  AS  NUMERIC)  AS  Tot_Dr_Int_Suspend,
	SAFE_CAST(Group_Nbr  AS  STRING)  AS  Group_Nbr,
	SAFE_CAST(cancel_code  AS  STRING)  AS  cancel_code,
	SAFE_CAST(cash_rebate_end_dte  AS  DATE)  AS  cash_rebate_end_dte,
	SAFE_CAST(closing_bal_amt  AS  NUMERIC)  AS  closing_bal_amt,
	SAFE_CAST(min_pay_waive_ind  AS  STRING)  AS  min_pay_waive_ind,
	SAFE_CAST(Int_Rebate_End_Dte  AS  DATE)  AS  Int_Rebate_End_Dte
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Create_Dte')}},
	{{validate_NoFutureDate('Auto_Suspend_Dte')}},
	{{validate_NoFutureDate('Down_Grade_Dte')}},
	{{validate_NoFutureDate('Down_Status_Dte')}},
	{{validate_NoFutureDate('Group_Nbr_Chng_Dte')}},
	{{validate_NoFutureDate('Last_Review_Dte')}},
	{{validate_Future_Date('Privilage_Int_Rate_End_Dte')}},
	{{validate_Future_Date('Cr_Line_Close_Dte')}},
	{{validate_NoFutureDate('Int_Rebate_End_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Create_Dte,
	Anl_Fee_Recv_Ind,
	Arrangement_Fee,
	Auto_Suspend_Dte,
	Cr_Limit,
	Down_Grade_Dte,
	Down_Status_Dte,
	Dr_Int_Rate_Loading,
	Fix_Rate,
	Fix_Rate_Ind,
	Group_Nbr_Chng_Dte,
	Last_Review_Dte,
	Limit_Status_Code,
	Next_Review_Dte,
	Privilage_Int_Rate_End_Dte,
	Privilage_Int_Rate_Ind,
	Repayment_Fee_Waive_Ind,
	Review_Code,
	Suspend_Code,
	Cr_Line_Close_Dte,
	Cr_Line_Open_Dte,
	Repmt_In_Arrears_Amt,
	Repmt_In_Arrears_Count,
	Suspend_Dte,
	Tot_Dr_Int_Suspend,
	Group_Nbr,
	cancel_code,
	cash_rebate_end_dte,
	closing_bal_amt,
	min_pay_waive_ind,
	Int_Rebate_End_Dte,
	{{  full_valid_flag(['__NoFutureDate_valid_Create_Dte','__NoFutureDate_valid_Auto_Suspend_Dte','__NoFutureDate_valid_Down_Grade_Dte','__NoFutureDate_valid_Down_Status_Dte','__NoFutureDate_valid_Group_Nbr_Chng_Dte','__NoFutureDate_valid_Last_Review_Dte','__Future_Date_valid_Privilage_Int_Rate_End_Dte','__Future_Date_valid_Cr_Line_Close_Dte','__NoFutureDate_valid_Int_Rebate_End_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
