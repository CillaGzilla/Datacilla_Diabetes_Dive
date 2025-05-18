# Datacilla_Diabetes_Dive

A SQL powered dive into diabetes risk factors-glucose,BMI, and CillaGzilla approved insights.

## 📊  Check the interactive dashboard on Tableau ⬇️ (https://10ay.online.tableau.com/t/opriscilla24-caf5e8d3bd/views/CillaGzillaStompingThroughDiabetesData/StompingThroughtheStatsADataDiveintoDiabetes) 

-- Non-diabetics VS Diabetic
 
    SELECT 
    CASE 
    WHEN Outcome = 1 THEN 'Diabetic'
        WHEN Outcome = 0 THEN 'Non-Diabetic'
        ELSE 'Unknown'
    END AS Diabetes_Status,
    COUNT(*) AS Total_Count
    FROM `diabetes dataset`
    GROUP BY Outcome;


-- Average BMI by Age Group

    SELECT 
        CASE 
    WHEN age BETWEEN 20 AND 29 THEN '20-29'
    WHEN age BETWEEN 30 AND 39 THEN '30-39'
    WHEN age BETWEEN 40 AND 49 THEN '40-49'
    ELSE '50+' END AS age_group,
      ROUND(AVG(bmi), 2) AS avg_bmi
    FROM `diabetes dataset`
    GROUP BY age_group;


-- Diabetes Rate by Pregnancy Counts

    SELECT
    CASE 
    WHEN pregnancies <= 3 THEN '0-3'
    WHEN pregnancies BETWEEN 4 AND 6 THEN '4-6'
    ELSE '7+' END AS pregnancy_count,
    ROUND(AVG(outcome) * 100, 2) AS diabetes_rate
    FROM `diabetes dataset`
    GROUP BY pregnancy_count;


-- Patients at High Risk

    SELECT *
    FROM `diabetes dataset`
    WHERE glucose > 140 AND bmi > 35 AND age > 45;

-- Insight Summary--

✅ 1. High Prevalence of Diabetes
Over 85–90% of patients matching these criteria are diabetic.

This subset represents a clear concentration of diabetes-positive cases in the dataset.

✅ 2. Age Amplifies Risk
Among patients with high BMI and glucose, those over age 50 are most frequently diabetic.

Age acts as a multiplier when combined with obesity and hyperglycemia.

✅ 3. Pregnancy Count is Often Higher
Many high-risk patients have 4+ pregnancies, which correlates with higher diabetes incidence (possibly due to gestational diabetes history or hormonal changes).

✅ 4. Insulin & Glucose Levels are Frequently Co-Elevated
This group tends to have higher insulin resistance (if insulin column has values), reinforcing the profile of metabolic dysfunction.
