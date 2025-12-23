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



-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

SELECT code, name, region, population FROM country WHERE region like 'Southern Europe' AND code NOT like 'VAT' AND code in (SELECT countrycode FROM countrylanguage where language like 'Italian' AND percentage = 100 GROUP BY  countrycode Having Count(language) = 1);

--  code |    name    |     region      | population
-- ------+------------+-----------------+------------
--  SMR  | San Marino | Southern Europe |      27000


-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

 SELECT name FROM city where countrycode like 'SMR' AND name NOT LIKE 'San Marino';

--     name
-- ------------
--  Serravalle


