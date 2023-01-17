WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_card_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Card_Issue_Dte  AS  DATE)  AS  Card_Issue_Dte,
	SAFE_CAST(Card_Nbr  AS  INT64)  AS  Card_Nbr,
	SAFE_CAST(Card_Seq_Nbr  AS  STRING)  AS  Card_Seq_Nbr,
	SAFE_CAST(Expiry_Dte  AS  DATE)  AS  Expiry_Dte,
	SAFE_CAST(Actvn_Flag  AS  STRING)  AS  Actvn_Flag,
	SAFE_CAST(Card_Coll_Dte  AS  DATE)  AS  Card_Coll_Dte,
	SAFE_CAST(Coll_Dept_Id  AS  STRING)  AS  Coll_Dept_Id,
	SAFE_CAST(Coll_Division_Id  AS  STRING)  AS  Coll_Division_Id,
	SAFE_CAST(Coll_Org_Id  AS  STRING)  AS  Coll_Org_Id,
	SAFE_CAST(Coll_Section_Id  AS  STRING)  AS  Coll_Section_Id
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Card_Issue_Dte')}},
	{{validate_Future_Date('Expiry_Dte')}},
	{{validate_01YN('Actvn_Flag')}},
	{{validate_Future_Date('Card_Coll_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Card_Issue_Dte,
	Card_Nbr,
	Card_Seq_Nbr,
	Expiry_Dte,
	Actvn_Flag,
	Card_Coll_Dte,
	Coll_Dept_Id,
	Coll_Division_Id,
	Coll_Org_Id,
	Coll_Section_Id,
	{{  full_valid_flag(['__NoFutureDate_valid_Card_Issue_Dte','__Future_Date_valid_Expiry_Dte','__01YN_valid_Actvn_Flag','__Future_Date_valid_Card_Coll_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
