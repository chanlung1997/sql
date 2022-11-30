WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.BONUS_PT_REDEMPTION_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	CAST(Order_Nbr  AS  STRING)  AS  Order_Nbr,
	CAST(Redemption_Dte  AS  DATE)  AS  Redemption_Dte,
	CAST(Seq_Nbr  AS  NUMERIC)  AS  Seq_Nbr,
	CAST(Amount_Used  AS  NUMERIC)  AS  Amount_Used,
	CAST(Merchandise_Nbr  AS  STRING)  AS  Merchandise_Nbr,
	CAST(Merchandise_Type_Code  AS  STRING)  AS  Merchandise_Type_Code,
	CAST(Points_Used  AS  NUMERIC)  AS  Points_Used,
	CAST(Redeem_Conf_Dte  AS  DATE)  AS  Redeem_Conf_Dte,
	CAST(Redeem_Conf_Ind  AS  STRING)  AS  Redeem_Conf_Ind,
	CAST(Redeem_Method_Code  AS  STRING)  AS  Redeem_Method_Code,
	CAST(Redeem_Qnty  AS  NUMERIC)  AS  Redeem_Qnty
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
	{{  aggregate_validation_columns(['__Max_len_10_valid_Order_Nbr','__NoFutureDate_valid_Redemption_Dte','__NoFutureDate_valid_Redeem_Conf_Dte','__01YN_valid_Redeem_Conf_Ind'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
