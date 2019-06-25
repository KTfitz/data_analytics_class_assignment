SELECT *
From da_pronto.trip;

SELECT count (*)
FROM da_pronto.trip;

SELECT sum(tripduration), count(*) 
from da_pronto.trip

SELECT to_station_name, count(*), sum(tripduration)
from da_pronto.trip
GROUP BY to_station_name
ORDER BY sum(tripduration) ASC;

SELECT unique_carrier, count(unique_carrier)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY count ASC;

SELECT unique_carrier, sum(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier;

SELECT unique_carrier, avg(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY avg(arrival_delay) DESC;

SELECT unique_carrier, flight_num, MIN(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier, flight_num
ORDER BY MIN(arrival_delay) ASC;

SELECT unique_carrier, flight_num, MIN(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier, flight_num
ORDER BY MIN(arrival_delay) ASC;

SELECT origin_city_name, 
	origin, 
	unique_carrier, 
	AVG(arrival_delay) as avg_arrival_delay,
	MIN(arrival_delay) as min_arrival_delay,
	MAX(arrival_delay) as max_arrival_delay
FROM public.airline_on_time_west_coast
GROUP BY origin_city_name, origin, unique_carrier
ORDER BY origin_city_name, AVG(arrival_delay)