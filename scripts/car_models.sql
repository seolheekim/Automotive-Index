-- db indexed_cars
CREATE INDEX index_one ON car_models(make_title) WHERE make_code LIKE '%LAM%';
CREATE INDEX index_two ON car_models(make_title) WHERE make_code LIKE '%NISSAN%' AND model_code LIKE '%GT-R%';
CREATE INDEX index_three ON car_models(make_title) WHERE make_code LIKE '%LAM%';
CREATE INDEX index_four ON car_models(make_title) WHERE year BETWEEN 2010 AND 2015;
CREATE INDEX index_five ON car_models(make_title) WHERE year = 2010;

CREATE TABLE IF NOT EXISTS car_models
(
 id serial,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL,
 year integer NOT NULL,
 PRIMARY KEY (id)
)
