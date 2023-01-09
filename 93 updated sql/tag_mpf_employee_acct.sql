WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_mpf_employee_acct_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Appl_Id  AS  STRING)  AS  Appl_Id,
	SAFE_CAST(Control_Fields  AS  STRING)  AS  Control_Fields,
	SAFE_CAST(Broker_Code  AS  STRING)  AS  Broker_Code,
	SAFE_CAST(Classification_Code  AS  STRING)  AS  Classification_Code,
	SAFE_CAST(Employment_Dte  AS  DATE)  AS  Employment_Dte,
	SAFE_CAST(First_Aprov_Dte  AS  DATE)  AS  First_Aprov_Dte,
	SAFE_CAST(Industry_Code  AS  STRING)  AS  Industry_Code,
	SAFE_CAST(Mand_Plan_Commission_Code  AS  STRING)  AS  Mand_Plan_Commission_Code,
	SAFE_CAST(Mand_Trf_Plan_Commission_Code  AS  STRING)  AS  Mand_Trf_Plan_Commission_Code,
	SAFE_CAST(Member_Nature_Code  AS  STRING)  AS  Member_Nature_Code,
	SAFE_CAST(Nbr_Of_Fund_Choice_Chng  AS  NUMERIC)  AS  Nbr_Of_Fund_Choice_Chng,
	SAFE_CAST(Reg_Or_Casual_Employee_Ind  AS  STRING)  AS  Reg_Or_Casual_Employee_Ind,
	SAFE_CAST(Relevant_Income  AS  NUMERIC)  AS  Relevant_Income,
	SAFE_CAST(Skill_Type_Code  AS  STRING)  AS  Skill_Type_Code,
	SAFE_CAST(Trust_Type_Code  AS  STRING)  AS  Trust_Type_Code,
	SAFE_CAST(Volu_Plan_Commission_Code  AS  STRING)  AS  Volu_Plan_Commission_Code,
	SAFE_CAST(Volu_Trf_Plan_Commission_Code  AS  STRING)  AS  Volu_Trf_Plan_Commission_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_NoFutureDate('Employment_Dte')}},
	{{validate_Future_Date('First_Aprov_Dte')}},
	{{validate_IndustryCode('Industry_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Acct_Nbr,
	Appl_Id,
	Control_Fields,
	Broker_Code,
	Classification_Code,
	Employment_Dte,
	First_Aprov_Dte,
	Industry_Code,
	Mand_Plan_Commission_Code,
	Mand_Trf_Plan_Commission_Code,
	Member_Nature_Code,
	Nbr_Of_Fund_Choice_Chng,
	Reg_Or_Casual_Employee_Ind,
	Relevant_Income,
	Skill_Type_Code,
	Trust_Type_Code,
	Volu_Plan_Commission_Code,
	Volu_Trf_Plan_Commission_Code,
	{{  full_valid_flag(['__NoFutureDate_valid_Employment_Dte','__Future_Date_valid_First_Aprov_Dte','__IndustryCode_valid_Industry_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
