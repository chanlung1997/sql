WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_card_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Alternate_Block_Code  AS  STRING)  AS  Alternate_Block_Code,
	SAFE_CAST(Alternate_Block_Dte  AS  DATE)  AS  Alternate_Block_Dte,
	SAFE_CAST(Anl_Fee_Dte  AS  DATE)  AS  Anl_Fee_Dte,
	SAFE_CAST(B_Score  AS  INT64)  AS  B_Score,
	SAFE_CAST(Block_Code  AS  STRING)  AS  Block_Code,
	SAFE_CAST(Block_Reason_Code  AS  STRING)  AS  Block_Reason_Code,
	SAFE_CAST(Block_Trx_Dte  AS  DATE)  AS  Block_Trx_Dte,
	SAFE_CAST(Cancel_Reason_Code  AS  STRING)  AS  Cancel_Reason_Code,
	SAFE_CAST(Card_Holder_Doc_Nbr  AS  STRING)  AS  Card_Holder_Doc_Nbr,
	SAFE_CAST(Card_Function_Code  AS  STRING)  AS  Card_Function_Code,
	SAFE_CAST(Cis_Ind  AS  STRING)  AS  Cis_Ind,
	SAFE_CAST(Coll_Acct_Class  AS  STRING)  AS  Coll_Acct_Class,
	SAFE_CAST(Coll_Agency_Code  AS  STRING)  AS  Coll_Agency_Code,
	SAFE_CAST(Coll_Id  AS  STRING)  AS  Coll_Id,
	SAFE_CAST(Corp_Id  AS  STRING)  AS  Corp_Id,
	SAFE_CAST(Corr_Code  AS  STRING)  AS  Corr_Code,
	SAFE_CAST(Cr_Card_Fmly_Code  AS  STRING)  AS  Cr_Card_Fmly_Code,
	SAFE_CAST(Cr_Card_Intl_Cust_Id  AS  STRING)  AS  Cr_Card_Intl_Cust_Id,
	SAFE_CAST(Cr_Card_Segment_Code  AS  STRING)  AS  Cr_Card_Segment_Code,
	SAFE_CAST(DD_Pmt_Pct  AS  NUMERIC)  AS  DD_Pmt_Pct,
	SAFE_CAST(DD_Pmt_Type_Code  AS  STRING)  AS  DD_Pmt_Type_Code,
	SAFE_CAST(Delq_Ind  AS  STRING)  AS  Delq_Ind,
	SAFE_CAST(Donation_Code  AS  STRING)  AS  Donation_Code,
	SAFE_CAST(Due_Dte  AS  DATE)  AS  Due_Dte,
	SAFE_CAST(Fix_Pmt_Amt  AS  NUMERIC)  AS  Fix_Pmt_Amt,
	SAFE_CAST(Fr_Acct_Nbr  AS  INT64)  AS  Fr_Acct_Nbr,
	SAFE_CAST(High_Bal_Amt  AS  NUMERIC)  AS  High_Bal_Amt,
	SAFE_CAST(High_Bal_Amt_Hke  AS  NUMERIC)  AS  High_Bal_Amt_Hke,
	SAFE_CAST(High_Bal_Dte  AS  DATE)  AS  High_Bal_Dte,
	SAFE_CAST(Memb_Nbr  AS  STRING)  AS  Memb_Nbr,
	SAFE_CAST(Mthly_Donation_Amt  AS  NUMERIC)  AS  Mthly_Donation_Amt,
	SAFE_CAST(Noc_Ind  AS  STRING)  AS  Noc_Ind,
	SAFE_CAST(Over_Cr_Limit_Ind  AS  STRING)  AS  Over_Cr_Limit_Ind,
	SAFE_CAST(Pmt_Method_Code  AS  STRING)  AS  Pmt_Method_Code,
	SAFE_CAST(Pmt_Type_Code  AS  STRING)  AS  Pmt_Type_Code,
	SAFE_CAST(Posting_Acct_Nbr  AS  INT64)  AS  Posting_Acct_Nbr,
	SAFE_CAST(Posting_Appl_Id  AS  STRING)  AS  Posting_Appl_Id,
	SAFE_CAST(Posting_Control_Fields  AS  STRING)  AS  Posting_Control_Fields,
	SAFE_CAST(Posting_Flag_Code  AS  STRING)  AS  Posting_Flag_Code,
	SAFE_CAST(Prim_Card_Ind  AS  STRING)  AS  Prim_Card_Ind,
	SAFE_CAST(Reward_Plan_Code  AS  STRING)  AS  Reward_Plan_Code,
	SAFE_CAST(Special_Remark_Code  AS  STRING)  AS  Special_Remark_Code,
	SAFE_CAST(Stmt_Code  AS  STRING)  AS  Stmt_Code,
	SAFE_CAST(Stmt_Cycle_Day  AS  STRING)  AS  Stmt_Cycle_Day,
	SAFE_CAST(Sub_Block_Code  AS  STRING)  AS  Sub_Block_Code,
	SAFE_CAST(Supp_Card_Holder_Name  AS  STRING)  AS  Supp_Card_Holder_Name,
	SAFE_CAST(Tot_Due_Amt  AS  NUMERIC)  AS  Tot_Due_Amt
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Future_Date('Anl_Fee_Dte')}},
	{{validate_NoFutureDate('Block_Trx_Dte')}},
	{{validate_01YN('Cis_Ind')}},
	{{validate_01YN('Delq_Ind')}},
	{{validate_Future_Date('Due_Dte')}},
	{{validate_NoFutureDate('High_Bal_Dte')}},
	{{validate_01YN('Noc_Ind')}},
	{{validate_01YN('Over_Cr_Limit_Ind')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Alternate_Block_Code,
	Alternate_Block_Dte,
	Anl_Fee_Dte,
	B_Score,
	Block_Code,
	Block_Reason_Code,
	Block_Trx_Dte,
	Cancel_Reason_Code,
	Card_Holder_Doc_Nbr,
	Card_Function_Code,
	Cis_Ind,
	Coll_Acct_Class,
	Coll_Agency_Code,
	Coll_Id,
	Corp_Id,
	Corr_Code,
	Cr_Card_Fmly_Code,
	Cr_Card_Intl_Cust_Id,
	Cr_Card_Segment_Code,
	DD_Pmt_Pct,
	DD_Pmt_Type_Code,
	Delq_Ind,
	Donation_Code,
	Due_Dte,
	Fix_Pmt_Amt,
	Fr_Acct_Nbr,
	High_Bal_Amt,
	High_Bal_Amt_Hke,
	High_Bal_Dte,
	Memb_Nbr,
	Mthly_Donation_Amt,
	Noc_Ind,
	Over_Cr_Limit_Ind,
	Pmt_Method_Code,
	Pmt_Type_Code,
	Posting_Acct_Nbr,
	Posting_Appl_Id,
	Posting_Control_Fields,
	Posting_Flag_Code,
	Prim_Card_Ind,
	Reward_Plan_Code,
	Special_Remark_Code,
	Stmt_Code,
	Stmt_Cycle_Day,
	Sub_Block_Code,
	Supp_Card_Holder_Name,
	Tot_Due_Amt,
	{{  full_valid_flag(['__Future_Date_valid_Anl_Fee_Dte','__NoFutureDate_valid_Block_Trx_Dte','__01YN_valid_Cis_Ind','__01YN_valid_Delq_Ind','__Future_Date_valid_Due_Dte','__NoFutureDate_valid_High_Bal_Dte','__01YN_valid_Noc_Ind','__01YN_valid_Over_Cr_Limit_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
