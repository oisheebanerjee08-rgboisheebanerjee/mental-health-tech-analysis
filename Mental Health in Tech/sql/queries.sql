-- Query 1: Mental Health Distribution
SELECT mental_health, COUNT(*) as count,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM survey), 1) as percentage
FROM survey
GROUP BY mental_health
ORDER BY count DESC;

-- Query 2: Benefits Impact on Mental Health
SELECT benefits, mental_health, COUNT(*) as count
FROM survey
GROUP BY benefits, mental_health
ORDER BY benefits, count DESC;

-- Query 3: Top Countries by Respondents
SELECT country, COUNT(*) as total,
SUM(CASE WHEN mental_health = 'Yes' THEN 1 ELSE 0 END) as has_condition
FROM survey
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- Query 4: Mental Health by Age Group
SELECT 
CASE 
    WHEN age < 25 THEN 'Under 25'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    ELSE '45+'
END as age_group,
COUNT(*) as total,
SUM(CASE WHEN mental_health = 'Yes' THEN 1 ELSE 0 END) as has_condition
FROM survey
GROUP BY age_group
ORDER BY total DESC;

-- Query 5: Workplace Discussion Culture vs Mental Health Disclosure
SELECT mh_employer_discussion, mh_coworker_discussion,
COUNT(*) as total,
SUM(CASE WHEN mental_health = 'Yes' THEN 1 ELSE 0 END) as has_condition
FROM survey
GROUP BY mh_employer_discussion, mh_coworker_discussion
ORDER BY total DESC;