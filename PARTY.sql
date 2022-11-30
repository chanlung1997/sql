WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.PARTY_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Bonus_Point  AS  INT64)  AS  Bonus_Point,
	CAST(Cis_Search_Dte  AS  DATE)  AS  Cis_Search_Dte,
	CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	CAST(Doc_Expiry_Dte  AS  DATE)  AS  Doc_Expiry_Dte,
	CAST(Doc_Issue_Dte  AS  DATE)  AS  Doc_Issue_Dte,
	CAST(Domicile_Oic  AS  STRING)  AS  Domicile_Oic,
	CAST(Has_Mortgage_Ind  AS  STRING)  AS  Has_Mortgage_Ind,
	CAST(Industry_Code  AS  STRING)  AS  Industry_Code,
	CAST(Party_Acct_Status_Code  AS  STRING)  AS  Party_Acct_Status_Code,
	CAST(Party_Chinese_Name  AS  STRING)  AS  Party_Chinese_Name,
	CAST(Party_Chinese_Name_Full  AS  STRING)  AS  Party_Chinese_Name_Full,
	CAST(Party_End_Dte  AS  DATE)  AS  Party_End_Dte,
	CAST(Party_Name  AS  STRING)  AS  Party_Name,
	CAST(Party_Name_Full  AS  STRING)  AS  Party_Name_Full,
	CAST(Party_Start_Dte  AS  DATE)  AS  Party_Start_Dte,
	CAST(Party_Type_Code  AS  STRING)  AS  Party_Type_Code,
	CAST(Referral_By_Ind  AS  STRING)  AS  Referral_By_Ind,
	CAST(Restricted_Cust  AS  STRING)  AS  Restricted_Cust,
	CAST(RO_Party_Id  AS  STRING)  AS  RO_Party_Id,
	CAST(Source_Chnl_Type_Code  AS  STRING)  AS  Source_Chnl_Type_Code
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
