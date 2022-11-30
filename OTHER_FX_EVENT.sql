WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-env-00.bqd_015_raw.OTHER_FX_EVENT_raw 
),   
 
CTE_2  AS  ( 
SELECT
	CAST(column_name  AS  bigquery_type)  AS  column_name,
	CAST(Event_Id  AS  STRING)  AS  Event_Id,
	CAST(Applicant_Add  AS  STRING)  AS  Applicant_Add,
	CAST(Applicant_Phone_Nbr  AS  STRING)  AS  Applicant_Phone_Nbr,
	CAST(Bank_Buy_Amt  AS  NUMERIC)  AS  Bank_Buy_Amt,
	CAST(Bank_Buy_Ccy_Code  AS  STRING)  AS  Bank_Buy_Ccy_Code,
	CAST(Bank_Sell_Amt  AS  NUMERIC)  AS  Bank_Sell_Amt,
	CAST(Bank_Sell_Ccy_Code  AS  STRING)  AS  Bank_Sell_Ccy_Code,
	CAST(Ccy_Pair  AS  STRING)  AS  Ccy_Pair,
	CAST(CNH_Rate_Ind  AS  STRING)  AS  CNH_Rate_Ind,
	CAST(Comm_Rate  AS  NUMERIC)  AS  Comm_Rate,
	CAST(Counter_Rate  AS  NUMERIC)  AS  Counter_Rate,
	CAST(Doc_Nbr  AS  INT64)  AS  Doc_Nbr,
	CAST(Doc_Type_Code  AS  STRING)  AS  Doc_Type_Code,
	CAST(Event_Amt  AS  NUMERIC)  AS  Event_Amt,
	CAST(Event_Amt_Hke  AS  NUMERIC)  AS  Event_Amt_Hke,
	CAST(Event_Ccy_Code  AS  STRING)  AS  Event_Ccy_Code,
	CAST(Issue_Country_Code  AS  STRING)  AS  Issue_Country_Code,
	CAST(Party_Name  AS  STRING)  AS  Party_Name,
	CAST(Payee_Name  AS  STRING)  AS  Payee_Name,
	CAST(Pmt_Method_Code  AS  STRING)  AS  Pmt_Method_Code,
	CAST(POF_Remarks  AS  STRING)  AS  POF_Remarks,
	CAST(Purpose_Of_Fund  AS  STRING)  AS  Purpose_Of_Fund,
	CAST(Rel_to_Acct_Hldr  AS  STRING)  AS  Rel_to_Acct_Hldr,
	CAST(Related_Acct_Nbr  AS  INT64)  AS  Related_Acct_Nbr,
	CAST(Related_Appl_Id  AS  STRING)  AS  Related_Appl_Id,
	CAST(Related_Control_Fields  AS  STRING)  AS  Related_Control_Fields,
	CAST(Source_Of_Fund  AS  STRING)  AS  Source_Of_Fund,
	CAST(Special_Rate  AS  NUMERIC)  AS  Special_Rate
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
