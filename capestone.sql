--2.1 Quiz Funnel
SQL
Select *
 From survey
 Limit 10;
--2.2 Quiz Funnel
SQL
SELECT question, Count(Distinct user_id)
FROM survey
Group by question;
--3.1 Home Try- On Funnel
SQL
Select *
From quiz 
Limit 5;
Select *
From home_try_on
Limit 5;
Select *
From purchase
Limit 5;
--3.1.a Home Try- On Funnel
SQL
Select *
From quiz 
Limit 5;
--3.1.b Home Try- On Funnel
SQL
Select *
From home_try_on
Limit 5;
--3.1.c Home Try- On Funnel
SQL
Select *
From purchase
Limit 5;
--3.2 Home Try- On Funnel
SQL
SELECT DISTINCT q.user_id,
Case When h.user_id IS NOT NULL Then 'True' Else 'False' End AS is_home_try_on ,
h.number_of_pairs,
Case When p.user_id IS NOT NULL Then 'True' Else 'False' End AS is_purchase
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
LIMIT 10;
--3.3.a Home Try- On Funnel
SQL
WITH funnels AS (SELECT DISTINCT q.user_id,
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id)
SELECT Count (*) As 'quiz_rows', Sum (is_home_try_on), Sum(is_purchase) As 'num_purchase',
   1.0 * SUM(is_home_try_on) / COUNT(user_id) AS 'quiz_to_home_try_on',
   1.0 * SUM(is_purchase) / SUM(is_home_try_on) AS 'home_try_on_to_purchase'
FROM funnels;
--3.3.d Home Try- On Funnel
SQL
Select Style, Count(style)
From quiz
Group by style;
--3.3.e Home Try- On Funnel
SQL
Select model_name, Count(model_name)
From purchase
group by model_name;
Select style, model_name, Sum(price)
From purchase
Group by model_name;
