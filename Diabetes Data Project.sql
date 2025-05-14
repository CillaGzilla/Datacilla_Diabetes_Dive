-- 1. Count of diabetic vs non-diabetic
SELECT Outcome, COUNT(*) AS patient_count
FROM `diabetes dataset`
GROUP BY Outcome;

-- 2. Average glucose level by outcome
SELECT Outcome, ROUND(AVG(Glucose), 2) AS avg_glucose
FROM `diabetes dataset`
GROUP BY Outcome;

-- 3. Average BMI by outcome
SELECT Outcome, ROUND(AVG(BMI), 2) AS avg_bmi
FROM `diabetes dataset`
GROUP BY Outcome;

-- 4. Age distribution of diabetic patients
SELECT Age, COUNT(*) AS count
FROM `diabetes dataset`
WHERE Outcome = 1
GROUP BY Age
ORDER BY Age;

-- 5. High-risk group: Glucose > 150 and BMI > 35
SELECT COUNT(*) AS high_risk_count
FROM `diabetes dataset`
WHERE Glucose > 150 AND BMI > 35;
