# data_analytics_class_assignment
SQL, Tableau and excel assignments for Galvanize Data Analytics

SELECT *
FROM da_weather.us_weather_anomalies
LIMIT 500

SELECT DISTINCT station_name
FROM da_weather.us_weather_anomalies

SELECT station_name, date_ymd, degrees_from_mean
FROM da_weather.us_weather_anomalies
LIMIT 1200

SELECT *
FROM da_pronto.trip

SELECT 
	from_station_name,
	to_station_name	
FROM da_pronto.trip
LIMIT 1000

SELECT DISTINCT
	from_station_name	
FROM da_pronto.trip

SELECT DISTINCT
	from_station_name,
	to_station_name	
FROM da_pronto.trip
Order by 
	from_station_name,
	to_station_name

SELECT
	from_station_name,
	to_station_name,
	starttime AS start_time, 
	tripduration
FROM da_pronto.trip
Order by 
	tripduration DESC
LIMIT 600