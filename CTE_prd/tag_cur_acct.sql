WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cur_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  STRING)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Base_Rate_Loading  AS  NUMERIC)  AS  Base_Rate_Loading,
	SAFE_CAST(Chq_Book_Enable_Ind  AS  STRING)  AS  Chq_Book_Enable_Ind,
	SAFE_CAST(Limit_Status_Code  AS  STRING)  AS  Limit_Status_Code,
	SAFE_CAST(Od_Limit_Amt  AS  NUMERIC)  AS  Od_Limit_Amt,
	SAFE_CAST(Down_Grade_Dte  AS  DATE)  AS  Down_Grade_Dte,
	SAFE_CAST(Last_xxx_Od_Start_Dte  AS  DATE)  AS  Last_xxx_Od_Start_Dte,
	SAFE_CAST(Od_Limit_Close_Dte  AS  DATE)  AS  Od_Limit_Close_Dte,
	SAFE_CAST(Od_Limit_Open_Dte  AS  DATE)  AS  Od_Limit_Open_Dte,
	SAFE_CAST(Review_Dte  AS  DATE)  AS  Review_Dte,
	SAFE_CAST(Cancel_Code  AS  STRING)  AS  Cancel_Code,
	SAFE_CAST(Closing_Bal_Amt  AS  NUMERIC)  AS  Closing_Bal_Amt,
	SAFE_CAST(Int_Suspend_Ind  AS  STRING)  AS  Int_Suspend_Ind,
	SAFE_CAST(Int_Suspend_Dte  AS  DATE)  AS  Int_Suspend_Dte,
	SAFE_CAST(Last_Review_Dte  AS  DATE)  AS  Last_Review_Dte,
	SAFE_CAST(Min_Pay_Waive_Ind  AS  STRING)  AS  Min_Pay_Waive_Ind,
	SAFE_CAST(Next_Review_Dte  AS  DATE)  AS  Next_Review_Dte,
	SAFE_CAST(Od_Acct_Type  AS  STRING)  AS  Od_Acct_Type,
	SAFE_CAST(Od_Limit_Suspend_Dte  AS  DATE)  AS  Od_Limit_Suspend_Dte,
	SAFE_CAST(Special_Remark_Code  AS  STRING)  AS  Special_Remark_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Last_xxx_Od_Start_Dte')}},
	{{validate_Future_Date('Od_Limit_Close_Dte')}},
	{{validate_NoFutureDate('Od_Limit_Open_Dte')}},
	{{validate_NoFutureDate('Review_Dte')}},
	{{validate_NoFutureDate('Int_Suspend_Dte')}},
	{{validate_NoFutureDate('Last_Review_Dte')}},
	{{validate_NoFutureDate('Od_Limit_Suspend_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Base_Rate_Loading,
	Chq_Book_Enable_Ind,
	Limit_Status_Code,
	Od_Limit_Amt,
	Down_Grade_Dte,
	Last_xxx_Od_Start_Dte,
	Od_Limit_Close_Dte,
	Od_Limit_Open_Dte,
	Review_Dte,
	Cancel_Code,
	Closing_Bal_Amt,
	Int_Suspend_Ind,
	Int_Suspend_Dte,
	Last_Review_Dte,
	Min_Pay_Waive_Ind,
	Next_Review_Dte,
	Od_Acct_Type,
	Od_Limit_Suspend_Dte,
	Special_Remark_Code,
	{{  full_valid_flag(['__NoFutureDate_valid_Last_xxx_Od_Start_Dte','__Future_Date_valid_Od_Limit_Close_Dte','__NoFutureDate_valid_Od_Limit_Open_Dte','__NoFutureDate_valid_Review_Dte','__NoFutureDate_valid_Int_Suspend_Dte','__NoFutureDate_valid_Last_Review_Dte','__NoFutureDate_valid_Od_Limit_Suspend_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
