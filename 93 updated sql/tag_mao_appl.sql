WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_mao_appl_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	SAFE_CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	SAFE_CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	SAFE_CAST(Ref_Id  AS  STRING)  AS  Ref_Id,
	SAFE_CAST(Submit_Dte  AS  DATE)  AS  Submit_Dte,
	SAFE_CAST(Session_Id  AS  STRING)  AS  Session_Id,
	SAFE_CAST(Acct_Nbr  AS  INT64)  AS  Acct_Nbr,
	SAFE_CAST(Acct_Purpose  AS  STRING)  AS  Acct_Purpose,
	SAFE_CAST(Add_Proof_Ind  AS  STRING)  AS  Add_Proof_Ind,
	SAFE_CAST(API_Appl_ID  AS  STRING)  AS  API_Appl_ID,
	SAFE_CAST(API_Dte  AS  DATE)  AS  API_Dte,
	SAFE_CAST(API_Time  AS  STRING)  AS  API_Time,
	SAFE_CAST(API_TSP_ID  AS  STRING)  AS  API_TSP_ID,
	SAFE_CAST(Appl_Status  AS  STRING)  AS  Appl_Status,
	SAFE_CAST(Appl_Type  AS  STRING)  AS  Appl_Type,
	SAFE_CAST(ATM_Lang_Code  AS  STRING)  AS  ATM_Lang_Code,
	SAFE_CAST(China_Id_Proof_Ind  AS  STRING)  AS  China_Id_Proof_Ind,
	SAFE_CAST(Consent_Proof_Ind  AS  STRING)  AS  Consent_Proof_Ind,
	SAFE_CAST(Corr_Add_Country_Code  AS  STRING)  AS  Corr_Add_Country_Code,
	SAFE_CAST(Corr_Add_Line_1  AS  STRING)  AS  Corr_Add_Line_1,
	SAFE_CAST(Corr_Add_Line_2  AS  STRING)  AS  Corr_Add_Line_2,
	SAFE_CAST(Corr_Add_Line_3  AS  STRING)  AS  Corr_Add_Line_3,
	SAFE_CAST(Corr_Add_Line_4  AS  STRING)  AS  Corr_Add_Line_4,
	SAFE_CAST(Corr_Add_Type  AS  STRING)  AS  Corr_Add_Type,
	SAFE_CAST(Create_Dte  AS  DATE)  AS  Create_Dte,
	SAFE_CAST(CSS_Acct_Ind  AS  STRING)  AS  CSS_Acct_Ind,
	SAFE_CAST(CSS_Advice_Type_Code  AS  STRING)  AS  CSS_Advice_Type_Code,
	SAFE_CAST(CTP_Proof_Ind  AS  STRING)  AS  CTP_Proof_Ind,
	SAFE_CAST(Device_Id  AS  STRING)  AS  Device_Id,
	SAFE_CAST(Device_Model  AS  STRING)  AS  Device_Model,
	SAFE_CAST(Device_OS_Ver  AS  STRING)  AS  Device_OS_Ver,
	SAFE_CAST(Device_Platform  AS  STRING)  AS  Device_Platform,
	SAFE_CAST(DK_Training_Ind  AS  STRING)  AS  DK_Training_Ind,
	SAFE_CAST(DK_WorkExp_Ind  AS  STRING)  AS  DK_WorkExp_Ind,
	SAFE_CAST(Doc_Expiry_Dte  AS  DATE)  AS  Doc_Expiry_Dte,
	SAFE_CAST(DP_TradingExp_Ind  AS  STRING)  AS  DP_TradingExp_Ind,
	SAFE_CAST(Dte_Of_Birth  AS  DATE)  AS  Dte_Of_Birth,
	SAFE_CAST(Elect_Add  AS  STRING)  AS  Elect_Add,
	SAFE_CAST(Employer_Consent_Declar  AS  STRING)  AS  Employer_Consent_Declar,
	SAFE_CAST(Employer_Declar  AS  STRING)  AS  Employer_Declar,
	SAFE_CAST(Employer_Name  AS  STRING)  AS  Employer_Name,
	SAFE_CAST(Employment_Code  AS  STRING)  AS  Employment_Code,
	SAFE_CAST(Exit_Page  AS  STRING)  AS  Exit_Page,
	SAFE_CAST(FATCA_Ind  AS  STRING)  AS  FATCA_Ind,
	SAFE_CAST(Fin_Status_Q1  AS  STRING)  AS  Fin_Status_Q1,
	SAFE_CAST(Fin_Status_Q2  AS  STRING)  AS  Fin_Status_Q2,
	SAFE_CAST(Fin_Status_Q3  AS  STRING)  AS  Fin_Status_Q3,
	SAFE_CAST(Fin_Status_Q4  AS  STRING)  AS  Fin_Status_Q4,
	SAFE_CAST(Fin_Status_Q5  AS  STRING)  AS  Fin_Status_Q5,
	SAFE_CAST(Fin_Status_Q6  AS  STRING)  AS  Fin_Status_Q6,
	SAFE_CAST(Fin_Status_Q6_Remark  AS  STRING)  AS  Fin_Status_Q6_Remark,
	SAFE_CAST(Fin_Status_Q7  AS  STRING)  AS  Fin_Status_Q7,
	SAFE_CAST(Fin_Status_Q8  AS  STRING)  AS  Fin_Status_Q8,
	SAFE_CAST(GPS_Enabled  AS  STRING)  AS  GPS_Enabled,
	SAFE_CAST(GPS_Latitude  AS  STRING)  AS  GPS_Latitude,
	SAFE_CAST(GPS_Location  AS  STRING)  AS  GPS_Location,
	SAFE_CAST(GPS_Longitude  AS  STRING)  AS  GPS_Longitude,
	SAFE_CAST(HK_Perm_Resident  AS  STRING)  AS  HK_Perm_Resident,
	SAFE_CAST(HK_Tax_Resident  AS  STRING)  AS  HK_Tax_Resident,
	SAFE_CAST(HKID_Type_Code  AS  STRING)  AS  HKID_Type_Code,
	SAFE_CAST(Industry_Code  AS  STRING)  AS  Industry_Code,
	SAFE_CAST(IP_Addr  AS  STRING)  AS  IP_Addr,
	SAFE_CAST(Job_Position  AS  STRING)  AS  Job_Position,
	SAFE_CAST(Juris_Tax_Resident_1  AS  STRING)  AS  Juris_Tax_Resident_1,
	SAFE_CAST(Juris_Tax_Resident_2  AS  STRING)  AS  Juris_Tax_Resident_2,
	SAFE_CAST(Juris_Tax_Resident_3  AS  STRING)  AS  Juris_Tax_Resident_3,
	SAFE_CAST(Juris_Tax_Resident_4  AS  STRING)  AS  Juris_Tax_Resident_4,
	SAFE_CAST(Juris_Tax_Resident_5  AS  STRING)  AS  Juris_Tax_Resident_5,
	SAFE_CAST(LDS_Acct_Ind  AS  STRING)  AS  LDS_Acct_Ind,
	SAFE_CAST(Mobile_Phone_Country_Code  AS  STRING)  AS  Mobile_Phone_Country_Code,
	SAFE_CAST(Mobile_Phone_Nbr  AS  STRING)  AS  Mobile_Phone_Nbr,
	SAFE_CAST(Multi_Nationality  AS  STRING)  AS  Multi_Nationality,
	SAFE_CAST(Nationality  AS  STRING)  AS  Nationality,
	SAFE_CAST(Occup_Code  AS  STRING)  AS  Occup_Code,
	SAFE_CAST(Optout_3rd_Party_Gain  AS  STRING)  AS  Optout_3rd_Party_Gain,
	SAFE_CAST(Optout_Call  AS  STRING)  AS  Optout_Call,
	SAFE_CAST(Optout_DM  AS  STRING)  AS  Optout_DM,
	SAFE_CAST(Optout_Email  AS  STRING)  AS  Optout_Email,
	SAFE_CAST(Optout_SI  AS  STRING)  AS  Optout_SI,
	SAFE_CAST(Optout_SMS  AS  STRING)  AS  Optout_SMS,
	SAFE_CAST(Other_Tax_Resident  AS  STRING)  AS  Other_Tax_Resident,
	SAFE_CAST(Party_Chinese_Name  AS  STRING)  AS  Party_Chinese_Name,
	SAFE_CAST(Party_Name  AS  STRING)  AS  Party_Name,
	SAFE_CAST(PBK_Ref  AS  STRING)  AS  PBK_Ref,
	SAFE_CAST(Prefer_CN_Br_Code  AS  STRING)  AS  Prefer_CN_Br_Code,
	SAFE_CAST(Prefer_HK_Br_Code  AS  STRING)  AS  Prefer_HK_Br_Code,
	SAFE_CAST(Prod_Type  AS  STRING)  AS  Prod_Type,
	SAFE_CAST(Referral_Code  AS  STRING)  AS  Referral_Code,
	SAFE_CAST(Referrer_Code  AS  STRING)  AS  Referrer_Code,
	SAFE_CAST(Reject_Desc  AS  STRING)  AS  Reject_Desc,
	SAFE_CAST(Residential_Add_Line_1  AS  STRING)  AS  Residential_Add_Line_1,
	SAFE_CAST(Residential_Add_Line_2  AS  STRING)  AS  Residential_Add_Line_2,
	SAFE_CAST(Residential_Add_Line_3  AS  STRING)  AS  Residential_Add_Line_3,
	SAFE_CAST(Residential_Add_Line_4  AS  STRING)  AS  Residential_Add_Line_4,
	SAFE_CAST(Residential_Phone_Country_Code  AS  STRING)  AS  Residential_Phone_Country_Code,
	SAFE_CAST(Residential_Phone_Nbr  AS  STRING)  AS  Residential_Phone_Nbr,
	SAFE_CAST(Session_Dte  AS  DATE)  AS  Session_Dte,
	SAFE_CAST(Session_Time  AS  STRING)  AS  Session_Time,
	SAFE_CAST(Signature_Ind  AS  STRING)  AS  Signature_Ind,
	SAFE_CAST(Stmt_Type_Code  AS  STRING)  AS  Stmt_Type_Code,
	SAFE_CAST(Submit_Time  AS  STRING)  AS  Submit_Time,
	SAFE_CAST(Supp_Doc_Expiry_Dte  AS  DATE)  AS  Supp_Doc_Expiry_Dte,
	SAFE_CAST(Supp_Doc_Nbr  AS  INT64)  AS  Supp_Doc_Nbr,
	SAFE_CAST(Supp_Doc_Type_Code  AS  STRING)  AS  Supp_Doc_Type_Code,
	SAFE_CAST(Supp_Issue_Country_Code  AS  STRING)  AS  Supp_Issue_Country_Code,
	SAFE_CAST(TIN  AS  STRING)  AS  TIN,
	SAFE_CAST(TIN_Declar_1  AS  STRING)  AS  TIN_Declar_1,
	SAFE_CAST(TIN_Not_Provide_Reason_Code_1  AS  STRING)  AS  TIN_Not_Provide_Reason_Code_1,
	SAFE_CAST(TIN_Unable_Obtain_Reason_Remark_1  AS  STRING)  AS  TIN_Unable_Obtain_Reason_Remark_1,
	SAFE_CAST(TIN_2  AS  STRING)  AS  TIN_2,
	SAFE_CAST(TIN_Declar_2  AS  STRING)  AS  TIN_Declar_2,
	SAFE_CAST(TIN_Not_Provide_Reason_Code_2  AS  STRING)  AS  TIN_Not_Provide_Reason_Code_2,
	SAFE_CAST(TIN_Unable_Obtain_Reason_Remark_2  AS  STRING)  AS  TIN_Unable_Obtain_Reason_Remark_2,
	SAFE_CAST(TIN_3  AS  STRING)  AS  TIN_3,
	SAFE_CAST(TIN_Declar_3  AS  STRING)  AS  TIN_Declar_3,
	SAFE_CAST(TIN_Not_Provide_Reason_Code_3  AS  STRING)  AS  TIN_Not_Provide_Reason_Code_3,
	SAFE_CAST(TIN_Unable_Obtain_Reason_Remark_3  AS  STRING)  AS  TIN_Unable_Obtain_Reason_Remark_3,
	SAFE_CAST(TIN_4  AS  STRING)  AS  TIN_4,
	SAFE_CAST(TIN_Declar_4  AS  STRING)  AS  TIN_Declar_4,
	SAFE_CAST(TIN_Not_Provide_Reason_Code_4  AS  STRING)  AS  TIN_Not_Provide_Reason_Code_4,
	SAFE_CAST(TIN_Unable_Obtain_Reason_Remark_4  AS  STRING)  AS  TIN_Unable_Obtain_Reason_Remark_4,
	SAFE_CAST(TIN_5  AS  STRING)  AS  TIN_5,
	SAFE_CAST(TIN_Declar_5  AS  STRING)  AS  TIN_Declar_5,
	SAFE_CAST(TIN_Not_Provide_Reason_Code_5  AS  STRING)  AS  TIN_Not_Provide_Reason_Code_5,
	SAFE_CAST(TIN_Unable_Obtain_Reason_Remark_5  AS  STRING)  AS  TIN_Unable_Obtain_Reason_Remark_5,
	SAFE_CAST(Title_Desc  AS  STRING)  AS  Title_Desc,
	SAFE_CAST(Vul_Cust_Q1  AS  STRING)  AS  Vul_Cust_Q1,
	SAFE_CAST(Vul_Cust_Q2  AS  STRING)  AS  Vul_Cust_Q2,
	SAFE_CAST(Vul_Cust_Q3  AS  STRING)  AS  Vul_Cust_Q3,
	SAFE_CAST(Vul_Cust_Q4  AS  STRING)  AS  Vul_Cust_Q4,
	SAFE_CAST(Vul_Cust_Q5  AS  STRING)  AS  Vul_Cust_Q5,
	SAFE_CAST(Vul_Cust_Q6  AS  STRING)  AS  Vul_Cust_Q6,
	SAFE_CAST(Vul_Cust_Q7  AS  STRING)  AS  Vul_Cust_Q7,
	SAFE_CAST(Vul_Cust_Q8  AS  STRING)  AS  Vul_Cust_Q8,
	SAFE_CAST(Vul_Cust_Q9  AS  STRING)  AS  Vul_Cust_Q9
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	{{validate_HKID('Doc_Type_Code','Doc_Nbr')}},
	{{validate_DocTypeCode('Doc_Type_Code')}},
	{{validate_CountryCode('Issue_Country_Code')}},
	{{validate_NoFutureDate('Submit_Dte')}},
	{{validate_Max_len_14('Acct_Nbr')}},
	{{validate_NoFutureDate('API_Dte')}},
	{{validate_Appl_Type('Appl_Type')}},
	{{validate_CountryCode('Corr_Add_Country_Code')}},
	{{validate_Corr_Add_Type('Corr_Add_Type')}},
	{{validate_NoFutureDate('Create_Dte')}},
	{{validate_Future_Date('Doc_Expiry_Dte')}},
	{{validate_NoFutureDate('Dte_Of_Birth')}},
	{{validate_IndustryCode('Industry_Code')}},
	{{validate_PhoneCountryCode('Mobile_Phone_Country_Code')}},
	{{validate_Phone('Mobile_Phone_Nbr')}},
	{{validate_OccupCode('Occup_Code')}},
	{{validate_Email('Optout_Email')}},
	{{validate_PhoneCountryCode('Residential_Phone_Country_Code')}},
	{{validate_Phone('Residential_Phone_Nbr')}},
	{{validate_NoFutureDate('Session_Dte')}},
	{{validate_Future_Date('Supp_Doc_Expiry_Dte')}},
	{{validate_Max_len_16('Supp_Doc_Nbr')}},
	{{validate_CountryCode('Supp_Issue_Country_Code')}}
FROM  CTE_2 
),   
 
CTE_4  AS  ( 
SELECT
	Doc_Nbr,
	Doc_Type_Code,
	Issue_Country_Code,
	Ref_Id,
	Submit_Dte,
	Session_Id,
	Acct_Nbr,
	Acct_Purpose,
	Add_Proof_Ind,
	API_Appl_ID,
	API_Dte,
	API_Time,
	API_TSP_ID,
	Appl_Status,
	Appl_Type,
	ATM_Lang_Code,
	China_Id_Proof_Ind,
	Consent_Proof_Ind,
	Corr_Add_Country_Code,
	Corr_Add_Line_1,
	Corr_Add_Line_2,
	Corr_Add_Line_3,
	Corr_Add_Line_4,
	Corr_Add_Type,
	Create_Dte,
	CSS_Acct_Ind,
	CSS_Advice_Type_Code,
	CTP_Proof_Ind,
	Device_Id,
	Device_Model,
	Device_OS_Ver,
	Device_Platform,
	DK_Training_Ind,
	DK_WorkExp_Ind,
	Doc_Expiry_Dte,
	DP_TradingExp_Ind,
	Dte_Of_Birth,
	Elect_Add,
	Employer_Consent_Declar,
	Employer_Declar,
	Employer_Name,
	Employment_Code,
	Exit_Page,
	FATCA_Ind,
	Fin_Status_Q1,
	Fin_Status_Q2,
	Fin_Status_Q3,
	Fin_Status_Q4,
	Fin_Status_Q5,
	Fin_Status_Q6,
	Fin_Status_Q6_Remark,
	Fin_Status_Q7,
	Fin_Status_Q8,
	GPS_Enabled,
	GPS_Latitude,
	GPS_Location,
	GPS_Longitude,
	HK_Perm_Resident,
	HK_Tax_Resident,
	HKID_Type_Code,
	Industry_Code,
	IP_Addr,
	Job_Position,
	Juris_Tax_Resident_1,
	Juris_Tax_Resident_2,
	Juris_Tax_Resident_3,
	Juris_Tax_Resident_4,
	Juris_Tax_Resident_5,
	LDS_Acct_Ind,
	Mobile_Phone_Country_Code,
	Mobile_Phone_Nbr,
	Multi_Nationality,
	Nationality,
	Occup_Code,
	Optout_3rd_Party_Gain,
	Optout_Call,
	Optout_DM,
	Optout_Email,
	Optout_SI,
	Optout_SMS,
	Other_Tax_Resident,
	Party_Chinese_Name,
	Party_Name,
	PBK_Ref,
	Prefer_CN_Br_Code,
	Prefer_HK_Br_Code,
	Prod_Type,
	Referral_Code,
	Referrer_Code,
	Reject_Desc,
	Residential_Add_Line_1,
	Residential_Add_Line_2,
	Residential_Add_Line_3,
	Residential_Add_Line_4,
	Residential_Phone_Country_Code,
	Residential_Phone_Nbr,
	Session_Dte,
	Session_Time,
	Signature_Ind,
	Stmt_Type_Code,
	Submit_Time,
	Supp_Doc_Expiry_Dte,
	Supp_Doc_Nbr,
	Supp_Doc_Type_Code,
	Supp_Issue_Country_Code,
	TIN,
	TIN_Declar_1,
	TIN_Not_Provide_Reason_Code_1,
	TIN_Unable_Obtain_Reason_Remark_1,
	TIN_2,
	TIN_Declar_2,
	TIN_Not_Provide_Reason_Code_2,
	TIN_Unable_Obtain_Reason_Remark_2,
	TIN_3,
	TIN_Declar_3,
	TIN_Not_Provide_Reason_Code_3,
	TIN_Unable_Obtain_Reason_Remark_3,
	TIN_4,
	TIN_Declar_4,
	TIN_Not_Provide_Reason_Code_4,
	TIN_Unable_Obtain_Reason_Remark_4,
	TIN_5,
	TIN_Declar_5,
	TIN_Not_Provide_Reason_Code_5,
	TIN_Unable_Obtain_Reason_Remark_5,
	Title_Desc,
	Vul_Cust_Q1,
	Vul_Cust_Q2,
	Vul_Cust_Q3,
	Vul_Cust_Q4,
	Vul_Cust_Q5,
	Vul_Cust_Q6,
	Vul_Cust_Q7,
	Vul_Cust_Q8,
	Vul_Cust_Q9,
	{{  full_valid_flag(['__HKID_valid_Doc_Nbr','__DocTypeCode_valid_Doc_Type_Code','__CountryCode_valid_Issue_Country_Code','__NoFutureDate_valid_Submit_Dte','__Max_len_14_valid_Acct_Nbr','__NoFutureDate_valid_API_Dte','__Appl_Type_valid_Appl_Type','__CountryCode_valid_Corr_Add_Country_Code','__Corr_Add_Type_valid_Corr_Add_Type','__NoFutureDate_valid_Create_Dte','__Future_Date_valid_Doc_Expiry_Dte','__NoFutureDate_valid_Dte_Of_Birth','__IndustryCode_valid_Industry_Code','__PhoneCountryCode_valid_Mobile_Phone_Country_Code','__Phone_valid_Mobile_Phone_Nbr','__OccupCode_valid_Occup_Code','__Email_valid_Optout_Email','__PhoneCountryCode_valid_Residential_Phone_Country_Code','__Phone_valid_Residential_Phone_Nbr','__NoFutureDate_valid_Session_Dte','__Future_Date_valid_Supp_Doc_Expiry_Dte','__Max_len_16_valid_Supp_Doc_Nbr','__CountryCode_valid_Supp_Issue_Country_Code'])  }}
FROM  CTE_3)
 
SELECT  *  FROM  CTE_4
