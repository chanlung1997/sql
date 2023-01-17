WITH  CTE_1  AS(   
SELECT 
	* 
FROM  gcp-prj-dat-bigquery-dev-00.bqd_015_raw.tag_ln_collat_ppty_raw 
),   
 
CTE_2  AS  ( 
SELECT
	SAFE_CAST(Collat_Seq_Nbr  AS  NUMERIC)  AS  Collat_Seq_Nbr,
	SAFE_CAST(Actual_Area_In_Sq_Ft  AS  NUMERIC)  AS  Actual_Area_In_Sq_Ft,
	SAFE_CAST(Actual_Area_In_Sq_M  AS  NUMERIC)  AS  Actual_Area_In_Sq_M,
	SAFE_CAST(Appraiser  AS  STRING)  AS  Appraiser,
	SAFE_CAST(Appurtenance  AS  STRING)  AS  Appurtenance,
	SAFE_CAST(Chrg_Code  AS  STRING)  AS  Chrg_Code,
	SAFE_CAST(Constr_Area_In_Sq_Ft  AS  NUMERIC)  AS  Constr_Area_In_Sq_Ft,
	SAFE_CAST(Constr_Area_In_Sq_M  AS  NUMERIC)  AS  Constr_Area_In_Sq_M,
	SAFE_CAST(Constr_Status  AS  STRING)  AS  Constr_Status,
	SAFE_CAST(Estate_Type_Code  AS  STRING)  AS  Estate_Type_Code,
	SAFE_CAST(GHOS_Court_Code  AS  STRING)  AS  GHOS_Court_Code,
	SAFE_CAST(GHOS_Phase_Code  AS  STRING)  AS  GHOS_Phase_Code,
	SAFE_CAST(Lease_Term  AS  NUMERIC)  AS  Lease_Term,
	SAFE_CAST(Lease_Term_Comm_Dte  AS  DATE)  AS  Lease_Term_Comm_Dte,
	SAFE_CAST(Lease_Term_Expiry_Dte  AS  DATE)  AS  Lease_Term_Expiry_Dte,
	SAFE_CAST(Lot_Remark  AS  STRING)  AS  Lot_Remark,
	SAFE_CAST(Market_Type_Code  AS  STRING)  AS  Market_Type_Code,
	SAFE_CAST(Occup_Permit_Dte  AS  DATE)  AS  Occup_Permit_Dte,
	SAFE_CAST(Ppty_Area  AS  STRING)  AS  Ppty_Area,
	SAFE_CAST(Ppty_Country_Code  AS  STRING)  AS  Ppty_Country_Code,
	SAFE_CAST(Ppty_District_Code  AS  STRING)  AS  Ppty_District_Code,
	SAFE_CAST(Ppty_Estate  AS  STRING)  AS  Ppty_Estate,
	SAFE_CAST(Ppty_Location  AS  STRING)  AS  Ppty_Location,
	SAFE_CAST(Ppty_Name  AS  STRING)  AS  Ppty_Name,
	SAFE_CAST(Ppty_Project  AS  STRING)  AS  Ppty_Project,
	SAFE_CAST(Ppty_Status  AS  STRING)  AS  Ppty_Status,
	SAFE_CAST(Ppty_Type_Code  AS  STRING)  AS  Ppty_Type_Code,
	SAFE_CAST(Ppty_Usage_Code  AS  STRING)  AS  Ppty_Usage_Code,
	SAFE_CAST(Rental_Assign_Ind  AS  STRING)  AS  Rental_Assign_Ind,
	SAFE_CAST(Undertaking_Type_Code  AS  STRING)  AS  Undertaking_Type_Code,
	SAFE_CAST(Vacant_Ind  AS  STRING)  AS  Vacant_Ind
FROM  CTE_1 
),   
 
CTE_3  AS  ( 
	SELECT   
	*,
	''  AS  __full_load_valid   
FROM  CTE_2 
)
 
SELECT  *  FROM  CTE_3
