CREATE TABLE City (
 Id INT,
 Name VARCHAR(150),
 CountryCode VARCHAR(10)
);
CREATE TABLE Population (
 Id INT IDENTITY(1, 1),
 CityId INT,
 Population INT
);
CREATE TABLE CarAmount (
 Id INT IDENTITY(1, 1),
 CityId INT,
 Amount INT
);
--City
INSERT INTO City(Id, Name, CountryCode) VALUES (1, 'New York', 'USA');
INSERT INTO City(Id, Name, CountryCode) VALUES (2, 'Los Angeles', 'USA');
INSERT INTO City(Id, Name, CountryCode) VALUES (3, 'Chicago', 'USA');
INSERT INTO City(Id, Name, CountryCode) VALUES (4, 'Coral Springs', 'USA');
INSERT INTO City(Id, Name, CountryCode) VALUES (5, 'Arvada', 'USA');
INSERT INTO City(Id, Name, CountryCode) VALUES (6, 'Ann Arbor', 'USA');
INSERT INTO City(Id, Name, CountryCode) VALUES (7, 'Toronto', 'CN');
INSERT INTO City(Id, Name, CountryCode) VALUES (8, 'Kingston', 'CN');
INSERT INTO City(Id, Name, CountryCode) VALUES (9, 'Midland', 'CN');
--Population
INSERT INTO Population(CityId, Population) VALUES (1, 8468999);
INSERT INTO Population(CityId, Population) VALUES (2, 3822238);
INSERT INTO Population(CityId, Population) VALUES (3, 2665039);
INSERT INTO Population(CityId, Population) VALUES (4, 133369);
INSERT INTO Population(CityId, Population) VALUES (5, 121581);
INSERT INTO Population(CityId, Population) VALUES (6, 119900);
INSERT INTO Population(CityId, Population) VALUES (7, 5647656);
INSERT INTO Population(CityId, Population) VALUES (8, 128000);
INSERT INTO Population(CityId, Population) VALUES (9, 26246);
INSERT INTO CarAmount(CityId, Amount) VALUES (1, 2162191);
INSERT INTO CarAmount(CityId, Amount) VALUES (2, 1223211);
INSERT INTO CarAmount(CityId, Amount) VALUES (3, 1000039);
INSERT INTO CarAmount(CityId, Amount) VALUES (4, 55369);
INSERT INTO CarAmount(CityId, Amount) VALUES (5, 35581);
INSERT INTO CarAmount(CityId, Amount) VALUES (6, 44900);
INSERT INTO CarAmount(CityId, Amount) VALUES (7, 2643616);
INSERT INTO CarAmount(CityId, Amount) VALUES (8, 99010);
INSERT INTO CarAmount(CityId, Amount) VALUES (9, 5010)



SELECT c.Name
FROM City c
JOIN Population p ON c.Id = p.CityId
WHERE c.CountryCode = 'USA' AND p.Population > 130000;

SELECT TOP 1 c.Name
FROM City c
INNER JOIN Population p ON c.Id = p.CityId
WHERE c.CountryCode = 'CN'
ORDER BY p.Population ASC;

SELECT TOP 3 c.Name, p.Population
FROM City c
INNER JOIN Population p ON c.Id = p.CityId
ORDER BY p.Population DESC;

SELECT c.CountryCode, COUNT(*) AS NumberOfCities, SUM(p.Population) AS TotalPopulation
FROM City c
INNER JOIN Population p ON c.Id = p.CityId
GROUP BY c.CountryCode;

SELECT TOP 1 c.Name
FROM City c
INNER JOIN CarAmount ca ON c.Id = ca.CityId
ORDER BY ca.Amount DESC;

SELECT DISTINCT c.CountryCode
FROM City c
GROUP BY c.CountryCode
HAVING COUNT(*) > 2;
