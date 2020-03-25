#Select all countries where population more than 10m people 
SELECT co.name, co.Population FROM world.country  co
where co.Population >10000000;

#Select all countries that have cities with population more than 5m people 
SELECT co.name FROM world.country  co
inner join world.city ci on co.code = ci.CountryCode
where ci.Population >5000000;

#Select all countries that speaking English 
SELECT co.name FROM world.country co
inner join world.countrylanguage cl on co.code = cl.CountryCode
where cl.Language like "English";

#Select all countries that have English as official language
SELECT co.name FROM world.country co
inner join world.countrylanguage cl on co.code = cl.CountryCode
where cl.Language like "English" and cl.IsOfficial like "T";

#Count how many people live on each continent
SELECT sum(co.Population), co.continent FROM world.country co
group by co.Continent;

#Select continents that having more than 1 billion people
SELECT sum(co.Population), co.continent FROM world.country co
group by co.Continent
having sum(co.Population) > 1000000000;