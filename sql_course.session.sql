WITH number_of_postings AS ( 
  SELECT
    company_id,
    count(*) AS total_jobs
  FROM
    job_postings_fact
  GROUP BY
    company_id
)

SELECT
  name AS company_name,
  CASE
    WHEN total_jobs > 10 THEN 'small'
    WHEN total_jobs BETWEEN 10 AND 50 THEN 'medium'
    ELSE 'large'
  END AS company_size
FROM
  company_dim
LEFT JOIN number_of_postings ON number_of_postings.company_id = company_dim.company_id

