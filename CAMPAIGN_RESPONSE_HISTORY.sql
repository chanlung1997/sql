WITH CTE_1 AS (
SELECT 
    *
FROM gcp-prj-dat-bigquery-env-00.bqd_015_raw.CAMPAIGN_RESPONSE_HISTORY_raw
),

CTE_2 AS (
SELECT 
    CAST(Batch_Dte AS DATE) AS Batch_Dte,
    CAST(Doc_Nbr AS INT64) AS Doc_Nbr,
    CAST(Doc_Type_Code AS STRING) AS Doc_Type_Code,
    CAST(Issue_Country_Code AS STRING) AS Issue_Country_Code,
    CAST(Party_Type AS STRING) AS Party_Type,
    CAST(Campaign_Id AS STRING) AS Campaign_Id,
    CAST(Version_Id AS INT64) AS Version_Id,
    CAST(Selection_Dte AS DATE) AS Selection_Dte,
    CAST(Cell_Id AS INT64) AS Cell_Id,
    CAST(Step_Id AS INT64) AS Step_Id,
    CAST(This_step_Dte AS DATE) AS This_step_Dte,
    CAST(Campaign_Class AS STRING) AS Campaign_Class,
    CAST(Party_Intl_Nbr AS STRING) AS Party_Intl_Nbr,
    CAST(Response_Dte AS DATE) AS Response_Dte,
    CAST(Response_Time AS INT64) AS Response_Time,
    CAST(Response_Code AS STRING) AS Response_Code,
    CAST(Call_Back_Dte AS DATE) AS Call_Back_Dte,
    CAST(Complaint_Code AS STRING) AS Complaint_Code,
    CAST(Complaint_Txt AS STRING) AS Complaint_Txt,
    CAST(More_Info_Code AS STRING) AS More_Info_Code,
    CAST(More_Info_Txt AS STRING) AS More_Info_Txt,
    CAST(Retry_Count AS STRING) AS Retry_Count,
    CAST(User_Data_Code AS STRING) AS User_Data_Code,
    CAST(User_Data_Txt AS STRING) AS User_Data_Txt,
    CAST(Agent_Id AS STRING) AS Agent_Id,
    CAST(Call_Back_Time AS STRING) AS Call_Back_Time,
    CAST(Call_Back_Phone AS STRING) AS Call_Back_Phone,
    CAST(Cim_Call_Back_Dte AS DATE) AS Cim_Call_Back_Dte
FROM CTE_1
),

CTE_3 AS (
SELECT 
    *,
    '' AS __full_load_valid
FROM CTE_2
)

SELECT * FROM CTE_3