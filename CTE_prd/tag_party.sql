WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_party_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Bonus_Point  AS  INT64)  AS  Bonus_Point,
	SAFE_CAST(Cis_Search_Dte  AS  DATE)  AS  Cis_Search_Dte,
	SAFE_CAST(Create_By_Offr_Id  AS  STRING)  AS  Create_By_Offr_Id,
	SAFE_CAST(Doc_Expiry_Dte  AS  DATE)  AS  Doc_Expiry_Dte,
	SAFE_CAST(Doc_Issue_Dte  AS  DATE)  AS  Doc_Issue_Dte,
	SAFE_CAST(Domicile_Oic  AS  STRING)  AS  Domicile_Oic,
	SAFE_CAST(Has_Mortgage_Ind  AS  STRING)  AS  Has_Mortgage_Ind,
	SAFE_CAST(Industry_Code  AS  STRING)  AS  Industry_Code,
	SAFE_CAST(Party_Acct_Status_Code  AS  STRING)  AS  Party_Acct_Status_Code,
	SAFE_CAST(Party_Chinese_Name  AS  STRING)  AS  Party_Chinese_Name,
	SAFE_CAST(Party_Chinese_Name_Full  AS  STRING)  AS  Party_Chinese_Name_Full,
	SAFE_CAST(Party_End_Dte  AS  DATE)  AS  Party_End_Dte,
	SAFE_CAST(Party_Name  AS  STRING)  AS  Party_Name,
	SAFE_CAST(Party_Name_Full  AS  STRING)  AS  Party_Name_Full,
	SAFE_CAST(Party_Start_Dte  AS  DATE)  AS  Party_Start_Dte,
	SAFE_CAST(Party_Type_Code  AS  STRING)  AS  Party_Type_Code,
	SAFE_CAST(Referral_By_Ind  AS  STRING)  AS  Referral_By_Ind,
	SAFE_CAST(Restricted_Cust  AS  STRING)  AS  Restricted_Cust,
	SAFE_CAST(RO_Party_Id  AS  STRING)  AS  RO_Party_Id,
	SAFE_CAST(Source_Chnl_Type_Code  AS  STRING)  AS  Source_Chnl_Type_Code,
	SAFE_CAST(Universal_Cntl_Group_Ind  AS  STRING)  AS  Universal_Cntl_Group_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Cis_Search_Dte')}},
	{{validate_Future_Date('Doc_Expiry_Dte')}},
	{{validate_NoFutureDate('Doc_Issue_Dte')}},
	{{validate_IndustryCode('Industry_Code')}},
	{{validate_Future_Date('Party_End_Dte')}},
	{{validate_NoFutureDate('Party_Start_Dte')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Bonus_Point,
	Cis_Search_Dte,
	Create_By_Offr_Id,
	Doc_Expiry_Dte,
	Doc_Issue_Dte,
	Domicile_Oic,
	Has_Mortgage_Ind,
	Industry_Code,
	Party_Acct_Status_Code,
	Party_Chinese_Name,
	Party_Chinese_Name_Full,
	Party_End_Dte,
	Party_Name,
	Party_Name_Full,
	Party_Start_Dte,
	Party_Type_Code,
	Referral_By_Ind,
	Restricted_Cust,
	RO_Party_Id,
	Source_Chnl_Type_Code,
	Universal_Cntl_Group_Ind,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Cis_Search_Dte','__Future_Date_valid_Doc_Expiry_Dte','__NoFutureDate_valid_Doc_Issue_Dte','__IndustryCode_valid_Industry_Code','__Future_Date_valid_Party_End_Dte','__NoFutureDate_valid_Party_Start_Dte'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
