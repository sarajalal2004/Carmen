-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.
SELECT code, name, region, population FROM country where population in (Select MIN(population) from country GROUP BY region Having region like 'Southern Europe');

--  code |             name              |     region      | population
-- ------+-------------------------------+-----------------+------------
--  VAT  | Holy See (Vatican City State) | Southern Europe |       1000



