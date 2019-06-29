Exercise #1: Basic WHERE clauses

SELECT *
FROM airline_on_time_west_coast
LIMIT 100;

SELECT 
	flight_date,
	flight_num,
	carrier,
	origin
FROM airline_on_time_west_coast
WHERE origin = 'SEA'
LIMIT 100;

SELECT
	carrier,
	AVG(arrival_delay),
	flight_date
FROM airline_on_time_west_coast
WHERE flight_date BETWEEN '2014-12-01' AND '2014-12-31'
GROUP BY carrier, flight_date
ORDER BY carrier;

Exercise #2: Use WHERE with multiple conditions

SELECT 
	AVG(arrival_delay),
	MIN(arrival_delay),
	MAX(arrival_delay),
	origin_city_name,
	dest_city_name,
	carrier
FROM airline_on_time_west_coast
GROUP BY origin_city_name, dest_city_name, carrier;

SELECT 
	AVG(arrival_delay),
	MIN(arrival_delay),
	MAX(arrival_delay),
	origin_city_name,
	dest_city_name,
	carrier,
	origin
FROM airline_on_time_west_coast
WHERE origin IN ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
GROUP BY origin_city_name, dest_city_name, carrier, origin;

SELECT 
	AVG(arrival_delay),
	MIN(arrival_delay),
	MAX(arrival_delay),
	origin_city_name,
	dest_city_name,
	carrier
FROM airline_on_time_west_coast 
WHERE origin IN ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
	AND dest_city_name LIKE ('%CA')
GROUP BY origin_city_name, dest_city_name, carrier;

SELECT 
	AVG(arrival_delay),
	MIN(arrival_delay),
	MAX(arrival_delay),
	origin_city_name,
	dest_city_name,
	carrier
FROM airline_on_time_west_coast 
WHERE origin IN ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
	AND (dest_city_name LIKE ('%CA') or dest_city_name LIKE ('%NY'))
GROUP BY origin_city_name, dest_city_name, carrier;


Exercise #3: Use HAVING to filter aggregations 

SELECT *
FROM da_weather.us_weather_anomalies
LIMIT 100;

SELECT
	MIN(min_temp),
	station_name
FROM da_weather.us_weather_anomalies
WHERE date_ymd BETWEEN '2013-01-01' AND '2013-12-31' AND latitude > 36 
GROUP BY station_name
HAVING MIN(min_temp) <= -10;

SELECT
	MIN(min_temp)*1.8 +32,
	station_name
FROM da_weather.us_weather_anomalies
WHERE date_ymd BETWEEN '2013-01-01' AND '2013-12-31' AND latitude > 36 
GROUP BY station_name
HAVING (MIN(min_temp)*1.8 +32) < -0
