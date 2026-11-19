/*
Question: What are the highest-paying skills for data engineers?
- Calculate median salary for each skill (more resistant to outliers).
- Focus on remote Data Engineer roles.
- Filter skills with significant demand (> 100 postings).
*/
SELECT
sd.skills,
ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
COUNT(jpf.*) AS demand_product
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE 
jpf.job_title_short = 'Data Engineer'
AND jpf.job_work_from_home = true
GROUP BY 
sd.skills
HAVING 
COUNT(jpf.*) > 100
ORDER BY 
median_salary DESC
LIMIT 25;

/*
Results:
┌────────────┬───────────────┬────────────────┐
│   skills   │ median_salary │ demand_product │
├────────────┼───────────────┼────────────────┤
│ rust       │      210000.0 │            232 │
│ terraform  │      184000.0 │           3248 │
│ golang     │      184000.0 │            912 │
│ spring     │      175500.0 │            364 │
│ neo4j      │      170000.0 │            277 │
│ gdpr       │      169616.0 │            582 │
│ zoom       │      168438.0 │            127 │
│ graphql    │      167500.0 │            445 │
│ mongo      │      162250.0 │            265 │
│ fastapi    │      157500.0 │            204 │
│ django     │      155000.0 │            265 │
│ bitbucket  │      155000.0 │            478 │
│ crystal    │      154224.0 │            129 │
│ c          │      151500.0 │            444 │
│ atlassian  │      151500.0 │            249 │
│ typescript │      151000.0 │            388 │
│ kubernetes │      150500.0 │           4202 │
│ ruby       │      150000.0 │            736 │
│ airflow    │      150000.0 │           9996 │
│ node       │      150000.0 │            179 │
│ css        │      150000.0 │            262 │
│ redis      │      149000.0 │            605 │
│ vmware     │      148798.0 │            136 │
│ ansible    │      148798.0 │            475 │
│ jupyter    │      147500.0 │            400 │
└────────────┴───────────────┴────────────────┘

Key Insights:
- Specialized/niche and infrastructure-heavy skills such as Rust ($210,000), Terraform ($184,000), and Go ($184,000) lead median compensation.
- High-demand foundational skills like SQL and Python do not appear in the top 25 by median salary because they span entry-to-senior roles.
- Airflow ($150,000; 9,996 postings) and Kubernetes ($150,500; 4,202 postings) stand out for combining strong pay with large job volume.
*/