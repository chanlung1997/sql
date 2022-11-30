WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.ACCT_MTHLY_SUMMARY_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Cal_Mth  AS  STRING)  AS  Cal_Mth,
	CAST(Cal_Yr  AS  STRING)  AS  Cal_Yr,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Begin_Bal_Amt  AS  NUMERIC)  AS  Begin_Bal_Amt,
	CAST(Begin_Bal_Amt_Hke  AS  NUMERIC)  AS  Begin_Bal_Amt_Hke,
	CAST(Collat_Bal_Amt  AS  NUMERIC)  AS  Collat_Bal_Amt,
	CAST(Collat_Bal_Amt_Hke  AS  NUMERIC)  AS  Collat_Bal_Amt_Hke,
	CAST(Dep_Acct_Ind  AS  STRING)  AS  Dep_Acct_Ind,
	CAST(High_Bal_Amt  AS  NUMERIC)  AS  High_Bal_Amt,
	CAST(High_Bal_Amt_Hke  AS  NUMERIC)  AS  High_Bal_Amt_Hke,
	CAST(Ln_Acct_Ind  AS  STRING)  AS  Ln_Acct_Ind,
	CAST(Low_Bal_Amt  AS  NUMERIC)  AS  Low_Bal_Amt,
	CAST(Low_Bal_Amt_Hke  AS  NUMERIC)  AS  Low_Bal_Amt_Hke,
	CAST(Mtd_Comt_Fee_Amt  AS  NUMERIC)  AS  Mtd_Comt_Fee_Amt,
	CAST(Mtd_Comt_Fee_Amt_Hke  AS  NUMERIC)  AS  Mtd_Comt_Fee_Amt_Hke,
	CAST(Mtd_Cr_Int_Amt  AS  NUMERIC)  AS  Mtd_Cr_Int_Amt,
	CAST(Mtd_Cr_Int_Amt_Hke  AS  NUMERIC)  AS  Mtd_Cr_Int_Amt_Hke,
	CAST(Mtd_Dr_Int_Amt  AS  NUMERIC)  AS  Mtd_Dr_Int_Amt,
	CAST(Mtd_Dr_Int_Amt_Hke  AS  NUMERIC)  AS  Mtd_Dr_Int_Amt_Hke,
	CAST(Mthly_Avg_Bal_Amt  AS  NUMERIC)  AS  Mthly_Avg_Bal_Amt,
	CAST(Mthly_Avg_Bal_Amt_Hke  AS  NUMERIC)  AS  Mthly_Avg_Bal_Amt_Hke,
	CAST(Mthly_Highest_Daily_Cr_Amt  AS  NUMERIC)  AS  Mthly_Highest_Daily_Cr_Amt,
	CAST(Mthly_Highest_Daily_Cr_Amt_Hke  AS  NUMERIC)  AS  Mthly_Highest_Daily_Cr_Amt_Hke,
	CAST(Mthly_Highest_Daily_Dr_Amt  AS  NUMERIC)  AS  Mthly_Highest_Daily_Dr_Amt,
	CAST(Mthly_Highest_Daily_Dr_Amt_Hke  AS  NUMERIC)  AS  Mthly_Highest_Daily_Dr_Amt_Hke,
	CAST(Tax_Grs_Up_Amt  AS  NUMERIC)  AS  Tax_Grs_Up_Amt,
	CAST(Tax_Grs_Up_Amt_Hke  AS  NUMERIC)  AS  Tax_Grs_Up_Amt_Hke,
	CAST(Tot_Cr_Cnt  AS  NUMERIC)  AS  Tot_Cr_Cnt,
	CAST(Tot_Dr_Cnt  AS  NUMERIC)  AS  Tot_Dr_Cnt,
	CAST(Tot_Fee_Coll  AS  NUMERIC)  AS  Tot_Fee_Coll,
	CAST(Tot_Non_Fin_Cnt  AS  NUMERIC)  AS  Tot_Non_Fin_Cnt,
	CAST(Tot_Rel_Bal_Amt_Hke  AS  NUMERIC)  AS  Tot_Rel_Bal_Amt_Hke,
	CAST(Tot_Security_Trx_Amt  AS  NUMERIC)  AS  Tot_Security_Trx_Amt
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
	{{  aggregate_validation_columns(['__01YN_valid_Dep_Acct_Ind','__01YN_valid_Ln_Acct_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
