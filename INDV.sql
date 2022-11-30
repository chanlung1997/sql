WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.INDV_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Anl_Household_Income_Hke  AS  NUMERIC)  AS  Anl_Household_Income_Hke,
	CAST(Car_Ind  AS  STRING)  AS  Car_Ind,
	CAST(Check_Digit  AS  STRING)  AS  Check_Digit,
	CAST(Citizenship  AS  STRING)  AS  Citizenship,
	CAST(Customer_Type_Code  AS  STRING)  AS  Customer_Type_Code,
	CAST(Dte_Of_Birth  AS  DATE)  AS  Dte_Of_Birth,
	CAST(education_Code  AS  STRING)  AS  education_Code,
	CAST(Flat_Owner_Ind  AS  STRING)  AS  Flat_Owner_Ind,
	CAST(Gender_Code  AS  STRING)  AS  Gender_Code,
	CAST(Given_Name  AS  STRING)  AS  Given_Name,
	CAST(Given_Name_Full  AS  STRING)  AS  Given_Name_Full,
	CAST(Has_Domestic_Helper_Ind  AS  STRING)  AS  Has_Domestic_Helper_Ind,
	CAST(Home_Country_Code  AS  STRING)  AS  Home_Country_Code,
	CAST(Investment_Amt_Per_Mth_Hke  AS  NUMERIC)  AS  Investment_Amt_Per_Mth_Hke,
	CAST(Marital_Status  AS  STRING)  AS  Marital_Status,
	CAST(Nationality  AS  STRING)  AS  Nationality,
	CAST(Nbr_Of_Children  AS  INT64)  AS  Nbr_Of_Children,
	CAST(Other_Name  AS  STRING)  AS  Other_Name,
	CAST(Place_Of_Birth  AS  STRING)  AS  Place_Of_Birth,
	CAST(Residential_Expns_Per_Mth_Hke  AS  NUMERIC)  AS  Residential_Expns_Per_Mth_Hke,
	CAST(Residential_Type_Code  AS  STRING)  AS  Residential_Type_Code,
	CAST(Saving_Amt_Per_Mth_Hke  AS  NUMERIC)  AS  Saving_Amt_Per_Mth_Hke,
	CAST(Smoker_Ind  AS  STRING)  AS  Smoker_Ind,
	CAST(Surname  AS  STRING)  AS  Surname,
	CAST(Surname_Full  AS  STRING)  AS  Surname_Full
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
