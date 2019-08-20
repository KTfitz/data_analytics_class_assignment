SELECT 
	starttime,
	DATE_PART ('hour', starttime) as Hour,
	DATE_Part ('minute', starttime) as Minute
FROM da_pronto.trip
LIMIT 100;

SELECT
	from_station_id,
	from_station_name,
	from_station_id || '_' || from_station_name AS station_id_name
FROM da_pronto.trip
LIMIT 100; 

SELECT
	from_station_name,
	to_station_name,
	AVG(tripduration)/3600 as Average_tripduration_Hours
FROM da_pronto.trip
GROUP BY 1, 2
LIMIT 100; 

SELECT
	from_station_name,
	to_station_name,
	AVG(tripduration)/3600 as Average_tripduration_Hours
FROM da_pronto.trip
GROUP BY 1, 2
LIMIT 100; 

SELECT
	from_station_name,
	to_station_name,
	AVG(tripduration)/3600 as Average_tripduration_Hours,
	cast (starttime as date) as trip_date,
	date_trunc('year', starttime)
FROM da_pronto.trip
GROUP BY 1, 2, starttime
LIMIT 100; 

SELECT *
FROM da_pronto.trip
LIMIT 10

SELECT 
	starttime,
	from_station_name,
	to_station_name,
	tripduration
FROM da_pronto.trip
WHERE cast(starttime as DATE) = '2015-07-01'
LIMIT 100;

SELECT 
	starttime,
	from_station_name,
	to_station_name,
	tripduration,
	CASE 
		WHEN from_station_name = to_station_name
		THEN 1
		ELSE 0
		END as stations_match
FROM da_pronto.trip
WHERE cast(starttime as DATE) = '2015-07-01'
LIMIT 100;

SELECT *
FROM public.airline_on_time_west_coast
LIMIT 100;

SELECT 
	flight_date,
	carrier,
	AVG(arrival_delay) as AVG_Arrival_Delay
FROM public.airline_on_time_west_coast
WHERE flight_date BETWEEN '2014-12-01' AND '2014-12-31' 
GROUP BY 1,2
LIMIT 1000;

SELECT 
	origin_city_name,
	flight_date,
	carrier,
	AVG(arrival_delay) as AVG_Arrival_Delay,
	CASE
		WHEN RIGHT(origin_city_name, 2) IN ('NY', 'CO', 'CA', 'WA','AZ')
		THEN true
		ELSE false
		END
FROM public.airline_on_time_west_coast
WHERE flight_date BETWEEN '2014-12-01' AND '2014-12-31' 
GROUP BY 1,2,3
LIMIT 1000;

SELECT *
From da_ingredients.ingredients
LIMIT 100;

SELECT 
	manufacturer, 
	categories, 
	features_value,
	CASE
		WHEN categories LIKE ('%Coffee%') THEN 'TRUE'
		WHEN categories LIKE ('%Tea%') THEN 'TRUE'
		WHEN categories LIKE ('%Cocoa%') THEN 'TRUE'
		Else 'FALSE' End AS hot_beverages
FROM da_ingredients.ingredients
LIMIT 1000;

SELECT 
	manufacturer, 
	categories, 
	features_value,
	CASE
		WHEN categories LIKE ('%Coffee%') THEN 'TRUE'
		WHEN categories LIKE ('%Tea%') THEN 'TRUE'
		WHEN categories LIKE ('%Cocoa%') THEN 'TRUE'
		Else 'FALSE' End AS hot_beverages,
	CASE
		WHEN categories LIKE ('%Gourmet Food%') THEN 'TRUE'
		Else 'FALSE' END AS gourmet_food
FROM da_ingredients.ingredients
LIMIT 1000