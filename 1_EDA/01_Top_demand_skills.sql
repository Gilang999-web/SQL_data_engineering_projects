/*
Question: What are the most in-demand skills for data engineers?
- Identify the top 10 in-demand skills for a data engineer.
- Focus on remote job postings.
- Why? Provides insights into the most valuable skills for job seekers.

*/
SELECT
sd.skills,
COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE 
jpf.job_title_short = 'Data Engineer'
AND job_work_from_home = true
GROUP BY sd.skills
ORDER BY demand_count DESC
LIMIT 10;

/*
Results:
┌────────────┬──────────────┐
│   skills   │ demand_count │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘

Key Insights:
- SQL (29,221) and Python (28,776) dominate remote Data Engineer demand by a wide margin.
- Cloud platforms (AWS, Azure, GCP) and distributed data processing/orchestration tools (Spark, Airflow, Snowflake, Databricks) form the core modern Data Engineering stack.
*/

