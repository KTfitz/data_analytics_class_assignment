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