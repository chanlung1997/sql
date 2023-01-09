WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_line_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Create_Dte  AS  DATE)  AS  Create_Dte,
	SAFE_CAST(Anl_Fee_Recv_Ind  AS  STRING)  AS  Anl_Fee_Recv_Ind,
	SAFE_CAST(Arrangement_Fee  AS  NUMERIC)  AS  Arrangement_Fee,
	SAFE_CAST(Auto_Suspend_Dte  AS  DATE)  AS  Auto_Suspend_Dte,
	SAFE_CAST(Cancel_Code  AS  STRING)  AS  Cancel_Code,
	SAFE_CAST(Cash_Rebate_End_Dte  AS  DATE)  AS  Cash_Rebate_End_Dte,
	SAFE_CAST(Closing_Bal_Amt  AS  NUMERIC)  AS  Closing_Bal_Amt,
	SAFE_CAST(Cr_Line_Close_Dte  AS  DATE)  AS  Cr_Line_Close_Dte,
	SAFE_CAST(Down_Grade_Dte  AS  DATE)  AS  Down_Grade_Dte,
	SAFE_CAST(Down_Status_Dte  AS  DATE)  AS  Down_Status_Dte,
	SAFE_CAST(Group_Nbr  AS  STRING)  AS  Group_Nbr,
	SAFE_CAST(Group_Nbr_Chng_Dte  AS  DATE)  AS  Group_Nbr_Chng_Dte,
	SAFE_CAST(Int_Rebate_End_Dte  AS  DATE)  AS  Int_Rebate_End_Dte,
	SAFE_CAST(Last_Review_Dte  AS  DATE)  AS  Last_Review_Dte,
	SAFE_CAST(Limit_Status_Code  AS  STRING)  AS  Limit_Status_Code,
	SAFE_CAST(Min_Pay_Waive_Ind  AS  STRING)  AS  Min_Pay_Waive_Ind,
	SAFE_CAST(Next_Review_Dte  AS  DATE)  AS  Next_Review_Dte,
	SAFE_CAST(Privilage_Int_Rate_End_Dte  AS  DATE)  AS  Privilage_Int_Rate_End_Dte,
	SAFE_CAST(Privilage_Int_Rate_Ind  AS  STRING)  AS  Privilage_Int_Rate_Ind,
	SAFE_CAST(Repayment_Fee_Waive_Ind  AS  STRING)  AS  Repayment_Fee_Waive_Ind,
	SAFE_CAST(Repmt_In_Arrears_Amt  AS  NUMERIC)  AS  Repmt_In_Arrears_Amt,
	SAFE_CAST(Review_Code  AS  STRING)  AS  Review_Code,
	SAFE_CAST(Suspend_Code  AS  STRING)  AS  Suspend_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Create_Dte')}},
	{{validate_NoFutureDate('Auto_Suspend_Dte')}},
	{{validate_Future_Date('Cr_Line_Close_Dte')}},
	{{validate_NoFutureDate('Down_Grade_Dte')}},
	{{validate_NoFutureDate('Down_Status_Dte')}},
	{{validate_NoFutureDate('Group_Nbr_Chng_Dte')}},
	{{validate_NoFutureDate('Int_Rebate_End_Dte')}},
	{{validate_NoFutureDate('Last_Review_Dte')}},
	{{validate_Future_Date('Privilage_Int_Rate_End_Dte')}}
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
	Cancel_Code,
	Cash_Rebate_End_Dte,
	Closing_Bal_Amt,
	Cr_Line_Close_Dte,
	Down_Grade_Dte,
	Down_Status_Dte,
	Group_Nbr,
	Group_Nbr_Chng_Dte,
	Int_Rebate_End_Dte,
	Last_Review_Dte,
	Limit_Status_Code,
	Min_Pay_Waive_Ind,
	Next_Review_Dte,
	Privilage_Int_Rate_End_Dte,
	Privilage_Int_Rate_Ind,
	Repayment_Fee_Waive_Ind,
	Repmt_In_Arrears_Amt,
	Review_Code,
	Suspend_Code,
	{{  full_valid_flag(['__NoFutureDate_valid_Create_Dte','__NoFutureDate_valid_Auto_Suspend_Dte','__Future_Date_valid_Cr_Line_Close_Dte','__NoFutureDate_valid_Down_Grade_Dte','__NoFutureDate_valid_Down_Status_Dte','__NoFutureDate_valid_Group_Nbr_Chng_Dte','__NoFutureDate_valid_Int_Rebate_End_Dte','__NoFutureDate_valid_Last_Review_Dte','__Future_Date_valid_Privilage_Int_Rate_End_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
