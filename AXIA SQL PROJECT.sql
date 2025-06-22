CREATE DATABASE Water_supply;
SELECT *FROM water_supply_sanitation_africa;
-- calculate average water availability (liters per capita per day) for each country
SELECT Country,
       ROUND(AVG (`Water Availability (liters per capita per day)`),0) AS avg_water_availability
FROM water_supply_sanitation_africa
GROUP BY Country;

-- Details of communities where at least one water point is non-functional.
SELECT Region, Country, Population,`community name`,`Number of Non-functional water points`
FROM water_supply_sanitation_africa
WHERE `Number of Non-functional water points`>0;

-- Top five communities with the highest annual sanitation maintenance costs.
SELECT Region, Country, `Community name`, `Annual Maintenance Cost (USD)`
FROM water_supply_sanitation_africa
ORDER BY `Annual Maintenance Cost (USD)` DESC
LIMIT 5;

-- Total number of functional and non-functional water points per country
SELECT Country,
	SUM(`Number of Functional Water Points`) AS Total_Functional_Water_Points,
    SUM(`Number of Non-Functional Water Points`) AS Total_Non_Functional_Water_Points
FROM water_supply_sanitation_africa
GROUP BY Country
ORDER BY Country;

-- Communities with a high incidence of waterborne diseases (>20%)
SELECT Region, Country, `Community name`, `Waterborne Diseases Incidence Rate (%)`
FROM water_supply_sanitation_africa
WHERE `Waterborne Diseases Incidence Rate (%)` > 20;
ORDER BY `Waterborne Diseases Incidence Rate (%)` DESC;

-- Average distance to the water source per region
SELECT DISTINCT(Region), `Average Distance to Water Source (Km)` 
FROM water_supply_sanitation_africa;

SELECT * FROM water_supply_sanitation_africa;

-- Communities that receive both government and NGO support
SELECT Region, Country, `Community name`, `Government Support`,`NGO Support`
FROM water_supply_sanitation_africa
WHERE `Government Support` = 'Yes' AND `NGO Support` = 'Yes';
SELECT Country,`community name`, MAX(Population)
FROM water_supply_sanitation_africa
GROUP BY Country;
