WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_irn_raq_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Doc_Nbr  AS  STRING)  AS  Doc_Nbr,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Sign_Dte  AS  DATE)  AS  Sign_Dte,
	SAFE_CAST(Sign_Time  AS  INT64)  AS  Sign_Time,
	SAFE_CAST(Blind_Ind  AS  STRING)  AS  Blind_Ind,
	SAFE_CAST(Br_Code  AS  STRING)  AS  Br_Code,
	SAFE_CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	SAFE_CAST(Display_Risk_Lvl  AS  STRING)  AS  Display_Risk_Lvl,
	SAFE_CAST(Dte_Of_Birth_Incorporation  AS  DATE)  AS  Dte_Of_Birth_Incorporation,
	SAFE_CAST(Education_Lvl  AS  STRING)  AS  Education_Lvl,
	SAFE_CAST(Impaired_Ind  AS  STRING)  AS  Impaired_Ind,
	SAFE_CAST(Mthly_Income  AS  STRING)  AS  Mthly_Income,
	SAFE_CAST(Quest_Ans  AS  STRING)  AS  Quest_Ans,
	SAFE_CAST(Quest_ID  AS  STRING)  AS  Quest_ID,
	SAFE_CAST(Quest_Type  AS  STRING)  AS  Quest_Type,
	SAFE_CAST(RAQ_Chnl  AS  STRING)  AS  RAQ_Chnl,
	SAFE_CAST(Real_Risk_Lvl  AS  STRING)  AS  Real_Risk_Lvl,
	SAFE_CAST(Risk_Status  AS  STRING)  AS  Risk_Status,
	SAFE_CAST(Risk_Tolerance_Lvl  AS  STRING)  AS  Risk_Tolerance_Lvl,
	SAFE_CAST(Total_Asset  AS  STRING)  AS  Total_Asset,
	SAFE_CAST(Version  AS  STRING)  AS  Version,
	SAFE_CAST(First_Vul_Cust  AS  STRING)  AS  First_Vul_Cust,
	SAFE_CAST(Final_Vul_Cust  AS  STRING)  AS  Final_Vul_Cust,
	SAFE_CAST(Disagree_Flag  AS  STRING)  AS  Disagree_Flag,
	SAFE_CAST(Disagree_Reason  AS  STRING)  AS  Disagree_Reason,
	SAFE_CAST(Observe_Impaired_Ind  AS  STRING)  AS  Observe_Impaired_Ind,
	SAFE_CAST(Party_Intl_Nbr  AS  STRING)  AS  Party_Intl_Nbr,
	SAFE_CAST(Trx_Linked_Ref  AS  STRING)  AS  Trx_Linked_Ref
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
