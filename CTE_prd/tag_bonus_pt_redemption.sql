WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_bonus_pt_redemption_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Order_Nbr  AS  STRING)  AS  Order_Nbr,
	SAFE_CAST(Redemption_Dte  AS  DATE)  AS  Redemption_Dte,
	SAFE_CAST(Seq_Nbr  AS  NUMERIC)  AS  Seq_Nbr,
	SAFE_CAST(Amount_Used  AS  NUMERIC)  AS  Amount_Used,
	SAFE_CAST(Merchandise_Nbr  AS  STRING)  AS  Merchandise_Nbr,
	SAFE_CAST(Merchandise_Type_Code  AS  STRING)  AS  Merchandise_Type_Code,
	SAFE_CAST(Points_Used  AS  NUMERIC)  AS  Points_Used,
	SAFE_CAST(Redeem_Conf_Dte  AS  DATE)  AS  Redeem_Conf_Dte,
	SAFE_CAST(Redeem_Conf_Ind  AS  STRING)  AS  Redeem_Conf_Ind,
	SAFE_CAST(Redeem_Method_Code  AS  STRING)  AS  Redeem_Method_Code,
	SAFE_CAST(Redeem_Qnty  AS  NUMERIC)  AS  Redeem_Qnty
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_Max_len_10('Order_Nbr')}},
	{{validate_NoFutureDate('Redemption_Dte')}},
	{{validate_NoFutureDate('Redeem_Conf_Dte')}},
	{{validate_01YN('Redeem_Conf_Ind')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Order_Nbr,
	Redemption_Dte,
	Seq_Nbr,
	Amount_Used,
	Merchandise_Nbr,
	Merchandise_Type_Code,
	Points_Used,
	Redeem_Conf_Dte,
	Redeem_Conf_Ind,
	Redeem_Method_Code,
	Redeem_Qnty,
	{{  full_valid_flag(['__Max_len_10_valid_Order_Nbr','__NoFutureDate_valid_Redemption_Dte','__NoFutureDate_valid_Redeem_Conf_Dte','__01YN_valid_Redeem_Conf_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
