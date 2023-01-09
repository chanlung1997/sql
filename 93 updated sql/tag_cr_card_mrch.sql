WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_cr_card_mrch_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Mrch_Nbr  AS  STRING)  AS  Mrch_Nbr,
	SAFE_CAST(Mrch_Org_Nbr  AS  STRING)  AS  Mrch_Org_Nbr,
	SAFE_CAST(Add_Line_1  AS  STRING)  AS  Add_Line_1,
	SAFE_CAST(Add_Line_2  AS  STRING)  AS  Add_Line_2,
	SAFE_CAST(Add_Line_3  AS  STRING)  AS  Add_Line_3,
	SAFE_CAST(Add_Line_4  AS  STRING)  AS  Add_Line_4,
	SAFE_CAST(Bk_Code  AS  STRING)  AS  Bk_Code,
	SAFE_CAST(Contact_Name  AS  STRING)  AS  Contact_Name,
	SAFE_CAST(Dly_Refund_Limit  AS  NUMERIC)  AS  Dly_Refund_Limit,
	SAFE_CAST(Doc_Nbr  AS  STRING)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Introducing_Centre_Id  AS  STRING)  AS  Introducing_Centre_Id,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Last_Actv_Dte  AS  DATE)  AS  Last_Actv_Dte,
	SAFE_CAST(Last_Maint_Dte  AS  DATE)  AS  Last_Maint_Dte,
	SAFE_CAST(Mail_Ord_Ind  AS  STRING)  AS  Mail_Ord_Ind,
	SAFE_CAST(Mcc_Code_Master_Card  AS  STRING)  AS  Mcc_Code_Master_Card,
	SAFE_CAST(Mcc_Code_Visa_Card  AS  STRING)  AS  Mcc_Code_Visa_Card,
	SAFE_CAST(Mrch_Close_Dte  AS  DATE)  AS  Mrch_Close_Dte,
	SAFE_CAST(Mrch_Name  AS  STRING)  AS  Mrch_Name,
	SAFE_CAST(Mrch_Open_Dte  AS  DATE)  AS  Mrch_Open_Dte,
	SAFE_CAST(Mrch_Special_Remark_Code  AS  STRING)  AS  Mrch_Special_Remark_Code,
	SAFE_CAST(Mrch_Status_Code  AS  STRING)  AS  Mrch_Status_Code,
	SAFE_CAST(Phone_Nbr  AS  STRING)  AS  Phone_Nbr,
	SAFE_CAST(Phone_Extn  AS  STRING)  AS  Phone_Extn,
	SAFE_CAST(Pos_Capability  AS  STRING)  AS  Pos_Capability,
	SAFE_CAST(Pos_Mode_Code  AS  STRING)  AS  Pos_Mode_Code,
	SAFE_CAST(Processing_Centre_Id  AS  STRING)  AS  Processing_Centre_Id,
	SAFE_CAST(Processing_Offr_Id  AS  STRING)  AS  Processing_Offr_Id,
	SAFE_CAST(Prod_Id  AS  STRING)  AS  Prod_Id,
	SAFE_CAST(Projected_Mthly_Ticket  AS  NUMERIC)  AS  Projected_Mthly_Ticket,
	SAFE_CAST(Projected_Mthly_Volume  AS  NUMERIC)  AS  Projected_Mthly_Volume,
	SAFE_CAST(Referral_Offr_Id  AS  STRING)  AS  Referral_Offr_Id,
	SAFE_CAST(Sales_Rep_Code  AS  STRING)  AS  Sales_Rep_Code,
	SAFE_CAST(Seller_Id  AS  STRING)  AS  Seller_Id,
	SAFE_CAST(Trade_Name  AS  STRING)  AS  Trade_Name
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Last_Actv_Dte')}},
	{{validate_NoFutureDate('Last_Maint_Dte')}},
	{{validate_Future_Date('Mrch_Close_Dte')}},
	{{validate_NoFutureDate('Mrch_Open_Dte')}},
	{{validate_Phone('Phone_Nbr')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Mrch_Nbr,
	Mrch_Org_Nbr,
	Add_Line_1,
	Add_Line_2,
	Add_Line_3,
	Add_Line_4,
	Bk_Code,
	Contact_Name,
	Dly_Refund_Limit,
	Doc_Nbr,
	Doc_Type_Code,
	Introducing_Centre_Id,
	Issue_Country_Code,
	Last_Actv_Dte,
	Last_Maint_Dte,
	Mail_Ord_Ind,
	Mcc_Code_Master_Card,
	Mcc_Code_Visa_Card,
	Mrch_Close_Dte,
	Mrch_Name,
	Mrch_Open_Dte,
	Mrch_Special_Remark_Code,
	Mrch_Status_Code,
	Phone_Nbr,
	Phone_Extn,
	Pos_Capability,
	Pos_Mode_Code,
	Processing_Centre_Id,
	Processing_Offr_Id,
	Prod_Id,
	Projected_Mthly_Ticket,
	Projected_Mthly_Volume,
	Referral_Offr_Id,
	Sales_Rep_Code,
	Seller_Id,
	Trade_Name,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Last_Actv_Dte','__NoFutureDate_valid_Last_Maint_Dte','__Future_Date_valid_Mrch_Close_Dte','__NoFutureDate_valid_Mrch_Open_Dte','__Phone_valid_Phone_Nbr'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
