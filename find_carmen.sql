-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.
SELECT code, name, region, population FROM country where population in (Select MIN(population) from country GROUP BY region Having region like 'Southern Europe');

--  code |             name              |     region      | population
-- ------+-------------------------------+-----------------+------------
--  VAT  | Holy See (Vatican City State) | Southern Europe |       1000



-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT countrycode, language, isofficial FROM countrylanguage WHERE countrycode like 'VAT' AND isofficial = true;

--  countrycode | language | isofficial
-- -------------+----------+------------
--  VAT         | Italian  | t




