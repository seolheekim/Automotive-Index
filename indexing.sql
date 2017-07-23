CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user;

\c indexed_cars;

\i scripts/car_models.sql;
\i scripts/car_model_data.sql;

SELECT DISTINCT make_title FROM car_models WHERE make_code LIKE '%LAM%';
-- Time: 38.186 ms

SELECT DISTINCT model_title FROM car_models WHERE make_code LIKE '%NISSAN%' AND model_code LIKE '%GT-R%';
-- Time: 37.209 ms

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code LIKE '%LAM%';
-- Time: 34.759 ms

SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;
-- Time: 92.323 ms

SELECT * FROM car_models WHERE year = 2010;
-- Time: 46.201 ms


-- ********** WITH INDEXING ***********

CREATE INDEX index_one ON car_models(make_title) WHERE make_code LIKE '%LAM%';
SELECT DISTINCT make_title FROM car_models WHERE make_code LIKE '%LAM%';
--Time: 1.377 ms

CREATE INDEX index_two ON car_models(make_title) WHERE make_code LIKE '%NISSAN%' AND model_code LIKE '%GT-R%';
SELECT DISTINCT model_title FROM car_models WHERE make_code LIKE '%NISSAN%' AND model_code LIKE '%GT-R%';
--Time: 0.998 ms

CREATE INDEX index_three ON car_models(make_title) WHERE make_code LIKE '%LAM%';
SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code LIKE '%LAM%';
--Time: 2.119 ms

CREATE INDEX index_four ON car_models(make_title) WHERE year BETWEEN 2010 AND 2015;
SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;
--Time: 68.644 ms

CREATE INDEX index_five ON car_models(make_title) WHERE year = 2010;
SELECT * FROM car_models WHERE year = 2010;
--Time: 16.224 ms