WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_acct_mthly_summary_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Cal_Mth  AS  STRING)  AS  Cal_Mth,
	SAFE_CAST(Cal_Yr  AS  STRING)  AS  Cal_Yr,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Begin_Bal_Amt  AS  NUMERIC)  AS  Begin_Bal_Amt,
	SAFE_CAST(Begin_Bal_Amt_Hke  AS  NUMERIC)  AS  Begin_Bal_Amt_Hke,
	SAFE_CAST(Collat_Bal_Amt  AS  NUMERIC)  AS  Collat_Bal_Amt,
	SAFE_CAST(Collat_Bal_Amt_Hke  AS  NUMERIC)  AS  Collat_Bal_Amt_Hke,
	SAFE_CAST(Dep_Acct_Ind  AS  STRING)  AS  Dep_Acct_Ind,
	SAFE_CAST(High_Bal_Amt  AS  NUMERIC)  AS  High_Bal_Amt,
	SAFE_CAST(High_Bal_Amt_Hke  AS  NUMERIC)  AS  High_Bal_Amt_Hke,
	SAFE_CAST(Ln_Acct_Ind  AS  STRING)  AS  Ln_Acct_Ind,
	SAFE_CAST(Low_Bal_Amt  AS  NUMERIC)  AS  Low_Bal_Amt,
	SAFE_CAST(Low_Bal_Amt_Hke  AS  NUMERIC)  AS  Low_Bal_Amt_Hke,
	SAFE_CAST(Mtd_Comt_Fee_Amt  AS  NUMERIC)  AS  Mtd_Comt_Fee_Amt,
	SAFE_CAST(Mtd_Comt_Fee_Amt_Hke  AS  NUMERIC)  AS  Mtd_Comt_Fee_Amt_Hke,
	SAFE_CAST(Mtd_Cr_Int_Amt  AS  NUMERIC)  AS  Mtd_Cr_Int_Amt,
	SAFE_CAST(Mtd_Cr_Int_Amt_Hke  AS  NUMERIC)  AS  Mtd_Cr_Int_Amt_Hke,
	SAFE_CAST(Mtd_Dr_Int_Amt  AS  NUMERIC)  AS  Mtd_Dr_Int_Amt,
	SAFE_CAST(Mtd_Dr_Int_Amt_Hke  AS  NUMERIC)  AS  Mtd_Dr_Int_Amt_Hke,
	SAFE_CAST(Mthly_Avg_Bal_Amt  AS  NUMERIC)  AS  Mthly_Avg_Bal_Amt,
	SAFE_CAST(Mthly_Avg_Bal_Amt_Hke  AS  NUMERIC)  AS  Mthly_Avg_Bal_Amt_Hke,
	SAFE_CAST(Mthly_Highest_Daily_Cr_Amt  AS  NUMERIC)  AS  Mthly_Highest_Daily_Cr_Amt,
	SAFE_CAST(Mthly_Highest_Daily_Cr_Amt_Hke  AS  NUMERIC)  AS  Mthly_Highest_Daily_Cr_Amt_Hke,
	SAFE_CAST(Mthly_Highest_Daily_Dr_Amt  AS  NUMERIC)  AS  Mthly_Highest_Daily_Dr_Amt,
	SAFE_CAST(Mthly_Highest_Daily_Dr_Amt_Hke  AS  NUMERIC)  AS  Mthly_Highest_Daily_Dr_Amt_Hke,
	SAFE_CAST(Tax_Grs_Up_Amt  AS  NUMERIC)  AS  Tax_Grs_Up_Amt,
	SAFE_CAST(Tax_Grs_Up_Amt_Hke  AS  NUMERIC)  AS  Tax_Grs_Up_Amt_Hke,
	SAFE_CAST(Tot_Cr_Cnt  AS  NUMERIC)  AS  Tot_Cr_Cnt,
	SAFE_CAST(Tot_Dr_Cnt  AS  NUMERIC)  AS  Tot_Dr_Cnt,
	SAFE_CAST(Tot_Fee_Coll  AS  NUMERIC)  AS  Tot_Fee_Coll,
	SAFE_CAST(Tot_Non_Fin_Cnt  AS  NUMERIC)  AS  Tot_Non_Fin_Cnt,
	SAFE_CAST(Tot_Rel_Bal_Amt_Hke  AS  NUMERIC)  AS  Tot_Rel_Bal_Amt_Hke,
	SAFE_CAST(Tot_Security_Trx_Amt  AS  NUMERIC)  AS  Tot_Security_Trx_Amt,
	SAFE_CAST(Tot_Security_Trx_Cnt  AS  NUMERIC)  AS  Tot_Security_Trx_Cnt
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_01YN('Dep_Acct_Ind')}},
	{{validate_01YN('Ln_Acct_Ind')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Cal_Mth,
	Cal_Yr,
	Control_Fields,
	Begin_Bal_Amt,
	Begin_Bal_Amt_Hke,
	Collat_Bal_Amt,
	Collat_Bal_Amt_Hke,
	Dep_Acct_Ind,
	High_Bal_Amt,
	High_Bal_Amt_Hke,
	Ln_Acct_Ind,
	Low_Bal_Amt,
	Low_Bal_Amt_Hke,
	Mtd_Comt_Fee_Amt,
	Mtd_Comt_Fee_Amt_Hke,
	Mtd_Cr_Int_Amt,
	Mtd_Cr_Int_Amt_Hke,
	Mtd_Dr_Int_Amt,
	Mtd_Dr_Int_Amt_Hke,
	Mthly_Avg_Bal_Amt,
	Mthly_Avg_Bal_Amt_Hke,
	Mthly_Highest_Daily_Cr_Amt,
	Mthly_Highest_Daily_Cr_Amt_Hke,
	Mthly_Highest_Daily_Dr_Amt,
	Mthly_Highest_Daily_Dr_Amt_Hke,
	Tax_Grs_Up_Amt,
	Tax_Grs_Up_Amt_Hke,
	Tot_Cr_Cnt,
	Tot_Dr_Cnt,
	Tot_Fee_Coll,
	Tot_Non_Fin_Cnt,
	Tot_Rel_Bal_Amt_Hke,
	Tot_Security_Trx_Amt,
	Tot_Security_Trx_Cnt,
	{{  full_valid_flag(['__01YN_valid_Dep_Acct_Ind','__01YN_valid_Ln_Acct_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
