WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_indv_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  STRING)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Anl_Household_Income_Hke  AS  NUMERIC)  AS  Anl_Household_Income_Hke,
	SAFE_CAST(Car_Ind  AS  STRING)  AS  Car_Ind,
	SAFE_CAST(Check_Digit  AS  STRING)  AS  Check_Digit,
	SAFE_CAST(Customer_Type_Code  AS  STRING)  AS  Customer_Type_Code,
	SAFE_CAST(Citizenship  AS  STRING)  AS  Citizenship,
	SAFE_CAST(Dte_Of_Birth  AS  DATE)  AS  Dte_Of_Birth,
	SAFE_CAST(education_Code  AS  STRING)  AS  education_Code,
	SAFE_CAST(Flat_Owner_Ind  AS  STRING)  AS  Flat_Owner_Ind,
	SAFE_CAST(Gender_Code  AS  STRING)  AS  Gender_Code,
	SAFE_CAST(Given_Name  AS  STRING)  AS  Given_Name,
	SAFE_CAST(Has_Domestic_Helper_Ind  AS  STRING)  AS  Has_Domestic_Helper_Ind,
	SAFE_CAST(Investment_Amt_Per_Mth_Hke  AS  NUMERIC)  AS  Investment_Amt_Per_Mth_Hke,
	SAFE_CAST(Marital_Status  AS  STRING)  AS  Marital_Status,
	SAFE_CAST(Nationality  AS  STRING)  AS  Nationality,
	SAFE_CAST(Nbr_Of_Children  AS  INT64)  AS  Nbr_Of_Children,
	SAFE_CAST(Other_Name  AS  STRING)  AS  Other_Name,
	SAFE_CAST(Saving_Amt_Per_Mth_Hke  AS  NUMERIC)  AS  Saving_Amt_Per_Mth_Hke,
	SAFE_CAST(Smoker_Ind  AS  STRING)  AS  Smoker_Ind,
	SAFE_CAST(Surname  AS  STRING)  AS  Surname,
	SAFE_CAST(Title_Code  AS  STRING)  AS  Title_Code,
	SAFE_CAST(Acct_Under_S83_Ind  AS  STRING)  AS  Acct_Under_S83_Ind,
	SAFE_CAST(Ctl_S161ba_Ind  AS  STRING)  AS  Ctl_S161ba_Ind,
	SAFE_CAST(Residential_Type_Code  AS  STRING)  AS  Residential_Type_Code,
	SAFE_CAST(Residential_Expns_Per_Mth_Hke  AS  NUMERIC)  AS  Residential_Expns_Per_Mth_Hke,
	SAFE_CAST(Place_Of_Birth  AS  STRING)  AS  Place_Of_Birth,
	SAFE_CAST(Home_Country_Code  AS  STRING)  AS  Home_Country_Code,
	SAFE_CAST(Given_Name_Full  AS  STRING)  AS  Given_Name_Full,
	SAFE_CAST(Surname_Full  AS  STRING)  AS  Surname_Full
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Dte_Of_Birth')}},
	{{validate_GenderCode('Gender_Code')}},
	{{validate_MaritalStatus('Marital_Status')}},
	{{validate_TitleCode('Gender_Code','Title_Code')}},
	{{validate_CountryCode('Home_Country_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Anl_Household_Income_Hke,
	Car_Ind,
	Check_Digit,
	Customer_Type_Code,
	Citizenship,
	Dte_Of_Birth,
	education_Code,
	Flat_Owner_Ind,
	Gender_Code,
	Given_Name,
	Has_Domestic_Helper_Ind,
	Investment_Amt_Per_Mth_Hke,
	Marital_Status,
	Nationality,
	Nbr_Of_Children,
	Other_Name,
	Saving_Amt_Per_Mth_Hke,
	Smoker_Ind,
	Surname,
	Title_Code,
	Acct_Under_S83_Ind,
	Ctl_S161ba_Ind,
	Residential_Type_Code,
	Residential_Expns_Per_Mth_Hke,
	Place_Of_Birth,
	Home_Country_Code,
	Given_Name_Full,
	Surname_Full,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Dte_Of_Birth','__GenderCode_valid_Gender_Code','__MaritalStatus_valid_Marital_Status','__TitleCode_valid_Title_Code','__CountryCode_valid_Home_Country_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
