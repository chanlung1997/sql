WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.IRN_RAQ_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Sign_Dte  AS  DATE)  AS  Sign_Dte,
	CAST(Sign_Time  AS  INT64)  AS  Sign_Time,
	CAST(Blind_Ind  AS  STRING)  AS  Blind_Ind,
	CAST(Br_Code  AS  STRING)  AS  Br_Code,
	CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	CAST(Disagree_Flag  AS  STRING)  AS  Disagree_Flag,
	CAST(Disagree_Reason  AS  STRING)  AS  Disagree_Reason,
	CAST(Display_Risk_Lvl  AS  STRING)  AS  Display_Risk_Lvl,
	CAST(Dte_Of_Birth_Incorporation  AS  DATE)  AS  Dte_Of_Birth_Incorporation,
	CAST(Education_Lvl  AS  STRING)  AS  Education_Lvl,
	CAST(First_Vul_Cust  AS  STRING)  AS  First_Vul_Cust,
	CAST(Final_Vul_Cust  AS  STRING)  AS  Final_Vul_Cust,
	CAST(Impaired_Ind  AS  STRING)  AS  Impaired_Ind,
	CAST(Mthly_Income  AS  STRING)  AS  Mthly_Income,
	CAST(Observe_Impaired_Ind  AS  STRING)  AS  Observe_Impaired_Ind,
	CAST(Party_Intl_Nbr  AS  STRING)  AS  Party_Intl_Nbr,
	CAST(Quest_Ans  AS  STRING)  AS  Quest_Ans,
	CAST(Quest_ID  AS  STRING)  AS  Quest_ID,
	CAST(Quest_Type  AS  STRING)  AS  Quest_Type,
	CAST(RAQ_Chnl  AS  STRING)  AS  RAQ_Chnl,
	CAST(Real_Risk_Lvl  AS  STRING)  AS  Real_Risk_Lvl,
	CAST(Risk_Status  AS  STRING)  AS  Risk_Status,
	CAST(Risk_Tolerance_Lvl  AS  STRING)  AS  Risk_Tolerance_Lvl,
	CAST(Total_Asset  AS  STRING)  AS  Total_Asset
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
